package uk.co.ultravisual.fontrenderer.path;

import flash.geom.Point;
import flash.display.Graphics;

class GenericPathWalker {
    private var graphic:Graphics;
    private var closed:Bool;

    public function new(g:Graphics) {
        this.graphic = g;
    }

    public function beginSubPath(closed:Bool):Void {
        this.closed = closed;
    }

    public function endSubPath(startPoint:Point):Void {
        if (this.closed)
            this.graphic.lineTo(startPoint.x, startPoint.y);
    }

    public function lineTo(x:Float, y:Float):Void {
        this.graphic.lineTo(x, y);
    }

    public function moveTo(x:Float, y:Float):Void {
        this.graphic.moveTo(x, y);
    }

    public function curveTo(x1:Float, y1:Float, x2:Float, y2:Float):Void {
        this.graphic.curveTo(x1, y1, x2, y2);
    }
}
