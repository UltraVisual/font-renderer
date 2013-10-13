package uk.co.ultravisual.fontrenderer.path;

import flash.geom.Rectangle;
import flash.geom.Point;

class CubicBezierSegment extends Segment {

    private var _x1:Float;
    private var _x2:Float;
    private var _x3:Float;
    private var _y1:Float;
    private var _y2:Float;
    private var _y3:Float;

    public function new(x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float):Void {
        super();
        this._x1 = x1;
        this._x2 = x2;
        this._x3 = x3;
        this._y1 = y1;
        this._y2 = y2;
        this._y3 = y3;
    }

    public function calcPoint(t:Float, position:Point):Point {
        var it:Float = 1.0 - t;
        var a1:Float = it * it * it;
        var a2:Float = 3.0 * t * it * it;
        var a3:Float = 3.0 * t * t * it;
        var a4:Float = t * t * t;
        var point:Point = new Point();

        point.x = a1 * position.x + a2 * _x1 + a3 * _x2 + a4 * _x3;
        point.y = a1 * position.y + a2 * _y1 + a3 * _y2 + a4 * _y3;
        return point;
    }

    override public function walk(walker:GenericPathWalker, position:Point):Void {
        //de nada
    }


    override public function getBounds(r:Rectangle, position:Point):Rectangle {
        return null;
    }
}
