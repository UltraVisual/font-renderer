package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class LookupList {
    public var lookupCount:UInt;
    private var _lookupOffsets:CappedArray<Int>;
    private var _lookups:CappedArray<Lookup>;

    public function new(dis:GlyphByteArray, offset:UInt, factory:ILookupSubtableFactory):Void {
        var i:UInt;
        dis.setPosition(offset);

        lookupCount = dis.readUnsignedShort();
        _lookupOffsets = new CappedArray<Int>( lookupCount );
        _lookups = new CappedArray<Lookup>( lookupCount );

        for (i in 0...lookupCount) {
            _lookupOffsets.add(dis.readUnsignedShort());
        }

        for (i in 0...lookupCount) {
            _lookups.add(new Lookup(factory, dis, offset + _lookupOffsets.get(i)));
        }
    }

    public function getLookupOffset(i:UInt):UInt {
        return _lookupOffsets.get(i);
    }

    public function getLookup(i:UInt):Lookup {
        return _lookups.get(i);
    }

    public function getLookupFeature(feature:Feature, index:Int):String {
        if (feature.lookupCount > index) {
            var i:Int = feature.getLookupListIndex(index);
            return Std.string(_lookups.get(i));
        }
        return null;
    }
}
