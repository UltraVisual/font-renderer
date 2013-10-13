package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class LtshTable extends Table {

    private var de:DirectoryEntry;
    private var version:UInt;
    private var numGlyphs:UInt;
    private var yPels:CappedArray<Int>; // int

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.LTSH);

        version = di.readUnsignedShort();
        numGlyphs = di.readUnsignedShort();
        yPels = new CappedArray<Int>( numGlyphs );

        for (i in 0...numGlyphs) {
            yPels.add(di.readUnsignedByte());
        }
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();

        sb.append("'LTSH' Table - Linear Threshold Table\n-------------------------------------");
        sb.append("\n 'LTSH' Version:       ").append(version);
        sb.append("\n Number of Glyphs:     ").append(numGlyphs);
        sb.append("\n\n   Glyph #   Threshold\n   -------   ---------\n");

        for (i in 0...numGlyphs) {
            sb.append("   ").append(i).append(".        ").append(yPels.get(i)) .append("\n");
        }
        return sb.toString();
    }
}
