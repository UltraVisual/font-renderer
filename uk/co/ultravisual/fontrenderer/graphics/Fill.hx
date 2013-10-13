package uk.co.ultravisual.fontrenderer.graphics;

import flash.display.Graphics;
import flash.geom.Rectangle;

class Fill{

    private var color:Int;
    private var alpha:Float;

    public function new(?color:Int = 0, ?alpha:Float = 1.0) {
        this.color = color;
        this.alpha = alpha;
    }
    public function getAlpha():Float {
        return alpha;
    }

    public function setAlpha(value:Float):Void {
        var oldValue:Float = alpha;
        if (value != oldValue) {
            alpha = value;
        }
    }

    public function getColor():Int {
        return color;
    }

    public function setColor(value:Int):Void {
        var oldValue:Int = color;
        if (value != oldValue) {
            color = value;
        }
    }

    public function begin(graphics:Graphics, rc:Rectangle):Void {
        graphics.beginFill(color, alpha);
    }

    public function end(graphics:Graphics):Void {
        graphics.endFill();
    }
}
