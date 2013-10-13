package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class KernSubtableFormat0 extends KernSubtable {

    private var nPairs:UInt;
    private var searchRange:UInt;
    private var entrySelector:UInt;
    private var rangeShift:UInt;
    private var kerningPairs:CappedArray<KerningPair>; // KerningPair[]


/**
	     *
	     * @param di
	     * @throws IOError
	     */

    public function new(di:GlyphByteArray):Void {
        super();
        nPairs = di.readUnsignedShort();
        searchRange = di.readUnsignedShort();
        entrySelector = di.readUnsignedShort();
        rangeShift = di.readUnsignedShort();

        kerningPairs = new CappedArray<KerningPair>( nPairs );

        for (i in 0...nPairs) {
            kerningPairs.add(new KerningPair(di));
        }
    }

    override public function getKerningPairCount():UInt {
        return nPairs;
    }

    override public function getKerningPair(i:UInt):KerningPair {
        return kerningPairs.get(i);
    }
}
