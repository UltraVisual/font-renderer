package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class CoverageFormat2 extends Coverage {
    private var _rangeCount:UInt;
    private var _rangeRecords:CappedArray<RangeRecord>;

    public function new(di:GlyphByteArray):Void {
        super();
        _rangeCount = di.readUnsignedShort();
        _rangeRecords = new CappedArray<RangeRecord>( _rangeCount );

        for (i in 0..._rangeCount) {
            _rangeRecords.add(new RangeRecord(di));
        }
    }

    override private function getFormat():Int {
        return 2;
    }

    override public function findGlyph(glyphId:Int):Int {
        var n:Int;
        for (i in 0..._rangeCount) {
            n = _rangeRecords.get(i).getCoverageIndex(glyphId);
            if (n > -1) {
                return n;
            }
        }
        return -1;
    }
}
