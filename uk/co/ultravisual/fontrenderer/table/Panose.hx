package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Panose {
    private var bFamilyType:Int = 0; // byte
    private var bSerifStyle:Int = 0;
    private var bWeight:Int = 0;
    private var bProportion:Int = 0;
    private var bContrast:Int = 0;
    private var bStrokeVariation:Int = 0;
    private var bArmStyle:Int = 0;
    private var bLetterform:Int = 0;
    private var bMidline:Int = 0;
    private var bXHeight:Int = 0;

    public function new(panose:GlyphByteArray):Void {
        bFamilyType = panose.readByte();
        bSerifStyle = panose.readByte();
        bWeight = panose.readByte();
        bProportion = panose.readByte();
        bContrast = panose.readByte();
        bStrokeVariation = panose.readByte();
        bArmStyle = panose.readByte();
        bLetterform = panose.readByte();
        bMidline = panose.readByte();
        bXHeight = panose.readByte();
    }

    public function getFamilyType():Int {
        return bFamilyType;
    }

    public function getSerifStyle():Int {
        return bSerifStyle;
    }

    public function getWeight():Int {
        return bWeight;
    }

    public function getProportion():Int {
        return bProportion;
    }

    public function getContrast():Int {
        return bContrast;
    }

    public function getStrokeVariation():Int {
        return bStrokeVariation;
    }

    public function getArmStyle():Int {
        return bArmStyle;
    }

    public function getLetterForm():Int {
        return bLetterform;
    }

    public function getMidline():Int {
        return bMidline;
    }

    public function getXHeight():Int {
        return bXHeight;
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append((bFamilyType)).append(" ");
        sb.append((bSerifStyle)).append(" ");
        sb.append((bWeight)).append(" ");
        sb.append((bProportion)).append(" ");
        sb.append((bContrast)).append(" ");
        sb.append((bStrokeVariation)).append(" ");
        sb.append((bArmStyle)).append(" ");
        sb.append((bLetterform)).append(" ");
        sb.append((bMidline)).append(" ");
        sb.append((bXHeight));
        return sb.toString();
    }
}
