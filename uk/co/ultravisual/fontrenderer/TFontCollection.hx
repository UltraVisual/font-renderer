package uk.co.ultravisual.fontrenderer;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import flash.events.EventDispatcher;
import uk.co.ultravisual.fontrenderer.table.Table;
import uk.co.ultravisual.fontrenderer.table.DirectoryEntry;
import uk.co.ultravisual.fontrenderer.table.TTCHeader;
import flash.net.URLStream;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.collection.ArrayCollection;
import flash.events.IEventDispatcher;

class TFontCollection extends EventDispatcher{
    private var _fonts:CappedArray<TFont>; // Font[]
    private var _tables:ArrayCollection<Table>;
    private var _ttcHeader:TTCHeader;
    public var pathName:String;
    public var fileName:String;

    public function new(target:IEventDispatcher = null) {
        super(target);
        _tables = new ArrayCollection<Table>();
    }

    public function getTable(de:DirectoryEntry):Table {
        for (i in 0..._tables.length) {
            var table:Table = _tables.getItemAt(i);
            if ((table.getDirectoryEntry().tag == de.tag) && (table.getDirectoryEntry().offset == de.offset)) {
                return table;
            }
        }
        return null;
    }

    public function getTtcHeader():TTCHeader {
        return _ttcHeader;
    }

    public function addTable(table:Table):Void {
        _tables.addItem(table);
    }

    public function getFont(i:UInt):TFont {
        return _fonts.get(i);
    }

    public function getFontCount():UInt {
        return _fonts.size();
    }

    public static function create(bytes:GlyphByteArray, pathName:String = ""):TFontCollection {
        var fc:TFontCollection = new TFontCollection();
        fc.read(bytes, pathName);
        return fc;
    }


    private function read(bytes:GlyphByteArray, _pathName:String = ""):Void {
        pathName = _pathName;
        if (TTCHeader.isTTC(bytes)) {
            bytes.setPosition(0);
            _ttcHeader = new TTCHeader( bytes );
            _fonts = new CappedArray<TFont>( _ttcHeader.directoryCount );
            for (i in 0..._ttcHeader.directoryCount) {
                _fonts.add(new TFont(this));
                _fonts.get(i).read(bytes, _ttcHeader.getTableDirectory(i), 0);
            }
        } else {
            bytes.setPosition(0);
            _fonts = new CappedArray<TFont>(1);
            _fonts.add(new TFont(this));
            _fonts.get(0).read(bytes, 0, 0);
        }
    }
}
