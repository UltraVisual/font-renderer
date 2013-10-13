package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class CoverageFormat1 extends Coverage {

    private var _glyphCount:UInt;
    private var _glyphIds:CappedArray<Int>;

    public function new(di:GlyphByteArray):Void {
        super();
        _glyphCount = di.readUnsignedShort();
        _glyphIds = new CappedArray<Int>( _glyphCount );

        for (i in 0..._glyphCount) {
            _glyphIds.add(di.readUnsignedShort());
        }
    }


    override private function getFormat():Int {
        return 1;
    }


    override public function findGlyph(glyphId:Int):Int {
        for (i in 0..._glyphCount) {
            if (_glyphIds.get(i) == glyphId) {
                return i;
            }
        }
        return -1;
    }
}
