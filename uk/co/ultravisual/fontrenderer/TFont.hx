package uk.co.ultravisual.fontrenderer;

import uk.co.ultravisual.fontrenderer.table.TableType;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.table.DirectoryEntry;
import uk.co.ultravisual.fontrenderer.table.TableFactory;
import uk.co.ultravisual.fontrenderer.table.NameTable;
import uk.co.ultravisual.fontrenderer.table.PostTable;
import uk.co.ultravisual.fontrenderer.table.HmtxTable;
import uk.co.ultravisual.fontrenderer.table.GlyfTable;
import uk.co.ultravisual.fontrenderer.table.CmapTable;
import uk.co.ultravisual.fontrenderer.table.Os2Table;
import uk.co.ultravisual.fontrenderer.table.VheaTable;
import uk.co.ultravisual.fontrenderer.table.LocaTable;
import uk.co.ultravisual.fontrenderer.table.MaxpTable;
import uk.co.ultravisual.fontrenderer.table.HheaTable;
import uk.co.ultravisual.fontrenderer.table.HeadTable;
import uk.co.ultravisual.fontrenderer.table.Table;
import uk.co.ultravisual.fontrenderer.table.TableDirectory;
import uk.co.ultravisual.fontrenderer.geom.Glyph;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class TFont {
    private var _fc:TFontCollection;
    private var _tableDirectory:TableDirectory;
    private var _tables:CappedArray<Table>; // Table[]
    private var _head:HeadTable;
    private var _hhea:HheaTable;
    private var _maxp:MaxpTable;
    private var _loca:LocaTable;
    private var _vhea:VheaTable;
    private var _os2:Os2Table;
    private var _cmap:CmapTable;
    private var _glyf:GlyfTable;
    private var _hmtx:HmtxTable;
    private var _name:NameTable;
    private var _post:PostTable;

    public function new(fc:TFontCollection):Void {
        _fc = fc;
    }

    public function getTable(tableType:Int):Table {
        for (i in 0..._tables.size()) {
            if ((_tables.get(i) != null) && _tables.get(i).getType() == tableType) {
                return _tables.get(i);
            }
        }
        return null;
    }

    public function getOS2Table():Os2Table {
        return _os2;
    }

    public function getHheaTable():HheaTable {
        return _hhea;
    }

    public function getHeadTable():HeadTable {
        return _head;
    }

    public function getMaxpTable():MaxpTable {
        return _maxp;
    }

    public function getLocaTable():LocaTable {
        return _loca;
    }

    public function getVheaTable():VheaTable {
        return _vhea;
    }

    public function getCmapTable():CmapTable {
        return _cmap;
    }

    public function getNameTable():NameTable {
        return _name;
    }

    public function getHmtxTable():HmtxTable {
        return _hmtx;
    }

    public function getAscent():Int {
        return _hhea.getAscender();
    }

    public function getDescent():Int {
        return _hhea.getDescender();
    }

    public function getNumGlyphs():Int {
        return _maxp.getNumGlyphs();
    }

    public function getGlyph(i:Int):Glyph {
        return (_glyf.getDescription(i) != null) ? new Glyph( _glyf.getDescription(i), _hmtx.getLeftSideBearing(i), _hmtx.getAdvanceWidth(i)) : null;
    }

    public function getTableDirectory():TableDirectory {
        return _tableDirectory;
    }

    private function readTable(dis:GlyphByteArray, tablesOrigin:Int, tag:Int):Table {
        dis.setPosition(0);
        var entry:DirectoryEntry = _tableDirectory.getEntryByTag(tag);
        if (entry == null)
            return null;

        dis.increasePosition(tablesOrigin + entry.offset);
        return TableFactory.create(_fc, this, entry, dis);
    }


        /**
	     * @param dis OpenType/TrueType font file data.
	     * @param directoryOffset The Table Directory offset within the file.  For a
	     * regular TTF/OTF file this will be zero, but for a TTC (Font Collection)
	     * the offset is retrieved from the TTC header.  For a Mac font resource,
	     * offset is retrieved from the resource headers.
	     * @param tablesOrigin The point the table offsets are calculated from.
	     * Once again, in a regular TTF file, this will be zero.  In a TTC is
	     * also zero, but within a Mac resource, it is the begining of the
	     * individual font resource data.
	     */

    public function read(input:GlyphByteArray, directoryOffset:Int, tablesOrigin:Int):Void {
        input.increasePosition(directoryOffset);
        _tableDirectory = new TableDirectory( input );
        _tables = new CappedArray<Table>(_tableDirectory.getNumTables());

        _head = cast readTable(input, tablesOrigin, TableType.head);
        _hhea = cast readTable(input, tablesOrigin, TableType.hhea);
        _maxp = cast readTable(input, tablesOrigin, TableType.maxp);
        _loca = cast readTable(input, tablesOrigin, TableType.loca);
        _vhea = cast readTable(input, tablesOrigin, TableType.vhea);

        var index:UInt = 0;
        _tables.addAt(index++, _head);
        _tables.addAt(index++, _hhea);
        _tables.addAt(index++, _maxp);
        if (_loca != null)
            _tables.addAt(index++, _loca);

        if (_vhea != null)
            _tables.addAt(index++, _vhea);

        for (i in 0..._tableDirectory.getNumTables()) {
            var entry:DirectoryEntry = _tableDirectory.getEntry(i);
            if (entry.tag == TableType.head
            || entry.tag == TableType.hhea
            || entry.tag == TableType.maxp
            || entry.tag == TableType.loca
            || entry.tag == TableType.vhea) {
                continue;
            }
            input.setPosition(0);
            input.increasePosition(tablesOrigin + entry.offset);
            _tables.addAt(index, TableFactory.create(_fc, this, entry, input));
            ++index;
        }

        _cmap = cast getTable(TableType.cmap);
        _hmtx = cast getTable(TableType.hmtx);
        _name = cast getTable(TableType.name);
        _os2 = cast getTable(TableType.OS_2);
        _post = cast getTable(TableType.post);
        _glyf = cast getTable(TableType.glyf);
    }
}
