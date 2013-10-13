package uk.co.ultravisual.fontrenderer.graphics;

import flash.display.JointStyle;
import flash.display.CapsStyle;
import flash.display.LineScaleMode;
import flash.display.Graphics;

class Stroke {

    private var caps:String;
    private var color:UInt;
    private var joints:String;
    private var miterLimit:Float;
    private var weight:Float;
    private var pixelHinting:Bool;
    private var scaleMode:String;
    private var alpha:Float;

    public function new(color:UInt = 0, weight:Float = 1, alpha:Float = 1.0, pixelHinting:Bool = false, scaleMode:String = "normal", caps:String = null, joints:String = null, miterLimit:Float = 0) {
        this.color = color;
        this.weight = weight;
        this.alpha = alpha;
        this.pixelHinting = pixelHinting;
        this.scaleMode = scaleMode;
        this.caps = caps;
        this.joints = joints;
        this.miterLimit = miterLimit;
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

    public function getCaps():String {
        return caps;
    }

    public function setCaps(value:String):Void {
        var oldValue:String = caps;
        if (value != oldValue) {
            caps = value;
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

    public function getJoints():String {
        return joints;
    }

    public function setJoints(value:String):Void {
        var oldValue:String = joints;
        if (value != oldValue) {
            joints = value;
        }
    }

    public function getMiterLimit():Float {
        return miterLimit;
    }

    public function setMiterLimit(value:Float):Void {
        var oldValue:Float = miterLimit;
        if (value != oldValue) {
            miterLimit = value;
        }
    }

    private function getPixelHinting():Bool {
        return pixelHinting;
    }

    private function setPixelHinting(value:Bool):Void {
        var oldValue:Bool = pixelHinting;
        if (value != oldValue) {
            pixelHinting = value;
        }
    }


    private function getScaleMode():String {
        return scaleMode;
    }

    private function setScaleMode(value:String):Void {
        scaleMode = value;
    }

    private function getWeight():Float {
        return weight;
    }

    private function setWeight(value:Float):Void {
        var oldValue:Float = weight;
        if (value != oldValue) {
            weight = value;
        }
    }

    public function apply(g:Graphics):Void {
        g.lineStyle(weight, color, alpha, pixelHinting, getLineScaleMode(scaleMode), getCapStyle(caps), getJointStyle(joints), miterLimit);
    }

    private function getJointStyle(val:String):JointStyle {
        if(val == null) return JointStyle.ROUND;
        switch(val.toUpperCase()){
            case "BEVEL":
                return JointStyle.BEVEL;
            case "MITER" :
                return JointStyle.MITER;
            default : return JointStyle.ROUND;
        }
    }


    private function getLineScaleMode(value:String):LineScaleMode {
        if(value == null) return LineScaleMode.NONE;
        switch(value.toUpperCase()){
            case "NORMAL":
                return LineScaleMode.NORMAL;
            case "HORIZONTAL":
                return LineScaleMode.HORIZONTAL;
            case "VERTICAL":
                return LineScaleMode.VERTICAL;
            default : return LineScaleMode.NONE;
        }
    }

    private function getCapStyle(value:String):CapsStyle {
        if(value == null) return CapsStyle.NONE;
        switch(value.toUpperCase()){
            case "ROUND":
                return CapsStyle.ROUND;
            case "SQUARE" :
                return CapsStyle.SQUARE;
            default : return CapsStyle.NONE;
        }
    }
}