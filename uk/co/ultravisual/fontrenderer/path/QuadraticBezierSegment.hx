package uk.co.ultravisual.fontrenderer.path;

import flash.geom.Point;

class QuadraticBezierSegment extends CurvedSegment {

    private var _x1:Float;
    private var _y1:Float;
    private var _x2:Float;
    private var _y2:Float;

    public function new(x1:Float, y1:Float, x2:Float, y2:Float):Void {
        super();
        this._x1 = x1;
        this._y1 = y1;
        this._x2 = x2;
        this._y2 = y2;
    }

    public override function calcPoint(t:Float, position:Point):Point {
        var r:Point = new Point();
        var it:Float = 1.0 - t;
        var a1:Float = it * it;
        var a2:Float = 2.0 * t * it;
        var a3:Float = t * t;

        r.x = a1 * position.x + a2 * _x1 + a3 * _x2;
        r.y = a1 * position.y + a2 * _y1 + a3 * _y2;
        return r;
    }
}
