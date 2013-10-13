package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class LocaTable extends Table{

    private var _offsets:CappedArray<UInt>;
    private var _factor:Int = 0;

    public function new(de:DirectoryEntry, di:GlyphByteArray, head:HeadTable, maxp:MaxpTable):Void {
        super(de, TableType.loca);
        var getNumGlyphs = maxp.getNumGlyphs() + 1;
        _offsets = new CappedArray<UInt>(getNumGlyphs);
        var shortEntries:Bool = head.getIndexToLocFormat() == 0;

        if (shortEntries) {
            _factor = 2;
            for (i in 0...getNumGlyphs) {
                _offsets.add(di.readUnsignedShort());
            }
        } else {
            _factor = 1;
            for (i in 0...getNumGlyphs) {
                _offsets.add(di.readInt());
            }
        }
    }


    public function getOffset(i:Int):Int {
        if (_offsets == null) {
            return 0;
        }
        return _offsets.get(i) * _factor;
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("'loca' Table - Index To Location Table\n--------------------------------------\n");
        sb.append("Size = ");
        sb.append(_de.length);
        sb.append(" bytes, ");
        sb.append(_offsets.size());
        sb.append(" entries\n");
        for (i in 0..._offsets.size()) {
            sb.append("        Idx ");
            sb.append(i);
            sb.append(" -> glyfOff 0x");
            sb.append(getOffset(i));
            sb.append("\n");
        }
        return sb.toString();
    }
}
