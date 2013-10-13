package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class VTableRecord {
    private var _yPelHeight:UInt;
    private var _yMax:Int;
    private var _yMin:Int;

    public function new(di:GlyphByteArray):Void {
        _yPelHeight = di.readUnsignedShort();
        _yMax = di.readShort();
        _yMin = di.readShort();
    }

    public function getYPelHeight():UInt {
        return _yPelHeight;
    }

    public function getYMax():Int {
        return _yMax;
    }

    public function getYMin():Int {
        return _yMin;
    }
}
