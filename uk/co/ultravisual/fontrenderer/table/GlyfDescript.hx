package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.errors.NonImplementationError;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class GlyfDescript extends Program {
    public static var onCurve:Int = 0x01;
    public static var xShortVector:Int = 0x02;
    public static var yShortVector:Int = 0x04;
    public static var repeat:Int = 0x08;
    public static var xDual:Int = 0x10;
    public static var yDual:Int = 0x20;

    private var _parentTable:GlyfTable;

    private var _glyphIndex:Int;
    private var _numberOfContours:Int;
    private var _xMin:Int;
    private var _yMin:Int;
    private var _xMax:Int;
    private var _yMax:Int;

    public function new(parentTable:GlyfTable, glyphIndex:Int, numberOfContours:Int, di:GlyphByteArray):Void {
        super(parentTable.getDirectoryEntry(), parentTable.getType());
        _parentTable = parentTable;
        _numberOfContours = numberOfContours;
        _xMin = di.readShort();
        _yMin = di.readShort();
        _xMax = di.readShort();
        _yMax = di.readShort();
    }

    public function getNumberOfContours():Int {
        return _numberOfContours;
    }

    public function getGlyphIndex():Int {
        return _glyphIndex;
    }

    public function getXMaximum():Int {
        return _xMax;
    }

    public function getXMinimum():Int {
        return _xMin;
    }

    public function getYMaximum():Int {
        return _yMax;
    }

    public function getYMinimum():Int {
        return _yMin;
    }


    public function getPointCount():Int {
        throw new NonImplementationError();
        return 0;
    }

    public function getContourCount():Int {
        throw new NonImplementationError();
        return 0;
    }

    public function getEndPtOfContours(i:Int):Int {
        throw new NonImplementationError();
        return 0;
    }

    public function getFlags(i:Int):Int {
        throw new NonImplementationError();
        return 0;
    }

    public function getXCoordinate(i:Int):Int {
        throw new NonImplementationError();
        return 0;
    }

    public function getYCoordinate(i:Int):Int {
        throw new NonImplementationError();
        return 0;
    }

    public function isComposite():Bool {
        throw new NonImplementationError();
        return false;
    }

    public function toString():String {
        var sb = new StringBuffer();
        sb.append("          numberOfContours: ").append(_numberOfContours);
        sb.append("\n          xMin:             ").append(_xMin);
        sb.append("\n          yMin:             ").append(_yMin);
        sb.append("\n          xMax:             ").append(_xMax);
        sb.append("\n          yMax:             ").append(_yMax);
        return sb.toString();
    }
}
