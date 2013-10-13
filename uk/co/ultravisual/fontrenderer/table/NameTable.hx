package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;

class NameTable extends Table {

    private var _formatSelector:Int;
    public var nameRecordsCount:Int;
    private var _stringStorageOffset:Int;
    private var _records:CappedArray<NameRecord>; // NameRecord[]

/**
	     *
	     * @param de
	     * @param di
	     * @throws IOError
	     */

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.name);

        _formatSelector = di.readShort();
        nameRecordsCount = di.readShort();
        _stringStorageOffset = di.readShort();
        _records = new CappedArray<NameRecord>( nameRecordsCount );

        var i:UInt;

        for (i in 0...nameRecordsCount) {
            var nameRecord:NameRecord = new NameRecord(di);
            _records.add(nameRecord);
        }

        var buffer:GlyphByteArray = new GlyphByteArray();
        var ins:GlyphByteArray;
        di.readBytes(buffer, 0, _de.length - _stringStorageOffset);


        for (i in 0...nameRecordsCount) {
            ins = new GlyphByteArray();
            buffer.setPosition(0);
            buffer.readBytes(ins);
            _records.get(i).loadString(ins);
        }
    }

    public function getRecord(i:UInt):NameRecord {
        return _records.get(i);
    }

    public function findRecordById(id:Int):NameRecord {
        for (i in 0...nameRecordsCount) {
            if (_records.get(i).getNameId() == id) {
                return _records.get(i);
            }
        }
        return null;
    }

    public function getRecordString(nameId:Int):String {
        for (i in 0...nameRecordsCount) {
            if (_records.get(i).getNameId() == nameId) {
                return _records.get(i).getRecordString();
            }
        }
        return "";
    }
}
