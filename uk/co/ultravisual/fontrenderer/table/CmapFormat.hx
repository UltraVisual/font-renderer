package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.errors.ArrayIndexOutOfBoundError;
import uk.co.ultravisual.fontrenderer.errors.NonImplementationError;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class CmapFormat {

    public var format:Int;
    public var length:UInt;
    public var language:UInt;

    public function new(di:GlyphByteArray):Void {
        length = di.readUnsignedShort();
        language = di.readUnsignedShort();
    }

    public static function create(_format:Int, di:GlyphByteArray):CmapFormat {
        switch(_format)
        {
            case 0:
                return new CmapFormat2(di);
            case 2:
                return new CmapFormat2(di);
            case 4:
                return new CmapFormat4(di);
            case 6:
                return new CmapFormat6(di);
            default:
                return new CmapFormatUnknown(_format, di);
        }
    }

    private function getRangeCount():Int {
        throw new NonImplementationError();
        return 0;
    }

    public function getRange(index:Int):Range {
        throw new ArrayIndexOutOfBoundError();
        return null;
    }

    public function mapCharCode(charCode:Int):Int {
        throw new NonImplementationError();
        return 0;
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("format: ");
        sb.append(format);
        sb.append(", length: ");
        sb.append(length);
        sb.append(", language: ");
        sb.append(language);
        return sb.toString();
    }

}
