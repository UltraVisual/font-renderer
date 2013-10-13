package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.errors.NonImplementationError;
class Coverage {

    private var format:Int;

    public function new():Void {

    }

    private function getFormat():Int {
        throw new NonImplementationError();
        return 0;
    }


    public function findGlyph(glyphId:Int):Int {
        throw new NonImplementationError();
        return 0;
    }

    public static function read(di:GlyphByteArray):Coverage {
        var c:Coverage = null;
        var format:UInt = di.readUnsignedShort();

        if (format == 1)
            c = new CoverageFormat1(di);
        else if (format == 2)
            c = new CoverageFormat2(di);
        return c;
    }
}
