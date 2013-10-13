package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.Fixed;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class VheaTable extends Table{
    private var _version:Int;
    private var _ascent:Int;
    private var _descent:Int;
    private var _lineGap:Int;
    private var _advanceHeightMax:Int;
    private var _minTopSideBearing:Int;
    private var _minBottomSideBearing:Int;
    private var _yMaxExtent:Int;
    private var _caretSlopeRise:Int;
    private var _caretSlopeRun:Int;
    private var _metricDataFormat:Int;
    private var _numberOfLongVerMetrics:Int;

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.vhea);

        _version = di.readInt();
        _ascent = di.readShort();
        _descent = di.readShort();
        _lineGap = di.readShort();
        _advanceHeightMax = di.readShort();
        _minTopSideBearing = di.readShort();
        _minBottomSideBearing = di.readShort();
        _yMaxExtent = di.readShort();
        _caretSlopeRise = di.readShort();
        _caretSlopeRun = di.readShort();

        for (i in 0...5) {
        di.readShort();
        }
        _metricDataFormat = di.readShort();
        _numberOfLongVerMetrics = di.readUnsignedShort();
    }

    public function getAdvanceHeightMax():Int {
        return _advanceHeightMax;
    }

    public function getAscent():Int {
        return _ascent;
    }

    public function getCaretSlopeRise():Int {
        return _caretSlopeRise;
    }

    public function getCaretSlopeRun():Int {
        return _caretSlopeRun;
    }

    public function getDescent():Int {
        return _descent;
    }

    public function getLineGap():Int {
        return _lineGap;
    }

    public function getMetricDataFormat():Int {
        return _metricDataFormat;
    }

    public function getMinTopSideBearing():Int {
        return _minTopSideBearing;
    }

    public function getMinBottomSideBearing():Int {
        return _minBottomSideBearing;
    }

    public function getNumberOfLongVerMetrics():Int {
        return _numberOfLongVerMetrics;
    }

    public function getYMaxExtent():Int {
        return _yMaxExtent;
    }

    public function toString():String {
        var sb = new StringBuffer();
        sb.append("'vhea' Table - Vertical Header\n------------------------------");
        sb.append("\n        'vhea' version:       ").append(Fixed.floatValue(_version));
        sb.append("\n        xAscender:            ").append(_ascent);
        sb.append("\n        xDescender:           ").append(_descent);
        sb.append("\n        xLineGap:             ").append(_lineGap);
        sb.append("\n        advanceHeightMax:     ").append(_advanceHeightMax);
        sb.append("\n        minTopSideBearing:    ").append(_minTopSideBearing);
        sb.append("\n        minBottomSideBearing: ").append(_minBottomSideBearing);
        sb.append("\n        yMaxExtent:           ").append(_yMaxExtent);
        sb.append("\n        horizCaretSlopeNum:   ").append(_caretSlopeRise);
        sb.append("\n        horizCaretSlopeDenom: ").append(_caretSlopeRun);
        sb.append("\n        reserved0:            0");
        sb.append("\n        reserved1:            0");
        sb.append("\n        reserved2:            0");
        sb.append("\n        reserved3:            0");
        sb.append("\n        reserved4:            0");
        sb.append("\n        metricDataFormat:     ").append(_metricDataFormat);
        sb.append("\n        numOf_LongVerMetrics: ").append(_numberOfLongVerMetrics);
        return sb.toString();
    }
}
