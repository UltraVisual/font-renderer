package uk.co.ultravisual.fontrenderer.table;
import flash.errors.Error;
import uk.co.ultravisual.fontrenderer.errors.ArrayIndexOutOfBoundError;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class CmapFormat2 extends CmapFormat {

    private static var _subHeaderKeys:CappedArray<Int> = new CappedArray<Int>(256);
    private var _subHeaders:CappedArray<SubHeader>;
    private var _glyphIndexArray:CappedArray<Int>;

    public function new(di:GlyphByteArray):Void {
        super(di);
        format = 2;
        var pos:Int = 6;

        var highest:Float = 0;
        var i:UInt;

        for (i in 0...256) {
            _subHeaderKeys.add(di.readUnsignedShort());
            highest = Math.max(highest, _subHeaderKeys.get(i));
            pos += 2;
        }

        var subHeaderCount:Float = highest / 8 + 1;
        _subHeaders = new CappedArray<SubHeader>( subHeaderCount );

        var indexArrayOffset:Float = 8 * subHeaderCount + 518;
        highest = 0;
        var top = toInt(subHeaderCount);
        for (i in 0...top) {
            var sh:SubHeader = new SubHeader();
            sh.firstCode = di.readUnsignedShort();
            sh.entryCount = di.readUnsignedShort();
            sh.idDelta = di.readShort();
            sh.idRangeOffset = di.readUnsignedShort();

            pos += 8;
            sh.arrayIndex = Std.int((pos - 2 + sh.idRangeOffset - indexArrayOffset) / 2);

            highest = Math.max(highest, sh.arrayIndex + sh.entryCount);
            _subHeaders.addAt(i, sh);
        }

        _glyphIndexArray = new CappedArray<Int>( highest );


        var high = toInt(highest);
        for (i in 0...high) {
            try {
                _glyphIndexArray.add(di.readUnsignedShort());
            }
            catch (err:Error) {
                break;
            }
        }
    }

    private function toInt(float:Float):Int {
        return Std.parseInt(float + "");
    }

    public function getSubHeaders():CappedArray<SubHeader> {
        return _subHeaders;
    }

    override private function getRangeCount():Int {
        return _subHeaders.size();
    }

    override public function getRange(index:Int):Range {
        if (index < 0 || index >= _subHeaders.size()) {
            throw new ArrayIndexOutOfBoundError();
        }

        var highByte:Int = 0;
        if (index != 0) {
            for (i in 0...256) {
                if (_subHeaderKeys.get(i) / 8 == index) {
                    highByte = i << 8;
                    break;
                }
            }
        }
        return new Range( highByte | _subHeaders.get(index).firstCode, highByte | ( _subHeaders.get(index).firstCode + _subHeaders.get(index).entryCount - 1) );
    }


    override public function mapCharCode(charCode:Int):Int {
        var index:Int = 0;
        var highByte:Int = charCode >> 8;

        if (highByte != 0) {
            index = Std.parseInt((_subHeaderKeys.get(highByte) / 8) + "");
        }
        var sh:SubHeader = _subHeaders.get(index);

        var lowByte:Int = charCode & 0xff;
        if (lowByte < sh.firstCode || lowByte >= (sh.firstCode + sh.entryCount))
            return 0;

        var glyphIndex:Int = _glyphIndexArray.get(sh.arrayIndex + (lowByte - sh.firstCode));
        if (glyphIndex != 0) {
            glyphIndex += sh.idDelta;
            glyphIndex %= 65536;
        }
        return glyphIndex;
    }
}
