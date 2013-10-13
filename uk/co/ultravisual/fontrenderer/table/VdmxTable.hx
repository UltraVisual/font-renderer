package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.table.Table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class VdmxTable extends Table {
    private var _version:UInt;
    private var _numRecs:UInt;
    private var _numRatios:UInt;
    private var _ratRange:CappedArray<Ratio>; // Ratio[]
    private var _offset:CappedArray<UInt>; // UInt
    private var _groups:CappedArray<Group>; // Group[]

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.VDMX);

        var i:UInt;

        _version = di.readUnsignedShort();
        _numRecs = di.readUnsignedShort();
        _numRatios = di.readUnsignedShort();
        _ratRange = new CappedArray<Ratio>( _numRatios );

        for (i in 0..._numRatios) {
            _ratRange.add(new Ratio(di));
        }

        _offset = new CappedArray<UInt>( _numRatios );

        for (i in 0..._numRatios) {
            _offset.add(di.readUnsignedShort());
        }

        _groups = new CappedArray<Group>( _numRecs );

        for (i in 0..._numRecs) {
            _groups.add(new Group(di));
        }
    }


    public function toString():String {
        var sb:StringBuffer = new StringBuffer();

        sb.append("'VDMX' Table - Precomputed Vertical Device Metrics\n");
        sb.append("--------------------------------------------------\n");
        sb.append("  Version:                 ").append(_version).append("\n");
        sb.append("  Number of Hgt Records:   ").append(_numRecs).append("\n");
        sb.append("  Number of Ratio Records: ").append(_numRatios).append("\n");

        for (i in 0..._numRatios) {
            sb.append("\n    Ratio Record #").append(i + 1).append("\n");
            sb.append("\tCharSetId     ").append(_ratRange.get(i).getBCharSet()).append("\n");
            sb.append("\txRatio        ").append(_ratRange.get(i).getXRatio()).append("\n");
            sb.append("\tyStartRatio   ").append(_ratRange.get(i).getYStartRatio()).append("\n");
            sb.append("\tyEndRatio     ").append(_ratRange.get(i).getYEndRatio()).append("\n");
            sb.append("\tRecord Offset ").append(_offset.get(i)).append("\n");
        }
        sb.append("\n   VDMX Height Record Groups\n").append("   -------------------------\n");

        for (i in 0... _numRecs) {
            var group:Group = _groups.get(i);

            sb.append("   ").append(i + 1);
            sb.append(".   Number of Hgt Records  ").append(group.getRecs()).append("\n");
            sb.append("        Starting Y Pel Height  ").append(group.getStartSZ()).append("\n");
            sb.append("        Ending Y Pel Height    ").append(group.getEndSZ()).append("\n");
            for (j in 0...group.getRecs()) {
                sb.append("\n            ").append(j + 1);
                sb.append(". Pel Height= ").append(group.getEntry().get(j).getYPelHeight()).append("\n");
                sb.append("               yMax=       ").append(group.getEntry().get(j).getYMax()).append("\n");
                sb.append("               yMin=       ").append(group.getEntry().get(j).getYMin()).append("\n");
            }
        }
        return sb.toString();
    }
}
