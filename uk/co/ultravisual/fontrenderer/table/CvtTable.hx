package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class CvtTable extends Table {
    public var values:CappedArray<Int>;

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.cvt);

        var len:Int = cast de.length / 2;
        values = new CappedArray<Int>( len );
        for (i in 0...len) {
            values.add(di.readShort());
        }
    }

    public function get_values():CappedArray<Int> {
        return values.clone();
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("'cvt ' Table - Control Value Table\n----------------------------------\n");
        sb.append("Size = ");
        sb.append(0);
        sb.append(" bytes, ");
        sb.append(values.size());
        sb.append(" entries\n");
        sb.append("        Values\n        ------\n");
        for (i in 0...values.size()) {
            sb.append("        ");
            sb.append(i);
            sb.append(": ");
            sb.append(values.get(i));
            sb.append("\n");
        }
        return sb.toString();
    }
}
