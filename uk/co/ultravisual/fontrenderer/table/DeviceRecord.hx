package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class DeviceRecord {

    private var _pixelSize:Int;
    private var _maxWidth:Int;
    private var _widths:CappedArray<Int>; // short[]

    public function new(numGlyphs:Int, di:GlyphByteArray):Void {
        _pixelSize = di.readByte();
        _maxWidth = di.readByte();
        _widths = new CappedArray<Int>( numGlyphs );

        for (i in 0...numGlyphs) {
            _widths.add(di.readByte());
        }
    }

    public function getPixelSize():Int {
        return _pixelSize;
    }

    public function getMaxWidth():Int {
        return _maxWidth;
    }

    public function getWidths():CappedArray<Int> {
        return _widths;
    }
}
