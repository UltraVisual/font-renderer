package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class DirectoryEntry {

    public var tag:Int;
    public var checksum:Int;
    public var offset:Int;
    public var length:Int;

    public function new(di:GlyphByteArray = null):Void {
        if (di != null) {
            tag = di.readInt();
            checksum = di.readInt();
            offset = di.readInt();
            length = di.readInt();
        }
    }

    public function getLength():Int {
        return length;
    }

    public function clone():DirectoryEntry {
        var d:DirectoryEntry = new DirectoryEntry();
        d.tag = tag;
        d.checksum = checksum;
        d.offset = offset;
        d.length = length;
        return d;
    }

    public function getTagAsString():String {
        var tagOne = String.fromCharCode((tag >> 24) & 0xff);
        var tagTwo = String.fromCharCode((tag >> 16) & 0xff);
        var tagThree = String.fromCharCode((tag >> 8) & 0xff);
        var tagFour = String.fromCharCode((tag) & 0xff);
        return tagOne + tagTwo + tagThree + tagFour;
    }


    public function toString():String {
        return "'" + getTagAsString()
        + "' - chksm = 0x" + Std.string(checksum)
        + ", off = 0x" + Std.string(offset)
        + ", len = " + length;
    }
}
