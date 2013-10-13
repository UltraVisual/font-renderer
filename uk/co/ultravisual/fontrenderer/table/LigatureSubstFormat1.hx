package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class LigatureSubstFormat1 extends LigatureSubst{
    private var _coverageOffset:UInt;
    private var _ligSetCount:UInt;
    private var _ligatureSetOffsets:CappedArray<Int>;
    private var _coverage:Coverage;
    private var _ligatureSets:CappedArray<LigatureSet>;

    public function new(dis:GlyphByteArray, offset:UInt):Void {
        super();
        var i:UInt;
        _coverageOffset = dis.readUnsignedShort();
        _ligSetCount = dis.readUnsignedShort();
        _ligatureSetOffsets = new CappedArray<Int>( _ligSetCount) ;
        _ligatureSets = new CappedArray<LigatureSet>( _ligSetCount );

        for (i in 0..._ligSetCount) {
            _ligatureSetOffsets.add( dis.readUnsignedShort());
        }

        dis.setPosition(offset + _coverageOffset);
        _coverage = Coverage.read(dis);

        for (i in 0..._ligSetCount) {
            _ligatureSets.add(new LigatureSet(dis, offset + _ligatureSetOffsets.get(i)));
        }
    }

    public function getFormat():Int {
        return 1;
    }

    override public function getTypeAsString():String {
        return "LigatureSubstFormat1";
    }
}
