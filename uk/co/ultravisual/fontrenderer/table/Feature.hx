package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Feature {
    private var _featureParams:UInt;
    public var lookupCount:Int;
    private var _lookupListIndex:CappedArray<UInt>;

    public function new(di:GlyphByteArray):Void {
        _featureParams = di.readUnsignedShort();
        lookupCount = di.readUnsignedShort();
        _lookupListIndex = new CappedArray<UInt>(lookupCount);

        for (i in 0...lookupCount) {
            _lookupListIndex.add(di.readUnsignedShort());
        }
    }

    public function getLookupListIndex(i:UInt):UInt {
        return _lookupListIndex.get(i);
    }
}
