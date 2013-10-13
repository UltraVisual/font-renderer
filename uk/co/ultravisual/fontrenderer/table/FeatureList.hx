package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.table.LangSys;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.table.Feature;
import uk.co.ultravisual.fontrenderer.table.FeatureRecord;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class FeatureList {

    public var _featureCount:UInt;
    private var _featureRecords:CappedArray<FeatureRecord>;
    private var _features:CappedArray<Feature>;

    public function new(dis:GlyphByteArray, offset:UInt):Void {
        var i:UInt;
        dis.setPosition(offset);

        _featureCount = dis.readUnsignedShort();
        _featureRecords = new CappedArray<FeatureRecord>( _featureCount );
        _features = new CappedArray<Feature>( _featureCount );

        for (i in 0..._featureCount) {
            _featureRecords.add(new FeatureRecord(dis));
        }

        for (i in 0..._featureCount) {
            dis.setPosition(0);
            dis.increasePosition(offset + _featureRecords.get(i).offset);
            _features.add(new Feature(dis));
        }
    }


    public function getFeatureRecord(i:UInt):FeatureRecord {
        return _featureRecords.get(i);
    }

    public function getFeature(i:UInt):Feature {
        return _features.get(i);
    }

    public function findFeature(langSys:LangSys, tag:String):Feature {
        if (tag.length != 4) {
            return null;
        }

        var tagVal:Int = ((tag.charCodeAt(0) << 24) | (tag.charCodeAt(1) << 16) | (tag.charCodeAt(2) << 8) | tag.charCodeAt(3));

        for (i in 0..._featureCount) {
            if (_featureRecords.get(i).getTag() == tagVal) {
                if (langSys.isFeatureIndexed(i)) {
                    return _features.get(i);
                }
            }
        }
        return null;
    }
}