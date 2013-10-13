package uk.co.ultravisual.fontrenderer.geom;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.table.GlyfDescript;
class Glyph {

    private var _leftSideBearing:Int;
    private var _advanceWidth:Int;
    private var points:CappedArray<GlyphPoint>;

    public function new(gd:GlyfDescript, lsb:Int, advance:Int):Void {
        _leftSideBearing = lsb;
        _advanceWidth = advance;
        describe(gd);
    }

    public function getAdvanceWidth():Int {
        return _advanceWidth;
    }

    public function getLeftSideBearing():Int {
        return _leftSideBearing;
    }

    public function getPoint(i:Int):GlyphPoint {
        return points.get(i);
    }

    public function getPointCount():Int {
        return points.size();
    }

    public function reset():Void {
    }

    public function scale(factor:Int):Void {
        for (i in 0...points.size()) {
            points.get(i).x = ((((cast points.get(i).x) << 10) * factor) >> 26) + 0.0;
            points.get(i).y = ((((cast points.get(i).y) << 10) * factor) >> 26) + 0.0;
        }

        _leftSideBearing = (( _leftSideBearing * factor) >> 6);
        _advanceWidth = (_advanceWidth * factor) >> 6;
    }

    private function describe(gd:GlyfDescript):Void {
        var endPtIndex:Int = 0;
        points = new CappedArray<GlyphPoint>( gd.getPointCount() + 2 );

        for (i in 0...gd.getPointCount()) {
            var endPt:Bool = gd.getEndPtOfContours(endPtIndex) == i;
            if (endPt) {
                endPtIndex++;
            }
            points.add(new GlyphPoint( gd.getXCoordinate(i), gd.getYCoordinate(i), (gd.getFlags(i) & GlyfDescript.onCurve) != 0, endPt));
        }

        points.addAt(gd.getPointCount(), new GlyphPoint(0, 0, true, true));
        points.addAt(gd.getPointCount() + 1, new GlyphPoint(_advanceWidth, 0, true, true));
    }
}
