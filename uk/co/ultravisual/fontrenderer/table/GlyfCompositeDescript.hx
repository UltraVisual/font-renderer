package uk.co.ultravisual.fontrenderer.table;
import flash.errors.IOError;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.collection.ArrayCollection;
class GlyfCompositeDescript extends GlyfDescript {
    private var _components:ArrayCollection<GlyfCompositeComp>;

    public function new(parentTable:GlyfTable, glyphIndex:Int, di:GlyphByteArray):Void {
        super(parentTable, glyphIndex, -1, di);
        var comp:GlyfCompositeComp;
        _components = new ArrayCollection<GlyfCompositeComp>();
        var firstIndex:Int = 0;
        var firstContour:Int = 0;

        try {
            do {
                _components.addItem(comp = new GlyfCompositeComp(firstIndex, firstContour, di));
                var desc:GlyfDescript = parentTable.getDescription(comp.getGlyphIndex());
                if (desc != null) {
                    firstIndex += desc.getPointCount();
                    firstContour += desc.getContourCount();
                }
            } while ((comp.getFlags() & GlyfCompositeComp.MORE_COMPONENTS) != 0);

            if ((comp.getFlags() & GlyfCompositeComp.WE_HAVE_INSTRUCTIONS) != 0) {
                readInstructions(di, di.readShort());
            }

        } catch (e:IOError) {
            throw e;
        }
    }

    override public function getEndPtOfContours(i:Int):Int {
        var c:GlyfCompositeComp = getCompositeCompEndPt(i);
        if (c != null) {
            var gd  = _parentTable.getDescription(c.getGlyphIndex());
            return gd.getEndPtOfContours(i - c.getFirstContour()) + c.getFirstIndex();
        }
        return 0;
    }


    override public function getFlags(i:Int):Int {
        var c:GlyfCompositeComp = getCompositeComp(i);
        if (c != null) {
            var gd = _parentTable.getDescription(c.getGlyphIndex());
            return gd.getFlags(i - c.getFirstIndex());
        }
        return 0;
    }

    override public function getXCoordinate(i:Int):Int {
        var c:GlyfCompositeComp = getCompositeComp(i);
        if (c != null) {
            var gd = _parentTable.getDescription(c.getGlyphIndex());
            var n:Int = i - c.getFirstIndex();
            var x:Int = gd.getXCoordinate(n);
            var y:Int = gd.getYCoordinate(n);
            var x1:Int = c.scaleX(x, y);

            x1 += c.getXTranslate();
            return x1;
        }
        return 0;
    }

    override public function getYCoordinate(i:Int):Int {
        var c:GlyfCompositeComp = getCompositeComp(i);
        if (c != null) {
            var gd = _parentTable.getDescription(c.getGlyphIndex());
            var n:Int = i - c.getFirstIndex();
            var x:Int = gd.getXCoordinate(n);
            var y:Int = gd.getYCoordinate(n);
            var y1:Int = c.scaleY(x, y);
            y1 += c.getYTranslate();
            return y1;
        }
        return 0;
    }

    override public function isComposite():Bool {
        return true;
    }

    override public function getPointCount():Int {
        var c:GlyfCompositeComp =_components.getItemAt(_components.length - 1);
        var gd = _parentTable.getDescription(c.getGlyphIndex());
        if (gd != null) {
            return c.getFirstIndex() + gd.getPointCount();
        } else {
            return 0;
        }
    }

    override public function getContourCount():Int {
        var c:GlyfCompositeComp = _components.getItemAt(_components.length - 1);
        var count = _parentTable.getDescription(c.getGlyphIndex()) != null ? _parentTable.getDescription(c.getGlyphIndex()).getContourCount() : 0;
        return c.getFirstContour() + count;
    }

    public function getComponentIndex(i:Int):Int {
        return _components.getItemAt(i).getFirstIndex();
    }

    public function getComponentCount():Int {
        return _components.length;
    }

    public function getComponent(i:Int):GlyfCompositeComp {
        return _components.getItemAt(i);
    }


    public function getCompositeComp(i:Int):GlyfCompositeComp {
        var c:GlyfCompositeComp;
        for (n in 0..._components.length) {
            c = _components.getItemAt(n);
            var gd  = _parentTable.getDescription(c.getGlyphIndex());
            if (c.getFirstIndex() <= i && i < (c.getFirstIndex() + gd.getPointCount())) {
                return c;
            }
        }
        return null;
    }

    public function getCompositeCompEndPt(i:Int):GlyfCompositeComp {
        var c:GlyfCompositeComp;
        for (j in 0..._components.length) {
            c = _components.getItemAt(j);
            var gd = _parentTable.getDescription(c.getGlyphIndex());
            if (c.getFirstContour() <= i && i < (c.getFirstContour() + gd.getContourCount())) {
                return c;
            }
        }
        return null;
    }
}
