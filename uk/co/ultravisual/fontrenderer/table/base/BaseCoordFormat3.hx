package uk.co.ultravisual.fontrenderer.table.base;
import uk.co.ultravisual.fontrenderer.table.base.BaseCoord;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class BaseCoordFormat3 extends BaseCoord {

    private var _coordinate:Int;
    private var _deviceTableOffset:Int;

    public function new(di:GlyphByteArray):Void {
        super();
        _coordinate = di.readShort();
        _deviceTableOffset = di.readUnsignedShort();
    }

    override public function getBaseCoordFormat():Int {
        return 2;
    }

    override public function getCoordinate():Int {
        return _coordinate;
    }
}
