package uk.co.ultravisual.fontrenderer.table.base;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.table.base.BaseTable;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class BaseTagList {
    private var _thisOffset:Int;
    private var _baseTagCount:Int;
    private var _baselineTag:CappedArray<Int>;

    public function new(baseTagListOffset:Int, bt:BaseTable):Void {
        _thisOffset = baseTagListOffset;
        var di:GlyphByteArray = bt.getDataInputForOffset(baseTagListOffset);
        _baseTagCount = di.readUnsignedShort();
        _baselineTag = new CappedArray<Int>(_baseTagCount);
        for (i in 0..._baseTagCount) {
            _baselineTag.add(di.readInt());
        }
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("\nBaseTagList BaseTagListT");
        sb.append(_thisOffset);
        sb.append("\n");
        sb.append(_baseTagCount);

        for (i in 0..._baseTagCount) {
            sb.append("\n'");
            sb.append(BaseTable.tagAsString(_baselineTag.get(i)));
            sb.append("'");
        }
        return sb.toString();
    }
}
