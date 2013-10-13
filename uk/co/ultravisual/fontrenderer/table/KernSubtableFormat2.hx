package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class KernSubtableFormat2 extends KernSubtable{

    private var rowWidth:UInt;
    private var leftClassTable:UInt;
    private var rightClassTable:UInt;
    private var array:UInt;

/**
	     *
	     * @param di
	     * @throws IOError
	     */

    public function new(di:GlyphByteArray):Void {
        super();
        rowWidth = di.readUnsignedShort();
        leftClassTable = di.readUnsignedShort();
        rightClassTable = di.readUnsignedShort();
        array = di.readUnsignedShort();
    }

    override public function getKerningPairCount():UInt {
        return 0;
    }

    override public function getKerningPair(i:UInt):KerningPair {
        return null;
    }
}
