package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.errors.ArrayIndexOutOfBoundError;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class CmapFormat0 extends CmapFormat{

    private var _glyphIdArray:Array = new Array(256);

    function new(di:GlyphByteArray):Void {
        super(di);
        format = 0;

        for (i in 0...256)
        {
        _glyphIdArray[i] = di.readUnsignedByte();
        }
    }

    override private function getRangeCount():Int {
        return 1;
    }

    override public function getRange(index:Int):Range {
        if (index != 0) {
            throw new ArrayIndexOutOfBoundError();
        }
        return new Range(0, 255);
    }

    override public function mapCharCode(charCode:Int):Int {
        if (0 <= charCode && charCode < 256) {
            return _glyphIdArray[charCode];
        } else {
            return 0;
        }
    }
}
