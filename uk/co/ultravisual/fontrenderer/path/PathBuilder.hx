package uk.co.ultravisual.fontrenderer.path;

import flash.errors.Error;
import flash.geom.Point;
import uk.co.ultravisual.fontrenderer.collection.ArrayCollection;

class PathBuilder {

    private var _subPaths:ArrayCollection<SubPath>;
    public var segments:ArrayCollection<Segment>;
    public var startPoint:Point;
    public var hasStartPoint:Bool = false;

    public function new():Void {
        this._subPaths = new ArrayCollection<SubPath>();
        this.segments = new ArrayCollection<Segment>();
        this.startPoint = new Point();
    }

    public function getHasStartPoint():Bool {
        return this.hasStartPoint;
    }

    public function moveTo(x:Float, y:Float):Void {
        if (hasStartPoint)
            endSubPath(false);
        this.startPoint.x = x;
        this.startPoint.y = y;
        this.hasStartPoint = true;
    }

    public function lineTo(x:Float, y:Float):Void {
        if (hasStartPoint)
            this.segments.addItem(new LineSegment(x, y));
        else
            moveTo(x, y);
    }

    public function curveTo(anchor_x:Float, anchor_y:Float, dest_x:Float, dest_y:Float):Void {
        addSegment(new CurveSegment( anchor_x, anchor_y, dest_x, dest_y ));
    }

    public function quadTo(anchor_x:Float, anchor_y:Float, dest_x:Float, dest_y:Float):Void {
        addSegment(new QuadraticBezierSegment( anchor_x, anchor_y, dest_x, dest_y ));
    }

    public function cubeTo(anchor_x:Float, anchor_y:Float, anchor_x2:Float, anchor_y2:Float, dest_x:Float, dest_y:Float):Void {
        addSegment(new CubicBezierSegment( anchor_x, anchor_y, anchor_x2, anchor_y2, dest_x, dest_y ));
    }

    public function addSegment(s:Segment):Void {
        if (!hasStartPoint)
            throw new Error("There is no start point!!");
        this.segments.addItem(s);
    }

    public function close():Void {
        endSubPath(true);
    }

    private function endSubPath(closed:Bool):Void {
        if (this.segments.length > 0) {
            var subPath:SubPath = new SubPath(this.startPoint, this.segments.toArray(), closed);
            this._subPaths.addItem(subPath);
            this.segments.removeAll();
        }
        this.hasStartPoint = false;
    }

    public function createPath():GenericPath {
        this.endSubPath(false);
        return new GenericPath(this._subPaths.toArray());
    }
}
