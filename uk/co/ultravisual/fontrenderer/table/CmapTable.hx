package uk.co.ultravisual.fontrenderer.table;

import flash.errors.Error;
import uk.co.ultravisual.fontrenderer.table.Table;
import uk.co.ultravisual.fontrenderer.collection.ArrayUtils;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import flash.errors.IOError;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class CmapTable extends Table {

    public var version:UInt;
    public var tablesCount:UInt;
    public var entries:CappedArray<CmapIndexEntry>;

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.cmap);

        version = di.readUnsignedShort();
        tablesCount = di.readUnsignedShort();

        var i:UInt;
        var bytesRead:Int = 4;
        entries = new CappedArray<CmapIndexEntry>( tablesCount );

        for (i in 0...tablesCount) {
            entries.add(new CmapIndexEntry(di));
            bytesRead += 8;
        }

        entries.sortOn("offset", ArrayUtils.NUMERIC);

        var lastOffset:Int = 0;
        var lastFormat:CmapFormat = null;

        for (i in 0...tablesCount) {
            if (entries.get(i).offset == lastOffset) {
                entries.get(i).format = lastFormat;
                continue;

            } else if (entries.get(i).offset > bytesRead) {
                di.increasePosition((entries.get(i).offset - bytesRead));
            } else if (entries.get(i).offset != bytesRead) {
                throw new IOError('IOException');
            }

            try {
                var formatType:UInt = di.readUnsignedShort();
                lastFormat = CmapFormat.create(formatType, di);
                lastOffset = entries.get(i).offset;
                entries.get(i).format = lastFormat;
                bytesRead += lastFormat.length;
            }
            catch (err:Error) {
                //de nada
            }
        }
    }

    public function getCmapIndexEntry(i:UInt):CmapIndexEntry {
        return entries.get(i);
    }


    public function getCmapFormat(platformId:Int, encodingId:Int):CmapFormat {
        for (i in 0...tablesCount) {
            if (entries.get(i).platformId == platformId && entries.get(i).encodingId == encodingId) {
                return entries.get(i).format;
            }
        }
        return null;
    }


    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("cmap\n");

        for (i in 0...tablesCount) {
            sb.append("\t");
            sb.append(entries.get(i).toString());
            sb.append("\n");
        }
        return sb.toString();
    }
}
