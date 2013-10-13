package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
class KernTable extends Table{

    private var version:UInt;
    private var nTables:UInt;
    private var tables:CappedArray<KernSubtable>; // KernSubtable[]

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.kern);

        version = di.readUnsignedShort();
        nTables = di.readUnsignedShort();
        tables = new CappedArray<KernSubtable>( nTables );

        for (i in 0...nTables) {
            tables.add(KernSubtable.read(di));
        }
    }

    public function getSubtableCount():UInt {
        return nTables;
    }

    public function getSubtable(i:Int):KernSubtable {
        return tables.get(i);
    }
}
