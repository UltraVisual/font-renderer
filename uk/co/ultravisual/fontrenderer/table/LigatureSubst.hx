package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class LigatureSubst implements ILookupSubtable{

    public function new():Void {

    }

    public function getTypeAsString():String {
        return null;
    }

    public static function read(dis:GlyphByteArray, offset:UInt):ILookupSubtable {
        dis.setPosition(offset);
        var format:UInt = dis.readUnsignedShort();
        if (format == 1)
            return new LigatureSubstFormat1( dis, offset );

        return null;
    }
}
