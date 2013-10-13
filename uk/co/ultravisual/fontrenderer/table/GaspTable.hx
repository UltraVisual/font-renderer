package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class GaspTable extends Table{

    private var version:UInt;
    private var numRanges:UInt;
    private var gaspRange:CappedArray<GaspRange>; // GaspRange[]

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.gasp);

        version = di.readUnsignedShort();
        numRanges = di.readUnsignedShort();
        gaspRange = new CappedArray<GaspRange>( numRanges );

        for (i in 0...numRanges) {
            gaspRange.add(new GaspRange(di));
        }
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("'gasp' Table - Grid-fitting And Scan-conversion Procedure\n---------------------------------------------------------");
        sb.append("\n  'gasp' version:      ").append(version);
        sb.append("\n  numRanges:           ").append(numRanges);

        for (i in 0...numRanges) {
            sb.append("\n\n  gasp Range ").append(i).append("\n");
            sb.append(gaspRange.get(i).toString());
        }
        return sb.toString();
    }
}
