package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.table.Range;
import uk.co.ultravisual.fontrenderer.errors.ArrayIndexOutOfBoundError;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class CmapFormatUnknown extends CmapFormat {

    public function new(_format:Int, di:GlyphByteArray):Void {
        super(di);
        format = _format;

        di.setPosition(di.getPosition() + (length - 4));
    }

    override private function getRangeCount():Int {
        return 0;
    }

    override public function getRange(index:Int):Range {
        throw new ArrayIndexOutOfBoundError();
        return null;
    }

    override public function mapCharCode(charCode:Int):Int {
        return 0;
    }
}
