package uk.co.ultravisual.fontrenderer.table.base;

import uk.co.ultravisual.fontrenderer.table.base.BaseCoord;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class BaseCoordFormat1 extends BaseCoord {

    private var _coordinate:Int;

    public function new(di:GlyphByteArray):Void {
        super();
        _coordinate = di.readShort();
    }

    override public function getBaseCoordFormat():Int {
        return 1;
    }

    override public function getCoordinate():Int {
        return _coordinate;
    }
}
