package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class FeatMinMaxRecord {
    private var _tag:Int;
    private var _minCoordOffset:Int;
    private var _maxCoordOffset:Int;

    public function new(di:GlyphByteArray):Void {
        _tag = di.readInt();
        _minCoordOffset = di.readUnsignedShort();
        _maxCoordOffset = di.readUnsignedShort();
    }
}
