package uk.co.ultravisual.fontrenderer.path;

import flash.geom.Rectangle;
import flash.geom.Point;

class CurveSegment extends Segment{
    private var x1:Float;
    private var y1:Float;
    private var x2:Float;
    private var y2:Float;


    public function new(x1:Float, y1:Float, x2:Float, y2:Float):Void {
        super();
        this.x1 = x1;
        this.x2 = x2;
        this.y1 = y1;
        this.y2 = y2;
    }

    override public function walk(walker:GenericPathWalker, position:Point):Void {
        walker.curveTo(this.x1, this.y1, this.x2, this.y2);
        position.x = this.x2;
        position.y = this.y2;
    }

    override public function getBounds(r:Rectangle, position:Point):Rectangle {
        return null;
    }
}
