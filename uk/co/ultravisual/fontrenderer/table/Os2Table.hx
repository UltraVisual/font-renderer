package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Os2Table extends Table{
    private var _version:UInt;
    private var _xAvgCharWidth:Int;
    private var _usWeightClass:Int;
    private var _usWidthClass:Int;
    private var _fsType:Int;
    private var _ySubscriptXSize:Int;
    private var _ySubscriptYSize:Int;
    private var _ySubscriptXOffset:Int;
    private var _ySubscriptYOffset:Int;
    private var _ySuperscriptXSize:Int;
    private var _ySuperscriptYSize:Int;
    private var _ySuperscriptXOffset:Int;
    private var _ySuperscriptYOffset:Int;
    private var _yStrikeoutSize:Int;
    private var _yStrikeoutPosition:Int;
    private var _sFamilyClass:Int;
    private var _panose:Panose;
    private var _ulUnicodeRange1:Int;
    private var _ulUnicodeRange2:Int;
    private var _ulUnicodeRange3:Int;
    private var _ulUnicodeRange4:Int;
    private var _achVendorID:Int;
    private var _fsSelection:Int;
    private var _usFirstCharIndex:UInt;
    private var _usLastCharIndex:UInt;
    private var _sTypoAscender:Int;
    private var _sTypoDescender:Int;
    private var _sTypoLineGap:Int;
    private var _usWinAscent:UInt;
    private var _usWinDescent:UInt;
    private var _ulCodePageRange1:Int;
    private var _ulCodePageRange2:Int;
    private var _sxHeight:Int;
    private var _sCapHeight:Int;
    private var _usDefaultChar:Int;
    private var _usBreakChar:Int;
    private var _usMaxContext:Int;

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.OS_2);

        _version = di.readUnsignedShort();
        _xAvgCharWidth = di.readShort();
        _usWeightClass = di.readUnsignedShort();
        _usWidthClass = di.readUnsignedShort();
        _fsType = di.readShort();
        _ySubscriptXSize = di.readShort();
        _ySubscriptYSize = di.readShort();
        _ySubscriptXOffset = di.readShort();
        _ySubscriptYOffset = di.readShort();
        _ySuperscriptXSize = di.readShort();
        _ySuperscriptYSize = di.readShort();
        _ySuperscriptXOffset = di.readShort();
        _ySuperscriptYOffset = di.readShort();
        _yStrikeoutSize = di.readShort();
        _yStrikeoutPosition = di.readShort();
        _sFamilyClass = di.readShort();

        var buf:GlyphByteArray = new GlyphByteArray();
        di.readBytes(buf, 0, 10);

        _panose = new Panose(buf);

        _ulUnicodeRange1 = di.readInt();
        _ulUnicodeRange2 = di.readInt();
        _ulUnicodeRange3 = di.readInt();
        _ulUnicodeRange4 = di.readInt();
        _achVendorID = di.readInt();
        _fsSelection = di.readShort();
        _usFirstCharIndex = di.readUnsignedShort();
        _usLastCharIndex = di.readUnsignedShort();
        _sTypoAscender = di.readShort();
        _sTypoDescender = di.readShort();
        _sTypoLineGap = di.readShort();
        _usWinAscent = di.readUnsignedShort();
        _usWinDescent = di.readUnsignedShort();
        _ulCodePageRange1 = di.readInt();
        _ulCodePageRange2 = di.readInt();

