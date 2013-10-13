package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class RangeRecord {
    private var _start:Int;
    private var _end:Int;
    private var _startCoverageIndex:Int;

    public function new(di:GlyphByteArray):Void {
        _start = di.readUnsignedShort();
        _end = di.readUnsignedShort();
        _startCoverageIndex = di.readUnsignedShort();
    }

    public function isInRange(glyphId:Int):Bool {
        return (_start <= glyphId && glyphId <= _end);
    }

    public function getCoverageIndex(glyphId:Int):Int {
        if (isInRange(glyphId)) {
            return _startCoverageIndex + glyphId - _start;
        }
        return -1;
    }
}
