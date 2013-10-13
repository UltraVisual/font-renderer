package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class LigatureSet {

    private var _ligatureCount:UInt;
    private var _ligatureOffsets:CappedArray<Int>;
    private var _ligatures:CappedArray<Ligature>;

    public function new(dis:GlyphByteArray, offset:UInt):Void {
        var i:UInt;
        dis.setPosition(offset);

        _ligatureCount = dis.readUnsignedShort();
        _ligatureOffsets = new CappedArray<Int>( _ligatureCount );
        _ligatures = new CappedArray<Ligature>( _ligatureCount );

        for (i in 0..._ligatureCount) {
            _ligatureOffsets.add(dis.readUnsignedShort());
        }

        for (i in 0..._ligatureCount) {
            dis.setPosition(offset + _ligatureOffsets.get(i));
            _ligatures.add(new Ligature(dis));
        }
    }
}
