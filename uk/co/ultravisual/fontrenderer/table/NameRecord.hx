package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class NameRecord {
    private var _platformId:Int;
    private var _encodingId:Int;
    private var _languageId:Int;
    private var _nameId:Int;
    private var _stringLength:Int;
    private var _stringOffset:Int;
    private var _record:String;

/**
	     *
	     * @param di
	     * @throws IOError
	     */

    public function new(di:GlyphByteArray):Void {
        _platformId = di.readShort();
        _encodingId = di.readShort();
        _languageId = di.readShort();
        _nameId = di.readShort();
        _stringLength = di.readShort();
        _stringOffset = di.readShort();
    }

    public function getEncodingId():Int {
        return _encodingId;
    }

    public function getLanguageId():Int {
        return _languageId;
    }

    public function getNameId():Int {
        return _nameId;
    }

    public function getPlatformId():Int {
        return _platformId;
    }

    public function getRecordString():String {
        return _record;
    }

/**
	     *
	     * @param di
	     * @throws IOError
	     */

    public function loadString(di:GlyphByteArray):Void {
        var sb:StringBuffer = new StringBuffer();
        var i:Int;
        di.increasePosition(_stringOffset);

        if (_platformId == ID.platformUnicode) {
// Unicode (big-endian)
            for (i in 0...Std.parseInt((_stringLength / 2) + "")) {
                sb.append(String.fromCharCode(di.readUnsignedShort()));
            }
        } else if (_platformId == ID.platformMacintosh) {

// Macintosh encoding, ASCII
            for (i in 0...Std.parseInt((_stringLength / 2) + "")) {
                sb.append(String.fromCharCode(di.readByte()));
            }
        } else if (_platformId == ID.platformISO) {

// ISO encoding, ASCII
            for (i in 0..._stringLength) {
                sb.append(String.fromCharCode(di.readByte()));
            }
        } else if (_platformId == ID.platformMicrosoft) {

// Microsoft encoding, Unicode
            var c:UInt;

            for (i in 0...Std.parseInt((_stringLength / 2) + "")) {
                c = di.readUnsignedShort();
                sb.append(String.fromCharCode(c));
            }
        }
        _record = sb.toString();
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("             Platform ID:       ");
        sb.append(_platformId);
        sb.append("\n             Specific ID:       ");
        sb.append(_encodingId);
        sb.append("\n             Language ID:       ");
        sb.append(_languageId);
        sb.append("\n             Name ID:           ");
        sb.append(_nameId);
        sb.append("\n             Length:            ");
        sb.append(_stringLength);
        sb.append("\n             Offset:            ");
        sb.append(_stringOffset);
        sb.append("\n\n");
        sb.append(_record);

        return sb.toString();
    }
}
