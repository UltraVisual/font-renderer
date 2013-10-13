package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.table.SignatureBlock;
import uk.co.ultravisual.fontrenderer.table.DsigEntry;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.table.DirectoryEntry;
import uk.co.ultravisual.fontrenderer.table.Table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class DsigTable extends Table {
    private var version:Int;
    private var numSigs:UInt;
    private var flag:UInt;
    private var dsigEntry:CappedArray<DsigEntry>; // DsigEntry
    private var sigBlocks:CappedArray<SignatureBlock>; // SigBlock

/** 
	    * Creates new DsigTable 
	    */

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.DSIG);

        version = di.readInt();
        numSigs = di.readUnsignedShort();
        flag = di.readUnsignedShort();
        dsigEntry = new CappedArray<DsigEntry>(numSigs);
        sigBlocks = new CappedArray<SignatureBlock>(numSigs);

        var i:UInt;
        for (i in 0...numSigs) {
            dsigEntry.add(new DsigEntry(di));
        }

        for (i in 0...numSigs) {
            sigBlocks.add(new SignatureBlock(di));
        }
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer().append("DSIG\n");
        for (i in 0...numSigs) {
            sb.append(sigBlocks.get(i).toString());
        }
        return sb.toString();
    }
}