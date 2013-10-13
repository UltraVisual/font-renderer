package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Ligature {
    private var _ligGlyph:UInt;
    private var glyphCount:UInt;
    private var _components:CappedArray<Int>;

    public function new(di:GlyphByteArray):Void {
        _ligGlyph = di.readUnsignedShort();
        glyphCount = di.readUnsignedShort();
        _components = new CappedArray<Int>( glyphCount - 1 );

        for (i in 0...glyphCount - 1) {
            _components.add(di.readUnsignedShort());
        }
    }

    public function getGlyphId(i:Int):Int {
        return (i == 0) ? _ligGlyph : _components.get(i - 1);
    }
}
