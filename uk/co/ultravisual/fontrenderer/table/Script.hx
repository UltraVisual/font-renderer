package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class Script {
    private var _defaultLangSysOffset:Int;
    private var _langSysCount:Int;
    private var _langSysRecords:CappedArray<LangSysRecord>;
    private var _defaultLangSys:LangSys;
    private var _langSys:CappedArray<LangSys>;

    public function new(dis:GlyphByteArray, offset:Int):Void {
        dis.setPosition(0);
        dis.setPosition(offset);

        var i:UInt;

        _defaultLangSysOffset = dis.readUnsignedShort();
        _langSysCount = dis.readUnsignedShort();
        if (_langSysCount > 0) {
            _langSysRecords = new CappedArray<LangSysRecord>(_langSysCount);
            for (i in 0..._langSysCount) {
                _langSysRecords.add(new LangSysRecord(dis));
            }
        }

        if (_langSysCount > 0) {
            _langSys = new CappedArray<LangSys>(_langSysCount);
            for (i in 0..._langSysCount) {
                dis.setPosition(0);
                dis.increasePosition( offset + _langSysRecords.get(i).offset );
                _langSys.add(new LangSys(dis));
            }
        }

        if (_defaultLangSysOffset > 0) {
            dis.setPosition(0);
            dis.increasePosition(offset + _defaultLangSysOffset);
            _defaultLangSys = new LangSys(dis);
        }
    }

    public function getLangSysCount():Int {
        return _langSysCount;
    }

    public function getLangSysRecord(i:UInt):LangSysRecord {
        return _langSysRecords.get(i);
    }

    public function getDefaultLangSys():LangSys {
        return _defaultLangSys;
    }

    public function getLangSys(i:UInt):LangSys {
        return _langSys.get(i);
    }
}
