package uk.co.ultravisual.fontrenderer.table.base;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class BaseScriptRecord {
    private var _baseScriptTag:Int;
    private var _baseScriptOffset:Int;

    public function new(di:GlyphByteArray):Void {
        _baseScriptTag = di.readInt();
        _baseScriptOffset = di.readUnsignedShort();
    }

    public function getBaseScriptTag():Int {
        return _baseScriptTag;
    }

    public function getBaseScriptOffset():Int {
        return _baseScriptOffset;
    }
}
