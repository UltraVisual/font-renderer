package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.errors.ArrayIndexOutOfBoundError;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class CmapFormat4 extends CmapFormat {

    private var _segCountX2:UInt;
    private var _searchRange:UInt;
    private var _entrySelector:UInt;
    private var _rangeShift:UInt;
    private var _endCode:CappedArray<Int>;
    private var _startCode:CappedArray<Int>;
    private var _idDelta:CappedArray<Int>;
    private var _idRangeOffset:CappedArray<Int>;
    private var _glyphIdArray:CappedArray<Int>;
    private var _segCount:Int;

    public function new(di:GlyphByteArray):Void {
        super(di);
        format = 4;
        _segCountX2 = di.readUnsignedShort();
        _segCount = Std.parseInt((_segCountX2 / 2) + "");
        _endCode = new CappedArray<Int>( _segCount );
        _startCode = new CappedArray<Int>( _segCount );
        _idDelta = new CappedArray<Int>( _segCount );
        _idRangeOffset = new CappedArray<Int>( _segCount );
        _searchRange = di.readUnsignedShort();
        _entrySelector = di.readUnsignedShort();
        _rangeShift = di.readUnsignedShort();

        var i:UInt;
        for (i in 0..._segCount) {
            _endCode.addAt(i, di.readUnsignedShort());
        }
        di.readUnsignedShort();

        for (i in 0..._segCount) {
            _startCode.addAt(i, di.readUnsignedShort());
        }

        for (i in 0..._segCount) {
            _idDelta.addAt(i, di.readUnsignedShort());
        }

        for (i in 0..._segCount) {
            _idRangeOffset.addAt(i, di.readUnsignedShort());
        }

        var count:Int = Std.parseInt(((length - (8 * _segCount + 16)) / 2) + "");
        _glyphIdArray = new CappedArray<Int>( count );

        for (i in 0... count) {
            _glyphIdArray.add(di.readUnsignedShort());
        }
    }

    override private function getRangeCount():Int {
        return _segCount;
    }

    override public function getRange(index:Int):Range {
        if (index < 0 || index >= _segCount) {
            throw new ArrayIndexOutOfBoundError();
        }
        return new Range( _startCode.get(index), _endCode.get(index) );
    }

    override public function mapCharCode(charCode:Int):Int {
        try {
            for (i in 0..._segCount) {
                if (_endCode.get(i) >= charCode) {
                    if (_startCode.get(i) <= charCode) {
                        if (_idRangeOffset.get(i) > 0) {
                            var index = _idRangeOffset.get(i) / 2 + (charCode - _startCode.get(i));
                            var subtractor = (_segCount - i);
                            return _glyphIdArray.get(Std.parseInt((index - subtractor) + ""));
                        } else {
                            return (_idDelta.get(i) + charCode) % 65536;
                        }
                    } else {
                        break;
                    }
                }
            }
        } catch (e:ArrayIndexOutOfBoundError) {
            trace("ArrayIndexOutOfBoundError: Array out of bounds - " + e.message);
        }
        return 0;
    }

    override public function toString():String {
        var sb = new StringBuffer();
        sb.append(super.toString());
        sb.append(", segCountX2: ");
        sb.append(_segCountX2);
        sb.append(", searchRange: ");
        sb.append(_searchRange);
        sb.append(", entrySelector: ");
        sb.append(_entrySelector);
        sb.append(", rangeShift: ");
        sb.append(_rangeShift);
        sb.append(", endCode: ");
        sb.append(_endCode);
        sb.append(", startCode: ");
        sb.append(_endCode);
        sb.append(", idDelta: ");
        sb.append(_idDelta);
        sb.append(", idRangeOffset: ");
        sb.append(_idRangeOffset);
        return sb.toString();
    }
}
