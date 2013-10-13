package uk.co.ultravisual.fontrenderer.path;

import flash.geom.Rectangle;

class GenericPath{

    private var subPaths:Array<SubPath>;

    public function new(paths:Array<SubPath>):Void {
        this.subPaths = paths;
    }

    public function walk(walker:GenericPathWalker):Void {
        for (i in 0...this.subPaths.length) {
            var subPath = this.subPaths[i];
            subPath.walk(walker);
        }
    }

    public function getBounds():Rectangle {
        return null;
    }
}
