package uk.co.ultravisual.fontrenderer.table.base;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.table.base.BaseTable;
import uk.co.ultravisual.fontrenderer.table.base.BaseCoordFormat3;
import uk.co.ultravisual.fontrenderer.table.base.BaseCoordFormat2;
import uk.co.ultravisual.fontrenderer.table.base.BaseCoordFormat1;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class BaseValues {
    private var _defaultIndex:Int;
    private var _baseCoordCount:Int;
    private var _baseCoordOffset:CappedArray<UInt>;
    private var _baseCoords:CappedArray<BaseCoord>;

    public function new(baseValuesOffset:Int, bt:BaseTable):Void {
        var di:GlyphByteArray = bt.getDataInputForOffset(baseValuesOffset);
        _defaultIndex = di.readUnsignedShort();
        _baseCoordCount = di.readUnsignedShort();
        _baseCoordOffset = new CappedArray<UInt>(_baseCoordCount);
        for (i in 0..._baseCoordCount) {
            _baseCoordOffset.add(di.readUnsignedShort());
        }
        _baseCoords = new CappedArray<BaseCoord>(_baseCoordCount);

        for (i in 0..._baseCoordCount) {
            var format:Int = di.readUnsignedShort();
            switch (format) {
                case 1:
                    _baseCoords.add(new BaseCoordFormat1(di));
                    break;
                case 2:
                    _baseCoords.add(new BaseCoordFormat2(di));
                    break;
                case 3:
                    _baseCoords.add(new BaseCoordFormat3(di));
                    break;
            }
        }
    }
}
