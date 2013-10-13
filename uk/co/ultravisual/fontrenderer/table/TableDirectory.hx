package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.Fixed;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class TableDirectory {
    private var _version:Int = 0;
    private var _numTables:Int = 0;
    private var _searchRange:Int = 0;
    private var _entrySelector:Int = 0;
    private var _rangeShift:Int = 0;
    private var _entries:CappedArray<DirectoryEntry>; // DirectoryEntry

    public function new(di:GlyphByteArray):Void {
        _version = di.readInt();
        _numTables = di.readShort();
        _searchRange = di.readShort();
        _entrySelector = di.readShort();
        _rangeShift = di.readShort();
        _entries = new CappedArray<DirectoryEntry>(_numTables);

        for (i in 0..._numTables) {
            _entries.add(new DirectoryEntry(di));
        }
    }


    public function getEntry(index:UInt):DirectoryEntry {
        return _entries.get(index);
    }


    public function getEntryByTag(tag:Int):DirectoryEntry {
        for (i in 0..._numTables) {
            if (_entries.get(i).tag == tag) {
                return _entries.get(i);
            }
        }
        return null;
    }


    public function getEntrySelector():Int {
        return _entrySelector;
    }

    public function getNumTables():Int {
        return _numTables;
    }

    public function getRangeShift():Int {
        return _rangeShift;
    }

    public function getSearchRange():Int {
        return _searchRange;
    }

    public function getVersion():Int {
        return _version;
    }

    public function toString():String {
        var sb:String = "Offset Table\n------ -----";
        sb += "\n  sfnt version:     " + Fixed.floatValue(_version);
        sb += "\n  numTables =       " + _numTables;
        sb += "\n  searchRange =     " + _searchRange;
        sb += "\n  entrySelector =   " + _entrySelector;
        sb += "\n  rangeShift =      " + _rangeShift;
        sb += "\n\n";

        for (i in 0... _numTables) {
            sb += i + ". " + _entries.get(i).toString() + "\n";
        }
        return sb;
    }
}
