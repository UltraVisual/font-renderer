package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
class TTCHeader {
    public static var ttcf:Int = 0x74746366;

    private var ttcTag:Int;
    private var version:Int;
    public var directoryCount:Int;
    private var tableDirectory:CappedArray<Int>; // Int[]
    private var dsigTag:Int;
    private var dsigLength:Int;
    private var dsigOffset:Int;

/**
		 *
		 * @param di
		 * @throws IOError
		 */

    public function new(di:GlyphByteArray):Void {
        ttcTag = di.readInt();
        version = di.readInt();
        directoryCount = di.readInt();
        tableDirectory = new CappedArray<Int>( directoryCount );

        for (i in 0...directoryCount) {
            tableDirectory.add(di.readInt());
        }
        if (version == 0x00010000) {
            dsigTag = di.readInt();
        }

        dsigLength = di.readInt();
        dsigOffset = di.readInt();
    }

    public function getTableDirectory(i:UInt):Int {
        return tableDirectory.get(i);
    }

    public static function isTTC(di:GlyphByteArray):Bool {
        var ttcTag:Int = di.readInt();
        return ttcTag == ttcf;
    }
}
