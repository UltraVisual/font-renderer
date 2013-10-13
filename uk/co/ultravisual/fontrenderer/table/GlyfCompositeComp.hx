package uk.co.ultravisual.fontrenderer.table;
import Std;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class GlyfCompositeComp {
    public static var ARG_1_AND_2_ARE_WORDS:Int = 0x0001;
    public static var ARGS_ARE_XY_VALUES:Int = 0x0002;
    public static var ROUND_XY_TO_GRID:Int = 0x0004;
    public static var WE_HAVE_A_SCALE:Int = 0x0008;
    public static var MORE_COMPONENTS:Int = 0x0020;
    public static var WE_HAVE_AN_X_AND_Y_SCALE:Int = 0x0040;
    public static var WE_HAVE_A_TWO_BY_TWO:Int = 0x0080;
    public static var WE_HAVE_INSTRUCTIONS:Int = 0x0100;
    public static var USE_MY_METRICS:Int = 0x0200;

    private var _firstIndex:Int;
    private var _firstContour:Int;
    private var _argument1:Int;
    private var _argument2:Int;
    private var _flags:Int;
    private var _glyphIndex:Int;
    private var _xscale:Float = 1.0;
    private var _yscale:Float = 1.0;
    private var _scale01:Float = 0.0;
    private var _scale10:Float = 0.0;
    private var _xtranslate:Int = 0;
    private var _ytranslate:Int = 0;
    private var _point1:Int = 0;
    private var _point2:Int = 0;

/**
	     *
	     * @param firstIndex
	     * @param firstContour
	     * @param di
	     * @throws IOError
	     */

    public function new(firstIndex:Int, firstContour:Int, di:GlyphByteArray):Void {
        _firstIndex = firstIndex;
        _firstContour = firstContour;
        _flags = di.readShort();
        _glyphIndex = di.readShort();

        if ((_flags & ARG_1_AND_2_ARE_WORDS) != 0) {
            _argument1 = di.readShort();
            _argument2 = di.readShort();
        } else {
            _argument1 = di.readByte();
            _argument2 = di.readByte();
        }

        if ((_flags & ARGS_ARE_XY_VALUES) != 0) {
            _xtranslate = _argument1;
            _ytranslate = _argument2;
        } else {
            _point1 = _argument1;
            _point2 = _argument2;
        }

        var i:Int;
        if ((_flags & WE_HAVE_A_SCALE) != 0) {
            i = di.readShort();
            _xscale = _yscale = i / 0x4000;
        } else if ((_flags & WE_HAVE_AN_X_AND_Y_SCALE) != 0) {
            i = di.readShort();
            _xscale = i / 0x4000;
            i = di.readShort();
            _yscale = i / 0x4000;
        } else if ((_flags & WE_HAVE_A_TWO_BY_TWO) != 0) {
            i = di.readShort();
            _xscale = i / 0x4000;
            i = di.readShort();
            _scale01 = i / 0x4000;
            i = di.readShort();
            _scale10 = i / 0x4000;
            i = di.readShort();
            _yscale = i / 0x4000;
        }
    }

    public function getFirstIndex():Int {
        return _firstIndex;
    }

    public function getFirstContour():Int {
        return _firstContour;
    }

    public function getArgument1():Int {
        return _argument1;
    }

    public function getArgument2():Int {
        return _argument2;
    }

    public function getFlags():Int {
        return _flags;
    }

    public function getGlyphIndex():Int {
        return _glyphIndex;
    }

    public function getScale01():Float {
        return _scale01;
    }

    public function getScale10():Float {
        return _scale10;
    }

    public function getXScale():Float {
        return _xscale;
    }

    public function getYScale():Float {
        return _yscale;
    }

    public function getXTranslate():Int {
        return _xtranslate;
    }

    public function getYTranslate():Int {
        return _ytranslate;
    }

/**
	     * Transforms an x-coordinate of a point for this component.
	     * @param x The x-coordinate of the point to transform
	     * @param y The y-coordinate of the point to transform
	     * @return The transformed x-coordinate
	     */

    public function scaleX(x:Int, y:Int):Int {
        return Std.int(x * _xscale + y * _scale10);
    }

/**
	     * Transforms a y-coordinate of a point for this component.
	     * @param x The x-coordinate of the point to transform
	     * @param y The y-coordinate of the point to transform
	     * @return The transformed y-coordinate
	     */

    public function scaleY(x:Int, y:Int):Int {
        return Std.int(x * _scale01 + y * _yscale);
    }
}
