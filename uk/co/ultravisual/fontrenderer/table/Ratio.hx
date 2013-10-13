package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Ratio {
    private var _bCharSet:Int;
    private var _xRatio:Int;
    private var _yStartRatio:Int;
    private var _yEndRatio:Int;

    public function new(di:GlyphByteArray):Void {
        _bCharSet = di.readByte();
        _xRatio = di.readByte();
        _yStartRatio = di.readByte();
        _yEndRatio = di.readByte();
    }

    public function getBCharSet():Int {
        return _bCharSet;
    }

    public function getXRatio():Int {
        return _xRatio;
    }

    public function getYStartRatio():Int {
        return _yStartRatio;
    }

    public function getYEndRatio():Int {
        return _yEndRatio;
    }
}
