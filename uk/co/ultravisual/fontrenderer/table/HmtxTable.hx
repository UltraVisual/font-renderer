package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.table.Table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
class HmtxTable extends Table{

    private var _hMetrics:CappedArray<Int>; // Int[]
    private var _leftSideBearing:CappedArray<Int>; // short[]

    public function new(de:DirectoryEntry, di:GlyphByteArray, hhea:HheaTable, maxp:MaxpTable):Void {
        super(de, TableType.hmtx);

        var i:Int;
        _hMetrics = new CappedArray<Int>( hhea.getNumberOfHMetrics() );

        for (i in 0...hhea.getNumberOfHMetrics()) {
            _hMetrics.add(di.readUnsignedByte() << 24 | di.readUnsignedByte() << 16 | di.readUnsignedByte() << 8 | di.readUnsignedByte());
        }

        var lsbCount:Int = maxp.getNumGlyphs() - hhea.getNumberOfHMetrics();

        _leftSideBearing = new CappedArray<Int>( lsbCount );

        for (i in 0...lsbCount) {
            _leftSideBearing.add(di.readShort());
        }
    }


    public function getAdvanceWidth(i:Int):Int {
        if (_hMetrics == null) {
            return 0;
        }
        if (i < _hMetrics.size()) {
            return _hMetrics.get(i) >> 16;
        } else {
            return _hMetrics.get(_hMetrics.size() - 1) >> 16;
        }
        return 0;
    }

    public function getLeftSideBearing(i:Int):Int {
        if (_hMetrics == null) {
            return 0;
        }
        if (i < _hMetrics.size()) {
            return (_hMetrics.get(i) & 0xffff);
        } else {
            return _leftSideBearing.get(i - _hMetrics.size());
        }
        return 0;
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        var i:Int;
        sb.append("'hmtx' Table - Horizontal Metrics\n---------------------------------\n");
        sb.append("Size = ").append(_de.length).append(" bytes, ").append(_hMetrics.size()).append(" entries\n");

        for (i in 0..._hMetrics.size()) {
            sb.append("        ").append(i);
            sb.append(". advWid: ").append(getAdvanceWidth(i));
            sb.append(", LSdBear: ").append(getLeftSideBearing(i));
            sb.append("\n");
        }
        for (i in 0..._leftSideBearing.size()) {
            sb.append("        LSdBear ").append(i + _hMetrics.size());
            sb.append(": ").append(_leftSideBearing.get(i));
            sb.append("\n");
        }
        return sb.toString();
    }
}
