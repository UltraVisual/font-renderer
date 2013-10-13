package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.table.base.BaseTagList;
import uk.co.ultravisual.fontrenderer.table.base.BaseTable;
import uk.co.ultravisual.fontrenderer.table.base.BaseScriptList;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Axis {

    private var _thisOffset:Int;
    private var _baseTagListOffset:Int;
    private var _baseScriptListOffset:Int;
    private var _baseTagList:BaseTagList ;
    private var _baseScriptList:BaseScriptList;

    public function new(axisOffset:Int, bt:BaseTable):Void {
        _thisOffset = axisOffset;
        var di:GlyphByteArray = bt.getDataInputForOffset(axisOffset);
        _baseTagListOffset = di.readUnsignedShort();
        _baseScriptListOffset = di.readUnsignedShort();

        if (_baseTagListOffset != 0) {
            _baseTagList = new BaseTagList(axisOffset + _baseTagListOffset, bt);
        }
        if (_baseScriptListOffset != 0) {
            _baseScriptList = new BaseScriptList( axisOffset + _baseScriptListOffset, bt);
        }
    }

    public function toString():String {
        var sb = new StringBuffer();
        sb.append("\nAxis AxisT").append((_thisOffset));
        sb.append("\nBaseTagListT").append((_thisOffset + _baseTagListOffset));
        sb.append("\nBaseScriptListT").append((_thisOffset + _baseScriptListOffset));
        sb.append("\n").append(_baseTagList);
        sb.append("\n").append(_baseScriptList);
        return sb.toString();

    }
}
