package uk.co.ultravisual.fontrenderer.table;

class Table {

    private var _de:DirectoryEntry;
    private var _type:Int;

    public function new(de:DirectoryEntry, type:Int):Void {
        _de = de;
        _type = type;
    }

    public function getDirectoryEntry():DirectoryEntry {
        return _de;
    }

    public function getType():Int {
        return _type;
    }

}
