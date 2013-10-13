package uk.co.ultravisual.fontrenderer.graphics;

import uk.co.ultravisual.fontrenderer.path.GenericPath;
import uk.co.ultravisual.fontrenderer.path.GenericPathWalker;
import flash.display.Graphics;
import uk.co.ultravisual.fontrenderer.path.PathBuilder;

class Graphics2D {

    private var path:PathBuilder;
    private var _stroke:Stroke;
    private var _fill:Fill;
    private var _graphics:Graphics;

    public function new(g:Graphics, stroke:Stroke, fill:Fill, ?path:PathBuilder = null) {
        this._graphics = g;
        this._stroke = stroke;
        this._fill = fill;
        this.path = path == null ? new PathBuilder() : path;
    }

    public function render(walker:GenericPathWalker = null):Void {
        if (this._stroke != null)
            this._stroke.apply(this._graphics);

        if (this._fill != null)
            this._fill.begin(this._graphics, null);

        var pathIterator:GenericPath = path.createPath();
        var graphic = walker != null ? walker : new GenericPathWalker(this._graphics);
        pathIterator.walk(graphic);

        if (this._fill != null)
            this._fill.end(this._graphics);
    }
}
