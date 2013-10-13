package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class LangSys {
    private var _lookupOrder:Int;
    private var _reqFeatureIndex:Int;
    private var _featureCount:Int;
    private var _featureIndex:CappedArray<Int>;

    public function new(di:GlyphByteArray):Void {
        _lookupOrder = di.readUnsignedShort();
        _reqFeatureIndex = di.readUnsignedShort();
        _featureCount = di.readUnsignedShort();
        _featureIndex = new CappedArray<Int>(_featureCount);

        for (i in 0..._featureCount) {
            _featureIndex.add(di.readUnsignedShort());
        }
    }

    public function getLookupOrder():Int {
        return _lookupOrder;
    }

    public function getReqFeatureIndex():Int {
        return _reqFeatureIndex;
    }

    public function getFeatureCount():Int {
        return _featureCount;
    }

    public function getFeatureIndex(i:UInt):Int {
        return _featureIndex.get(i);
    }

    public function isFeatureIndexed(n:Int):Bool {
        for (i in 0..._featureCount) {
            if (_featureIndex.get(i) == n) {
                return true;
            }
        }
        return false;
    }
}
