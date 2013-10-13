package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class SingleSubstFormat1 extends SingleSubst {
    private var _coverageOffset:UInt;
    private var _deltaGlyphID:Int;
    private var _coverage:Coverage;
    public var format:UInt;

    public function new(dis:GlyphByteArray, offset:UInt):Void {
        super();
        _coverageOffset = dis.readUnsignedShort();
        _deltaGlyphID = dis.readShort();
        format = 1;
        dis.setPosition(offset + _coverageOffset);
        _coverage = Coverage.read(dis);
    }

    override public function substitute(glyphId:Int):Int {
        var i:Int = _coverage.findGlyph(glyphId);
        if (i > -1) {
            return glyphId + _deltaGlyphID;
        }
        return glyphId;
    }

    override public function getTypeAsString():String {
        return "SingleSubstFormat1";
    }
}
