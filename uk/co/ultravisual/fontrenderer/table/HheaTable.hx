package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.Fixed;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class HheaTable extends Table {
    private var version:Int;
    private var ascender:Int;
    private var descender:Int;
    private var lineGap:Int;
    private var advanceWidthMax:Int;
    private var minLeftSideBearing:Int;
    private var minRightSideBearing:Int;
    private var xMaxExtent:Int;
    private var caretSlopeRise:Int;
    private var caretSlopeRun:Int;
    private var metricDataFormat:Int;
    private var numberOfHMetrics:Int;

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.hhea);
        version = di.readInt();
        ascender = di.readShort();
        descender = di.readShort();
        lineGap = di.readShort();
        advanceWidthMax = di.readShort();
        minLeftSideBearing = di.readShort();
        minRightSideBearing = di.readShort();
        xMaxExtent = di.readShort();
        caretSlopeRise = di.readShort();
        caretSlopeRun = di.readShort();
        for (i in 0...5) {
            di.readShort();
        }
        metricDataFormat = di.readShort();
        numberOfHMetrics = di.readShort();
    }

    public function getAdvanceWidthMax():Int {
        return advanceWidthMax;
    }

    public function getAscender():Int {
        return ascender;
    }

    public function getCaretSlopeRise():Int {
        return caretSlopeRise;
    }

    public function getCaretSlopeRun():Int {
        return caretSlopeRun;
    }

    public function getDescender():Int {
        return descender;
    }

    public function getLineGap():Int {
        return lineGap;
    }

    public function getMetricDataFormat():Int {
        return metricDataFormat;
    }

    public function getMinLeftSideBearing():Int {
        return minLeftSideBearing;
    }

    public function getMinRightSideBearing():Int {
        return minRightSideBearing;
    }

    public function getNumberOfHMetrics():Int {
        return numberOfHMetrics;
    }

    override public function getType():Int {
        return TableType.hhea;
    }

    public function getXMaxExtent():Int {
        return xMaxExtent;
    }

    public function toString():String {
        var sb = new StringBuffer();
        sb.append("'hhea' Table - Horizontal Header\n--------------------------------");
        sb.append("\n        'hhea' version:       ").append(Fixed.floatValue(version));
        sb.append("\n        yAscender:            ").append(ascender);
        sb.append("\n        yDescender:           ").append(descender);
        sb.append("\n        yLineGap:             ").append(lineGap);
        sb.append("\n        advanceWidthMax:      ").append(advanceWidthMax);
        sb.append("\n        minLeftSideBearing:   ").append(minLeftSideBearing);
        sb.append("\n        minRightSideBearing:  ").append(minRightSideBearing);
        sb.append("\n        xMaxExtent:           ").append(xMaxExtent);
        sb.append("\n        horizCaretSlopeNum:   ").append(caretSlopeRise);
        sb.append("\n        horizCaretSlopeDenom: ").append(caretSlopeRun);
        sb.append("\n        reserved0:            0");
        sb.append("\n        reserved1:            0");
        sb.append("\n        reserved2:            0");
        sb.append("\n        reserved3:            0");
        sb.append("\n        reserved4:            0");
        sb.append("\n        metricDataFormat:     ").append(metricDataFormat);
        sb.append("\n        numOf_LongHorMetrics: ").append(numberOfHMetrics);
        return sb.toString();
    }
}
