package uk.co.ultravisual.fontrenderer.path;
import uk.co.ultravisual.fontrenderer.errors.NonImplementationError;
import flash.geom.Point;
import flash.geom.Rectangle;
class CurvedSegment extends Segment{

    public function new():Void {
       super();
    }

    override public function getBounds(r:Rectangle, position:Point):Rectangle {
        return null;
    }

    public function calcPoint(t:Float, position:Point):Point {
        throw new NonImplementationError("calPoint must be overridden by extended class");
        return null;
    }

    override public function walk(walker:GenericPathWalker, position:Point):Void {
        var p1:Point = position;
        var p2:Point = calcPoint(1.0, position);

        iterate(walker, position, 0.0, p1, 1.0, p2, 1);
        position.x = p2.x;
        position.y = p2.y;
    }

    private function iterate(walker:GenericPathWalker, position:Point, t1:Float, p1:Point, t2:Float, p2:Point, error:Float):Void {
        var tc:Float = (t1 + t2) / 2.0;
        var pc:Point = calcPoint(tc, position);
        var ex:Float;
        var ey:Float;
        var tex:Float;
        var tey:Float;

        ex = pc.x - (p1.x + p2.x) / 2.0;
        ey = pc.y - (p1.y + p2.y) / 2.0;

        tex = ex + ey;
        tey = ex + ey;
        if (tex * tex + tey * tey >= error * error) {
            iterate(walker, position, t1, p1, tc, pc, error);
            iterate(walker, position, tc, pc, t2, p2, error);
        } else {
            walker.lineTo(p2.x, p2.y);
        }
    }
}
