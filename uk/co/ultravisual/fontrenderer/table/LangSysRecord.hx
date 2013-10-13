package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class LangSysRecord {
    public var tag:Int;
    public var offset:Int;

    public function new(di:GlyphByteArray):Void {
        tag = di.readInt();
        offset = di.readUnsignedShort();
    }

    public function getTagAsString():String {
        var sb = new StringBuffer();
        sb.append(String.fromCharCode((tag >> 16) & 0xff));
        sb.append(String.fromCharCode((tag >> 8) & 0xff));
        sb.append(String.fromCharCode((tag) & 0xff));
        return sb.toString();
    }
}
