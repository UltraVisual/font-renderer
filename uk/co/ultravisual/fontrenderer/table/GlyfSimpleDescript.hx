package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.table.GlyfDescript;
import uk.co.ultravisual.fontrenderer.table.GlyfDescript;
import uk.co.ultravisual.fontrenderer.errors.ArrayIndexOutOfBoundError;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class GlyfSimpleDescript extends GlyfDescript {
    private var _endPtsOfContours:CappedArray<Int>;
    private var _flags:CappedArray<Int>;
    private var _xCoordinates:CappedArray<Int>;
    private var _yCoordinates:CappedArray<Int>;
    private var _count:Int;
    private var name:Float;

    public function new(parentTable:GlyfTable, glyphIndex:Int, numberOfContours:Int, di:GlyphByteArray):Void {
        super(parentTable, glyphIndex, numberOfContours, di);
        name = Math.floor(Math.random() * 10000);
        _endPtsOfContours = new CappedArray<Int>( numberOfContours );

        for (i in 0...numberOfContours) {
            _endPtsOfContours.add(di.readShort());
        }

        _count = _endPtsOfContours.get(numberOfContours - 1) + 1;
        _flags = new CappedArray<Int>( _count );
        _xCoordinates = new CappedArray<Int>( _count );
        _yCoordinates = new CappedArray<Int>( _count );

        var instructionCount:Int = di.readShort();
        readInstructions(di, instructionCount);
        readFlags(_count, di);
        readCoords(_count, di);
    }

    override public function getEndPtOfContours(i:Int):Int {
        return _endPtsOfContours.get(i);
    }

    override public function getFlags(i:Int):Int {
        return _flags.get(i);
    }

    override public function getXCoordinate(i:Int):Int {
        return _xCoordinates.get(i);
    }

    override public function getYCoordinate(i:Int):Int {
        return _yCoordinates.get(i);
    }

    override public function isComposite():Bool {
        return false;
    }

    override public function getPointCount():Int {
        return _count;
    }

    override public function getContourCount():Int {
        return getNumberOfContours();
    }

/**
	     * The table is stored as relative values, but we'll store them as absolutes
	     */

    public function readCoords(count:Int, di:GlyphByteArray):Void {
        var x:Int = 0;
        var y:Int = 0;

        for (i in 0...count) {
            var xShortVector = GlyfDescript.xShortVector;
            var xDual = GlyfDescript.xDual;
            if ((_flags.get(i) & xDual) != 0) {
                if ((_flags.get(i) & xShortVector) != 0) {
                    x += di.readUnsignedByte();
                }
            } else {
                if ((_flags.get(i) & xShortVector) != 0) {
                    x += -(di.readUnsignedByte());
                } else {
                    x += di.readShort();
                }
            }
            _xCoordinates.add(x);
        }

        for (i in 0...count) {
            if ((_flags.get(i) & GlyfDescript.yDual) != 0) {
                if ((_flags.get(i) & GlyfDescript.yShortVector) != 0) {
                    y += di.readUnsignedByte();
                }
            } else {
                if ((_flags.get(i) & GlyfDescript.yShortVector) != 0) {
                    y += -(di.readUnsignedByte());
                } else {
                    y += di.readShort();
                }
            }
            _yCoordinates.add(y);
        }
    }

/**
	     * The flags are run-length encoded
	     */

    private function readFlags(flagCount:Int, di:GlyphByteArray):Void {
        try {
            var index = 0;
            while (index < flagCount) {
                _flags.add(di.readByte());
                var repeat = GlyfDescript.repeat;
                if ((_flags.get(index) & repeat) != 0) {
                    var repeats:Int = di.readByte();
                    var i = 1;
                    while (i <= repeats) {
                        _flags.addAt(index + i, _flags.get(index));
                        i++;
                    }
                    index += repeats;
                }
                index++;
            }
        } catch (e:ArrayIndexOutOfBoundError) {
            trace("error: array index out of bounds");
        }
    }

    override public function toString():String {
        var i:Int;
        var sb:StringBuffer = new StringBuffer();
        sb.append(super.toString());
        sb.append("\n\n        EndPoInts\n        ---------");

        for (i in 0..._endPtsOfContours.size()) {
            sb.append("\n          ").append(i).append(": ").append(_endPtsOfContours.get(i));
        }
        sb.append("\n\n          Length of Instructions: ");
        sb.append(getInstructions().length).append("\n");

        sb.append(Disassembler.disassemble(getInstructions(), 8));
        sb.append("\n        Flags\n        -----");

        for (i in 0..._flags.size()) {
            sb.append("\n          ").append(i).append(":  ");
            if ((_flags.get(i) & 0x20) != 0) {
                sb.append("YDual ");
            } else {
                sb.append("      ");
            }
            if ((_flags.get(i) & 0x10) != 0) {
                sb.append("XDual ");
            } else {
                sb.append("      ");
            }
            if ((_flags.get(i) & 0x08) != 0) {
                sb.append("Repeat ");
            } else {
                sb.append("       ");
            }
            if ((_flags.get(i) & 0x04) != 0) {
                sb.append("Y-Short ");
            } else {
                sb.append("        ");
            }
            if ((_flags.get(i) & 0x02) != 0) {
                sb.append("X-Short ");
            } else {
                sb.append("        ");
            }
            if ((_flags.get(i) & 0x01) != 0) {
                sb.append("On");
            } else {
                sb.append("  ");
            }
        }
        sb.append("\n\n        Coordinates\n        -----------");
        var oldX:Int = 0;
        var oldY:Int = 0;

        for (i in 0..._xCoordinates.size()) {
            sb.append("\n          ").append(i);
            sb.append(": Rel (").append(_xCoordinates.get(i) - oldX);
            sb.append(", ").append(_yCoordinates.get(i) - oldY);
            sb.append(")  ->  Abs (").append(_xCoordinates.get(i));
            sb.append(", ").append(_yCoordinates.get(i)).append(")");
            oldX = _xCoordinates.get(i);
            oldY = _yCoordinates.get(i);
        }
        return sb.toString();
    }
}
