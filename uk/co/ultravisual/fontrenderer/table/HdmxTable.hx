package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class HdmxTable extends Table{
    private var _version:UInt;
    private var _numRecords:Int;
    private var _sizeDeviceRecords:Int;
    private var _records:CappedArray<DeviceRecord>; // DeviceRecord[]

    public function new(de:DirectoryEntry, di:GlyphByteArray, maxp:MaxpTable):Void {
        super(de, TableType.hdmx);

        _version = di.readUnsignedShort();
        _numRecords = di.readShort();
        _sizeDeviceRecords = di.readInt();
        _records = new CappedArray<DeviceRecord>( _numRecords );

        for (i in 0..._numRecords) {
            _records.add(new DeviceRecord(maxp.getNumGlyphs(), di));
        }
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("'hdmx' Table - Horizontal Device Metrics\n----------------------------------------\n");
        sb.append("Size = ").append(_de.length).append(" bytes\n");
        sb.append("\t'hdmx' version:         ").append(_version).append("\n");
        sb.append("\t# device records:       ").append(_numRecords).append("\n");
        sb.append("\tRecord length:          ").append(_sizeDeviceRecords).append("\n");

        for (i in 0..._numRecords) {
            sb.append("\tDevRec ").append(i);
            sb.append(": ppem = ").append(_records.get(i).getPixelSize());
            sb.append(", maxWid = ").append(_records.get(i).getMaxWidth());
            sb.append("\n");
            for (j in 0..._records.get(i).getWidths().size()) {
                sb.append("    ").append(j).append(".   ").append(_records.get(i).getWidths().get(j)).append("\n");
            }
            sb.append("\n\n");
        }
        return sb.toString();
    }
}
