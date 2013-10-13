package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class SingleSubstFormat2 extends SingleSubst {
    private var _coverageOffset:UInt;
    private var _glyphCount:UInt;
    private var _substitutes:CappedArray<Int>;
    private var _coverage:Coverage;

    public var format:UInt;

    public function new(dis:GlyphByteArray, offset:UInt):Void {
        super();
        _coverageOffset = dis.readUnsignedShort();
        _glyphCount = dis.readUnsignedShort();
        _substitutes = new CappedArray<Int>( _glyphCount );
        format = 2;

        for (i in 0..._glyphCount) {
            _substitutes.add(dis.readUnsignedShort());
        }

        dis.setPosition(offset + _coverageOffset);
        _coverage = Coverage.read(dis);
    }


    override public function substitute(glyphId:Int):Int {
        var i:Int = _coverage.findGlyph(glyphId);
        if (i > -1) {
            return _substitutes.get(i);
        }
        return glyphId;
    }

    override public function getTypeAsString():String {
        return "SingleSubstFormat2";
    }
}
