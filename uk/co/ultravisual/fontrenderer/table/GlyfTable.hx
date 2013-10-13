package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
class GlyfTable extends Table {
    private var _descript:CappedArray<GlyfDescript>;

    public function new(de:DirectoryEntry, di:GlyphByteArray, maxp:MaxpTable, loca:LocaTable):Void {
        super(de, TableType.glyf);
        _descript = new CappedArray<GlyfDescript>( maxp.getNumGlyphs() );

        var len:Int;
        var dis:GlyphByteArray;
        var numberOfContours:Int;
        var bais:GlyphByteArray = new GlyphByteArray();
        di.readBytes(bais, 0, de.getLength());

        for (i in 0...maxp.getNumGlyphs()) {
            len = loca.getOffset((i + 1)) - loca.getOffset(i);
            if (len > 0) {
                bais.setPosition(0);
                bais.setPosition(loca.getOffset(i));
                dis = new GlyphByteArray();
                bais.readBytes(dis);

                numberOfContours = dis.readShort();
                if (numberOfContours >= 0) {
                    _descript.add(new GlyfSimpleDescript(this, i, numberOfContours, dis));
                }
            } else {
                _descript.remove(i);
            }
        }

        for (i in 0...maxp.getNumGlyphs()) {
            len = loca.getOffset((i + 1)) - loca.getOffset(i);
            if (len > 0) {
                bais.setPosition(0);
                bais.setPosition(loca.getOffset(i));

                dis = new GlyphByteArray();
                bais.readBytes(dis);

                numberOfContours = dis.readShort();
                if (numberOfContours < 0) {
                    _descript.add(new GlyfCompositeDescript(this, i, dis));
                }
            }
        }
    }

    public function getDescription(i:Int):GlyfDescript {
        if (i < _descript.size()) {
            return _descript.get(i);
        } else {
            return null;
        }
    }
}
