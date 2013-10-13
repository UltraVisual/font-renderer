package uk.co.ultravisual.fontrenderer.path;

import flash.geom.Point;
import uk.co.ultravisual.fontrenderer.errors.NonImplementationError;
import flash.geom.Rectangle;

class Segment {

    public function new():Void{

    }

    public function walk(walker:GenericPathWalker, position:Point):Void{
        throw new NonImplementationError();
    }


    public function getBounds(r:Rectangle, position:Point):Rectangle{
        throw new NonImplementationError();
        return null;
    }
}