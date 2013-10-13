package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.Fixed;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class HeadTable extends Table {
    private var _versionFloat:Int;
    private var _fontRevision:Int;
    private var _checkSumAdjustment:Int;
    private var _magicFloat:Int;
    private var _flags:Int;
    private var _unitsPerEm:Int;
    private var _created:Float;
    private var _modified:Float;
    private var _xMin:Int;
    private var _yMin:Int;
    private var _xMax:Int;
    private var _yMax:Int;
    private var _macStyle:Int;
    private var _lowestRecPPEM:Int;
    private var _fontDirectionHInt:Int;
    private var _indexToLocFormat:Int;
    private var _glyphDataFormat:Int;

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.head);
        _versionFloat = di.readInt();
        _fontRevision = di.readInt();
        _checkSumAdjustment = di.readInt();
        _magicFloat = di.readInt();
        _flags = di.readShort();
        _unitsPerEm = di.readShort();
        _created = di.readDouble();
        _modified = di.readDouble();
        _xMin = di.readShort();
        _yMin = di.readShort();
        _xMax = di.readShort();
        _yMax = di.readShort();
        _macStyle = di.readShort();
        _lowestRecPPEM = di.readShort();
        _fontDirectionHInt = di.readShort();
        _indexToLocFormat = di.readShort();
        _glyphDataFormat = di.readShort();
    }

    public function getIndexToLocFormat():Int {
        return _indexToLocFormat;
    }

    public function getCheckSumAdjustment():Int {
        return _checkSumAdjustment;
    }

    public function getCreated():Float {
        return _created;
    }

    public function getFlags():Int {
        return _flags;
    }

    public function getFontDirectionHInt():Int {
        return _fontDirectionHInt;
    }

    public function getFontRevision():Int {
        return _fontRevision;
    }

    public function getGlyphDataFormat():Int {
        return _glyphDataFormat;
    }

    public function getLowestRecPPEM():Int {
        return _lowestRecPPEM;
    }

    public function getMacStyle():Int {
        return _macStyle;
    }

    public function getModified():Float {
        return _modified;
    }


    public function getUnitsPerEm():Int {
        return _unitsPerEm;
    }

    public function getVersionFloat():Int {
        return _versionFloat;
    }

    public function getXMax():Int {
        return _xMax;
    }

    public function getXMin():Int {
        return _xMin;
    }

    public function getYMax():Int {
        return _yMax;
    }

    public function getYMin():Int {
        return _yMin;
    }


    public function toString():String {
        var sb = new StringBuffer();
        sb.append("'head' Table - Font Header\n--------------------------");
        sb.append("\n  'head' version:      ");
        sb.append(Fixed.floatValue(_versionFloat));
        sb.append("\n  fontRevision:        ");
        sb.append(Fixed.roundedFloatValue(_fontRevision, 8));
        sb.append("\n  checkSumAdjustment:  0x");
        sb.append((_checkSumAdjustment));
        sb.append("\n  magicFloat:         0x");
        sb.append((_magicFloat));
        sb.append("\n  flags:               0x");
        sb.append((_flags));
        sb.append("\n  unitsPerEm:          ");
        sb.append(_unitsPerEm);
        sb.append("\n  created:             ");
        sb.append(_created);
        sb.append("\n  modified:            ");
        sb.append(_modified);
        sb.append("\n  xMin:                ");
        sb.append(_xMin);
        sb.append("\n  yMin:                ");
        sb.append(_yMin);
        sb.append("\n  xMax:                ");
        sb.append(_xMax);
        sb.append("\n  yMax:                ");
        sb.append(_yMax);
        sb.append("\n  macStyle bits:       ");
        sb.append((_macStyle));
        sb.append("\n  lowestRecPPEM:       ");
        sb.append(_lowestRecPPEM);
        sb.append("\n  fontDirectionHInt:   ");
        sb.append(_fontDirectionHInt);
        sb.append("\n  indexToLocFormat:    ");
        sb.append(_indexToLocFormat);
        sb.append("\n  glyphDataFormat:     ");
        sb.append(_glyphDataFormat);
        return sb.toString();
    }
}
