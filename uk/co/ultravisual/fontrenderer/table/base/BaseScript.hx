package uk.co.ultravisual.fontrenderer.table.base;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.table.base.BaseLangSysRecord;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class BaseScript {
    private var _thisOffset:Int;
    private var _baseValuesOffset:Int;
    private var _defaultMinMaxOffset:Int;
    private var _baseLangSysCount:Int;
    private var _baseLangSysRecord:CappedArray<BaseLangSysRecord>;
    private var _baseValues:BaseValues;
    private var _minMax:Array<MinMax>;

    public function new(baseScriptOffset:Int, bt:BaseTable):Void {
        _thisOffset = baseScriptOffset;
        var di:GlyphByteArray = bt.getDataInputForOffset(baseScriptOffset);
        _baseValuesOffset = di.readUnsignedShort();
        _defaultMinMaxOffset = di.readUnsignedShort();
        _baseLangSysCount = di.readUnsignedShort();
        _baseLangSysRecord = new CappedArray<BaseLangSysRecord>(_baseLangSysCount);
        _minMax = new Array<MinMax>();

        for (i in 0..._baseLangSysCount) {
            _baseLangSysRecord.add(new BaseLangSysRecord(di));
        }

        if (_baseValuesOffset > 0) {
            _baseValues = new BaseValues(baseScriptOffset + _baseValuesOffset, bt);
        }
        for (i in 0..._baseLangSysCount) {
            _minMax[i] = new MinMax(baseScriptOffset + _baseLangSysRecord.get(i).getMinMaxOffset(), bt);
        }
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("\nBaseScript BaseScriptT").append(_thisOffset);
        sb.append("\nBaseValuesT").append((_thisOffset + _baseValuesOffset));
        sb.append("\nMinMaxT").append((_thisOffset + _defaultMinMaxOffset));
        sb.append("\n");
        sb.append((_baseLangSysCount));

        if (_baseValues != null) {
            sb.append("\n").append(_baseValues);
        }
        return sb.toString();
    }
}
