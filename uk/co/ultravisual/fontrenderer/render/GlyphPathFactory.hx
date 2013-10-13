package uk.co.ultravisual.fontrenderer.render;

import uk.co.ultravisual.fontrenderer.geom.GlyphPoint;
import uk.co.ultravisual.fontrenderer.path.PathBuilder;
import uk.co.ultravisual.fontrenderer.geom.Glyph;

class GlyphPathFactory {

    public static function buildPath(glyph:Glyph):PathBuilder {
        if (glyph == null)
            return null;

        var path:PathBuilder;
        var firstIndex:Int = 0;
        var count:Int = 0;

        path = new PathBuilder();

        for (i in 0...glyph.getPointCount()) {
            count++;
            if (glyph.getPoint(i).endOfContour) {
                addContourToPath(path, glyph, firstIndex, count);
                firstIndex = i + 1;
                count = 0;
            }
        }
        return path;
    }

    private static function addContourToPath(gp:PathBuilder, glyph:Glyph, startIndex:Int, count:Int):Void {
        var offset:Int = 0;
        var connect:Bool = false;

        while (offset < count) {
            var point_minus1:GlyphPoint = glyph.getPoint((offset == 0) ? startIndex + count - 1 : startIndex + (offset - 1) % count);
            var point:GlyphPoint = glyph.getPoint(startIndex + offset % count);
            var point_plus1:GlyphPoint = glyph.getPoint(startIndex + (offset + 1) % count);
            var point_plus2:GlyphPoint = glyph.getPoint(startIndex + (offset + 2) % count);
            if (offset == 0) {
                gp.moveTo(point.x, -point.y);
            }

            if (point.onCurve && point_plus1.onCurve) {
                gp.lineTo(point_plus1.x, -point_plus1.y);
                offset++;

            } else if (point.onCurve && !point_plus1.onCurve && point_plus2.onCurve) {
                gp.curveTo(point_plus1.x, -point_plus1.y, point_plus2.x, -point_plus2.y);
                offset += 2;
            } else if (point.onCurve && !point_plus1.onCurve && !point_plus2.onCurve) {
                gp.curveTo(point_plus1.x, -point_plus1.y, midValue(point_plus1.x, point_plus2.x), -midValue(point_plus1.y, point_plus2.y));
                offset += 2;
            } else if (!point.onCurve && !point_plus1.onCurve) {
                gp.curveTo(point.x, -point.y, midValue(point.x, point_plus1.x), -midValue(point.y, point_plus1.y));
                offset++;
            } else if (!point.onCurve && point_plus1.onCurve) {
                gp.curveTo(point.x, -point.y, point_plus1.x, -point_plus1.y);
                offset++;
            } else {
                trace("Cannot draw the glyph");
                break;
            }
            connect = true;
        }
    }

    private static function midValue(a:Float, b:Float):Float {
        return a + (b - a) / 2;
    }
}
