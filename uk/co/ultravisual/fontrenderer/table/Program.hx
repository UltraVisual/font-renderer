package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Program extends Table{
    private var instructions:CappedArray<Int>;

    public function new(de:DirectoryEntry, type:Int):Void {
        super(de, type);
    }

    public function getInstructions():Array<Int> {
        return instructions.toArray();
    }

    function readInstructions(di:GlyphByteArray, count:Int):Void {
        instructions = new CappedArray<Int>( count );

        for (i in 0...count) {
            instructions.add(di.readUnsignedByte());
        }
    }
}
