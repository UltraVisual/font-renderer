package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class FpgmTable extends Program{
    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.fpgm);

        readInstructions(di, de.length);
    }

    public function toString():String {
        return Disassembler.disassemble(getInstructions(), 0);
    }
}
