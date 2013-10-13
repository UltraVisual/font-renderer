package uk.co.ultravisual.fontrenderer.table.base;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class BaseLangSysRecord {
    private var _baseLangSysTag:Int;
    private var _minMaxOffset:Int;

    public function new(di:GlyphByteArray):Void {
        _baseLangSysTag = di.readInt();
        _minMaxOffset = di.readUnsignedShort();
    }

    public function getBaseLangSysTag():Int {
        return _baseLangSysTag;
    }

    public function getMinMaxOffset():Int {
        return _minMaxOffset;
    }
}
