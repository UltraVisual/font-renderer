package uk.co.ultravisual.fontrenderer.table.base;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class BaseTable extends Table{

    private var _version:Int;
    private var _horizAxisOffset:UInt;
    private var _vertAxisOffset:UInt;
    private var _horizAxis:Axis;
    private var _vertAxis:Axis;
    private var _buf:GlyphByteArray;

/** 
	    * Creates a new instance of BaseTable 
	    * 
	    */

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.BASE);

// Load entire table into a buffer, and create another input stream
        _buf = new GlyphByteArray();
        di.readBytes(_buf, 0, _de.length);
        var di2:GlyphByteArray = getDataInputForOffset(0);

        _version = di2.readInt();
        _horizAxisOffset = di2.readUnsignedShort();
        _vertAxisOffset = di2.readUnsignedShort();

        if (_horizAxisOffset != 0) {
            _horizAxis = new Axis(_horizAxisOffset, this);
        }

        if (_vertAxisOffset != 0) {
            _vertAxis = new Axis(_vertAxisOffset, this);
        }

// Let go of the buffer
        _buf = null;
    }


    public function getDataInputForOffset(offset:Int):GlyphByteArray {
        var position:UInt = _buf.getPosition();
        var _bytes:GlyphByteArray = new GlyphByteArray();
        _buf.readBytes(_bytes, offset);
        _buf.setPosition(position);
        return _bytes;
    }

    public static function tagAsString(tag:Int):String {
        var c:String = "";
        c += String.fromCharCode((tag >> 24) & 0xff);
        c += String.fromCharCode((tag >> 16) & 0xff);
        c += String.fromCharCode((tag >> 8) & 0xff);
        c += String.fromCharCode(tag & 0xff);
        return c;
    }

    public function toString():String {
        var sb:String = "; 'BASE' Table - Baseline\n;-------------------------------------\n\n" +
        "BASEHeader BASEHeaderT" + (0) +
        "\n" + _version +
        "\nAxisT" + _horizAxisOffset +
        "\nAxisT" + _vertAxisOffset;

        if (_horizAxis != null) {
            sb + "\n" + _horizAxis.toString();
        }

        if (_vertAxis != null) {
            sb += "\n" + _vertAxis.toString();
        }
        return sb;
    }

}