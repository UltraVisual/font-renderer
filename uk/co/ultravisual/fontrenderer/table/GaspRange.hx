package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class GaspRange {
    public static var GASP_GRIDFIT:Int = 1;
    public static var GASP_DOGRAY:Int = 2;

    private var rangeMaxPPEM:Int;
    private var rangeGaspBehavior:Int;

    public function new(di:GlyphByteArray):Void {
        rangeMaxPPEM = di.readUnsignedShort();
        rangeGaspBehavior = di.readUnsignedShort();
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();

        sb.append("  rangeMaxPPEM:        ").append(rangeMaxPPEM);
        sb.append("\n  rangeGaspBehavior:   0x").append(rangeGaspBehavior);
        if ((rangeGaspBehavior & GASP_GRIDFIT) != 0) {
            sb.append("- GASP_GRIDFIT ");
        }
        if ((rangeGaspBehavior & GASP_DOGRAY) != 0) {
            sb.append("- GASP_DOGRAY");
        }
        return sb.toString();
    }
}
