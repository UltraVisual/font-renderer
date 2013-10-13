package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
class VmtxTable extends Table {
    private var _vMetrics:CappedArray<Int>; // Int[]
    private var _topSideBearing:CappedArray<Int>; // short[]

/**
	     *
	     * @param de
	     * @param di
	     * @param vhea
	     * @param maxp
	     * @throws IOError
	     */

    public function new(de:DirectoryEntry, di:GlyphByteArray, vhea:VheaTable, maxp:MaxpTable):Void {
        super(de, TableType.vmtx);

        var i:Int;
        _vMetrics = new CappedArray( vhea.getNumberOfLongVerMetrics() );
        for (i in 0...vhea.getNumberOfLongVerMetrics()) {
            _vMetrics.add(di.readUnsignedByte() << 24 | di.readUnsignedByte() << 16 | di.readUnsignedByte() << 8 | di.readUnsignedByte());
        }
        var tsbCount:Int = maxp.getNumGlyphs() - vhea.getNumberOfLongVerMetrics();

        _topSideBearing = new CappedArray<Int>( tsbCount );
        for (i in 0...tsbCount) {
            _topSideBearing.add(di.readShort());
        }
    }

    public function getAdvanceHeight(i:Int):Int {
        if (_vMetrics == null) {
            return 0;
        }
        if (i < _vMetrics.size()) {
            return _vMetrics.get(i) >> 16;
        } else {
            return _vMetrics.get(_vMetrics.size() - 1) >> 16;
        }
    }

    public function getTopSideBearing(i:Int):Int {
        if (_vMetrics == null) {
            return 0;
        }
        if (i < _vMetrics.size()) {
            return (_vMetrics.get(i) & 0xffff);
        } else {
            return _topSideBearing.get(i - _vMetrics.size());
        }
    }

    public function toString():String {
        var i:UInt;
        var sb:StringBuffer = new StringBuffer();
        sb.append("'vmtx' Table - Vertical Metrics\n-------------------------------\n");
        sb.append("Size = ").append(_de.length).append(" bytes, ");
        sb.append(_vMetrics.size()).append(" entries\n");

        for (i in 0..._vMetrics.size()) {
            sb.append("        ").append(i);
            sb.append(". advHeight: ").append(getAdvanceHeight(i));
            sb.append(", TSdBear: ").append(getTopSideBearing(i));
            sb.append("\n");
        }

        for (i in 0..._topSideBearing.size()) {
            sb.append("        TSdBear ").append(i + _vMetrics.size());
            sb.append(": ").append(_topSideBearing.get(i));
            sb.append("\n");
        }
        return sb.toString();
    }
}
