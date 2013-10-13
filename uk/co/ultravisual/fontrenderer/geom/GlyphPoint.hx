package uk.co.ultravisual.fontrenderer.geom;

import flash.geom.Point;

class GlyphPoint extends Point{

    public var onCurve:Bool = true;
    public var endOfContour:Bool = false;
    public var touched:Bool = false;

    public function new(_x:Int, _y:Int, _onCurve:Bool, _endOfContour:Bool):Void {
        super(_x, _y);
        onCurve = _onCurve;
        endOfContour = _endOfContour;
    }
}