// OpenType 1.3
        if (_version == 2) {
            _sxHeight = di.readShort();
            _sCapHeight = di.readShort();
            _usDefaultChar = di.readUnsignedShort();
            _usBreakChar = di.readUnsignedShort();
            _usMaxContext = di.readUnsignedShort();
        }
    }

    public function getVersion():UInt {
        return _version;
    }

    public function getAvgCharWidth():Int {
        return _xAvgCharWidth;
    }

    public function getWeightClass():Int {
        return _usWeightClass;
    }

    public function getWidthClass():Int {
        return _usWidthClass;
    }

    public function getLicenseType():Int {
        return _fsType;
    }

    public function getSubscriptXSize():Int {
        return _ySubscriptXSize;
    }

    public function getSubscriptYSize():Int {
        return _ySubscriptYSize;
    }

    public function getSubscriptXOffset():Int {
        return _ySubscriptXOffset;
    }

    public function getSubscriptYOffset():Int {
        return _ySubscriptYOffset;
    }

    public function getSuperscriptXSize():Int {
        return _ySuperscriptXSize;
    }

    public function getSuperscriptYSize():Int {
        return _ySuperscriptYSize;
    }

    public function getSuperscriptXOffset():Int {
        return _ySuperscriptXOffset;
    }

    public function getSuperscriptYOffset():Int {
        return _ySuperscriptYOffset;
    }

    public function getStrikeoutSize():Int {
        return _yStrikeoutSize;
    }

    public function getStrikeoutPosition():Int {
        return _yStrikeoutPosition;
    }

    public function getFamilyClass():Int {
        return _sFamilyClass;
    }

    public function getPanose():Panose {
        return _panose;
    }

    public function getUnicodeRange1():Int {
        return _ulUnicodeRange1;
    }

    public function getUnicodeRange2():Int {
        return _ulUnicodeRange2;
    }

    public function getUnicodeRange3():Int {
        return _ulUnicodeRange3;
    }

    public function getUnicodeRange4():Int {
        return _ulUnicodeRange4;
    }

    public function getVendorID():Int {
        return _achVendorID;
    }

    public function getSelection():Int {
        return _fsSelection;
    }

    public function getFirstCharIndex():UInt {
        return _usFirstCharIndex;
    }

    public function getLastCharIndex():UInt {
        return _usLastCharIndex;
    }

    public function getTypoAscender():Int {
        return _sTypoAscender;
    }

    public function getTypoDescender():Int {
        return _sTypoDescender;
    }

    public function getTypoLineGap():Int {
        return _sTypoLineGap;
    }

    public function getWinAscent():UInt {
        return _usWinAscent;
    }

    public function getWinDescent():UInt {
        return _usWinDescent;
    }

    public function getCodePageRange1():Int {
        return _ulCodePageRange1;
    }

    public function getCodePageRange2():Int {
        return _ulCodePageRange2;
    }

    public function getXHeight():Int {
        return _sxHeight;
    }

    public function getCapHeight():Int {
        return _sCapHeight;
    }

    public function getDefaultChar():Int {
        return _usDefaultChar;
    }

    public function getBreakChar():Int {
        return _usBreakChar;
    }

    public function getMaxContext():Int {
        return _usMaxContext;
    }

    public function toString():String {
        var sb = new StringBuffer();
        sb.append("'OS/2' Table - OS/2 and Windows Metrics\n---------------------------------------");
        sb.append("\n  'OS/2' version:      ").append(_version);
        sb.append("\n  xAvgCharWidth:       ").append(_xAvgCharWidth);
        sb.append("\n  usWeightClass:       ").append(_usWeightClass);
        sb.append("\n  usWidthClass:        ").append(_usWidthClass);
        sb.append("\n  fsType:              0x").append((_fsType));
        sb.append("\n  ySubscriptXSize:     ").append(_ySubscriptXSize);
        sb.append("\n  ySubscriptYSize:     ").append(_ySubscriptYSize);
        sb.append("\n  ySubscriptXOffset:   ").append(_ySubscriptXOffset);
        sb.append("\n  ySubscriptYOffset:   ").append(_ySubscriptYOffset);
        sb.append("\n  ySuperscriptXSize:   ").append(_ySuperscriptXSize);
        sb.append("\n  ySuperscriptYSize:   ").append(_ySuperscriptYSize);
        sb.append("\n  ySuperscriptXOffset: ").append(_ySuperscriptXOffset);
        sb.append("\n  ySuperscriptYOffset: ").append(_ySuperscriptYOffset);
        sb.append("\n  yStrikeoutSize:      ").append(_yStrikeoutSize);
        sb.append("\n  yStrikeoutPosition:  ").append(_yStrikeoutPosition);
        sb.append("\n  sFamilyClass:        ").append(_sFamilyClass >> 8);
        sb.append("    subclass = ").append(_sFamilyClass & 0xff);
        sb.append("\n  PANOSE:              ").append(_panose.toString());
        sb.append("\n  Unicode Range 1( Bits 0 - 31 ): ").append((_ulUnicodeRange1));
        sb.append("\n  Unicode Range 2( Bits 32- 63 ): ").append((_ulUnicodeRange2));
        sb.append("\n  Unicode Range 3( Bits 64- 95 ): ").append((_ulUnicodeRange3));
        sb.append("\n  Unicode Range 4( Bits 96-127 ): ").append((_ulUnicodeRange4));
        sb.append("\n  achVendID:           '").append(getVendorIDAsString());
        sb.append("'\n  fsSelection:         0x").append((_fsSelection));
        sb.append("\n  usFirstCharIndex:    0x").append((_usFirstCharIndex));
        sb.append("\n  usLastCharIndex:     0x").append((_usLastCharIndex));
        sb.append("\n  sTypoAscender:       ").append(_sTypoAscender);
        sb.append("\n  sTypoDescender:      ").append(_sTypoDescender);
        sb.append("\n  sTypoLineGap:        ").append(_sTypoLineGap);
        sb.append("\n  usWinAscent:         ").append(_usWinAscent);
        sb.append("\n  usWinDescent:        ").append(_usWinDescent);
        sb.append("\n  CodePage Range 1( Bits 0 - 31 ): ").append((_ulCodePageRange1));
        sb.append("\n  CodePage Range 2( Bits 32- 63 ): ").append((_ulCodePageRange2));
        return sb.toString();
    }

    private function getVendorIDAsString():String {
        var sb = new StringBuffer();
        sb.append(String.fromCharCode((_achVendorID >> 24) & 0xff));
        sb.append(String.fromCharCode((_achVendorID >> 16) & 0xff));
        sb.append(String.fromCharCode((_achVendorID >> 8) & 0xff));
        sb.append(String.fromCharCode((_achVendorID) & 0xff));
        return sb.toString();
    }

}
