package uk.co.ultravisual.fontrenderer.table.base;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.table.base.BaseScript;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class BaseScriptList {
    private var _thisOffset:Int;
    private var _baseScriptCount:Int;
    private var _baseScriptRecord:CappedArray<BaseScriptRecord>;
    private var _baseScripts:CappedArray<BaseScript>;

    public function new(baseScriptListOffset:Int,  bt:BaseTable):Void {
        _thisOffset = baseScriptListOffset;
        var di:GlyphByteArray = bt.getDataInputForOffset(baseScriptListOffset);
        _baseScriptCount = di.readUnsignedShort();
        _baseScriptRecord = new CappedArray<BaseScriptRecord>(_baseScriptCount);
        for (i in 0..._baseScriptCount) {
            _baseScriptRecord.add(new BaseScriptRecord(di));
        }
        _baseScripts = new CappedArray<BaseScript>(_baseScriptCount);
        for (i in 0..._baseScriptCount) {
            _baseScripts.add(new BaseScript(baseScriptListOffset + _baseScriptRecord.get(i).getBaseScriptOffset(), bt));
        }
    }

    public function toString():String {
        var sb:String = "\nBaseScriptList BaseScriptListT" + _thisOffset + "\n" + _baseScriptCount;
        for (i in 0..._baseScriptCount) {
            sb += "\n                          ; BaseScriptRecord[" + i;
            sb += "]\n'" + BaseTable.tagAsString(_baseScriptRecord.get(i).getBaseScriptTag()) + "'";
            sb += "\nBaseScriptT" + (_thisOffset + _baseScriptRecord.get(i).getBaseScriptOffset());
        }
        for (i in 0..._baseScriptCount) {
            sb += "\n" + _baseScripts.get(i).toString();
        }

        return sb;
    }
}
