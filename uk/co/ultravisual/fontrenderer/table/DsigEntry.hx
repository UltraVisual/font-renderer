package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class DsigEntry {

    public var format:Int;
    public var length:Int;
    public var offset:Int;

    public function new(di:GlyphByteArray):Void {
        format = di.readInt();
        length = di.readInt();
        offset = di.readInt();
    }
}
