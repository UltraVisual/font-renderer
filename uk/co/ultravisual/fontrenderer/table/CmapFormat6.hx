package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.errors.ArrayIndexOutOfBoundError;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class CmapFormat6 extends CmapFormat {

    private var _firstCode:Int;
    private var _entryCount:Int;
    private var _glyphIdArray:Array<Int>; // short[]

    public function new(di:GlyphByteArray):Void {
        super(di);
        format = 6;
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
