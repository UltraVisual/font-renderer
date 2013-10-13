package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.errors.NonImplementationError;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class KernSubtable {

    public function new():Void {
    }

    public function getKerningPairCount():UInt {
        throw new NonImplementationError();
        return 0;
    }

    public function getKerningPair(i:UInt):KerningPair {
        throw new NonImplementationError();
        return null;
    }

    public static function read(di:GlyphByteArray):KernSubtable {
        var version:UInt = di.readUnsignedShort();
        var length:UInt = di.readUnsignedShort();
        var coverage:UInt = di.readUnsignedShort();
        var format:Int = coverage >> 8;

        switch (format)
        {
            case 0:
                return new KernSubtableFormat0(di);
            case 2:
                return new KernSubtableFormat2(di);
            default:
                return null;
        }
    }
}
