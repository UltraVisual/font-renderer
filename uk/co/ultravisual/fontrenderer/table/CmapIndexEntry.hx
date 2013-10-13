package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class CmapIndexEntry {

    public var platformId:Int;
    public var encodingId:Int;
    public var offset:Int;
    public var format:CmapFormat;

    public function new(di:GlyphByteArray):Void {
        platformId = di.readUnsignedShort();
        encodingId = di.readUnsignedShort();
        offset = di.readInt();
    }

    public function toString():String {
        var sb = new StringBuffer();
        sb.append("platform id: ");
        sb.append(platformId);
        sb.append(" (");
        sb.append(ID.getPlatformName(platformId));
        sb.append("), encoding id: ");
        sb.append(encodingId);
        sb.append(" (");
        sb.append(ID.getEncodingName(platformId, encodingId));
        sb.append("), offset: ");
        return sb.append(offset).toString();
    }

    public function compareTo(obj:Dynamic):Int {
        var entry:CmapIndexEntry = obj;

        if (offset < entry.offset) {
            return -1;
        } else if (offset > entry.offset) {
            return 1;
        } else {
            return 0;
        }
    }
}
