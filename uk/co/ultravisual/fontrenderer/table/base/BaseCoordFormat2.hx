package uk.co.ultravisual.fontrenderer.table.base;

import uk.co.ultravisual.fontrenderer.table.base.BaseCoord;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class BaseCoordFormat2 extends BaseCoord {
    private var _coordinate:Int;
    private var _referenceGlyph:Int;
    private var _baseCoordPoint:Int;

    public function new(di:GlyphByteArray):Void {
        super();
        _coordinate = di.readShort();
        _referenceGlyph = di.readUnsignedShort();
        _baseCoordPoint = di.readUnsignedShort();
    }

    override public function getBaseCoordFormat():Int {
        return 2;
    }

    override public function getCoordinate():Int {
        return _coordinate;
    }
}
