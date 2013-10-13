package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import flash.errors.Error;
class SingleSubst implements ILookupSubtable{
    public function new():Void {

    }

    public function getFormat():Int {
        throw new Error("NonImplementationException");
        return 0;
    }

    public function substitute(glyphId:Int):Int {
        throw new Error("NonImplementationException");
        return 0;
    }

    public static function read(dis:GlyphByteArray, offset:UInt):ILookupSubtable {
        var s:ILookupSubtable = null;
        dis.setPosition(offset);

        var format:UInt = dis.readUnsignedShort();

        if (format == 1)
            s = new SingleSubstFormat1( dis, offset );
        else if (format == 2)
            s = new SingleSubstFormat2( dis, offset );

        return s;
    }


    public function getTypeAsString():String {
        throw new Error("NonImplementationException");
        return "";
    }
}
