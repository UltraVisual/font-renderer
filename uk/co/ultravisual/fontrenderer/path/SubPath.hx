package uk.co.ultravisual.fontrenderer.path;

import flash.geom.Rectangle;
import flash.geom.Point;

class SubPath {

    private var startPoint:Point;
    private var segments:Array<Segment>;
    private var closed:Bool;

    public function new(startPoint:Point, segments:Array<Segment>, closed:Bool):Void {
        this.startPoint = startPoint.clone();
        this.segments = segments.concat([]);
        this.closed = closed;
    }

    public function getStartPoint():Point {
        return startPoint.clone();
    }

    public function getClosed():Bool {
        return closed;
    }

    public function getSegments():Array<Segment> {
        return segments.concat([]);
    }

    public function walk(walker:GenericPathWalker):Void {
        var position:Point = startPoint.clone();
        walker.beginSubPath(closed);

        walker.moveTo(startPoint.x, startPoint.y);
        var segmentsLength = segments.length;
        for (i in 0...segmentsLength) {
            var segment = segments[i];
            segment.walk(walker, position);
        }
        walker.endSubPath(startPoint);
    }

    public function getBounds(r:Rectangle):Void {

    }
}
