package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Group {
    private var _recs:UInt;
    private var _startsz:UInt;
    private var _endsz:UInt;
    private var _entry:CappedArray<VTableRecord>;

    public function new(di:GlyphByteArray):Void {
        _recs = di.readUnsignedShort();
        _startsz = di.readUnsignedByte();
        _endsz = di.readUnsignedByte();

        _entry = new CappedArray<VTableRecord>( _recs );

        for (i in 0..._recs) {
            _entry.add(new VTableRecord(di));
        }
    }

    public function getRecs():UInt {
        return _recs;
    }

    public function getStartSZ():UInt {
        return _startsz;
    }

    public function getEndSZ():UInt {
        return _endsz;
    }

    public function getEntry():CappedArray<VTableRecord> {
        return _entry;
    }
}
