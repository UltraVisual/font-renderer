package uk.co.ultravisual.fontrenderer.path;

import flash.geom.Rectangle;
import flash.geom.Point;

class LineSegment extends Segment {
    private var x:Float;
    private var y:Float;

    public function new(x1:Float, y1:Float):Void {
        super();
        this.x = x1;
        this.y = y1;
    }

    override public function walk(walker:GenericPathWalker, position:Point):Void {
        walker.lineTo(x, y);
        position.x = x;
        position.y = y;
    }

    override public function getBounds(r:Rectangle, position:Point):Rectangle {
        return new Rectangle();
    }
}
