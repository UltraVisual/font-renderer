package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.table.base.BaseTable;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class MinMax {
    private var _minCoordOffset:Int;
    private var _maxCoordOffset:Int;
    private var _featMinMaxCount:Int;
    private var _featMinMaxRecord:CappedArray<FeatMinMaxRecord>;

    public function new(minMaxOffset:Int, bt:BaseTable):Void {
        var di:GlyphByteArray = bt.getDataInputForOffset(minMaxOffset);
        _minCoordOffset = di.readUnsignedShort();
        _maxCoordOffset = di.readUnsignedShort();
        _featMinMaxCount = di.readUnsignedShort();
        _featMinMaxRecord = new CappedArray<FeatMinMaxRecord>(_featMinMaxCount);
        for (i in 0..._featMinMaxCount) {
            _featMinMaxRecord.add(new FeatMinMaxRecord(di));
        }
    }
}
