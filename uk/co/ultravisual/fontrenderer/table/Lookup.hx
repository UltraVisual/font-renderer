package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Lookup {
    public static var IGNORE_BASE_GLYPHS:Int = 0x0002;
    public static var IGNORE_BASE_LIGATURES:Int = 0x0004;
    public static var IGNORE_BASE_MARKS:Int = 0x0008;
    public static var MARK_ATTACHMENT_TYPE:Int = 0xFF00;

    public var type:UInt;
    private var _flag:UInt;
    public var subTableCount:UInt;
    private var _subTableOffsets:CappedArray<Int>;
    private var _subTables:CappedArray<ILookupSubtable>;

    public function new(factory:ILookupSubtableFactory, dis:GlyphByteArray, offset:UInt):Void {
        var i:UInt;
        dis.setPosition(offset);
        type = dis.readUnsignedShort();
        _flag = dis.readUnsignedShort();
        subTableCount = dis.readUnsignedShort();
        _subTableOffsets = new CappedArray<Int>(subTableCount);
        _subTables = new CappedArray<ILookupSubtable>(subTableCount);

        for (i in 0...subTableCount) {
            _subTableOffsets.add(dis.readUnsignedShort());
        }

        for (i in 0...subTableCount) {
            _subTables.add(factory.read(type, dis, offset + _subTableOffsets.get(i)));
        }
    }

    public function getSubtable(i:UInt):ILookupSubtable {
        return _subTables.get(i);
    }
}
