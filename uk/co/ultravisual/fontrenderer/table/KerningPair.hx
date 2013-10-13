package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class KerningPair {
    public var left:UInt;
    public var right:UInt;
    public var value:Int;

    public function new(di:GlyphByteArray):Void {
        left = di.readUnsignedShort();
        right = di.readUnsignedShort();
        value = di.readShort();
    }
}
