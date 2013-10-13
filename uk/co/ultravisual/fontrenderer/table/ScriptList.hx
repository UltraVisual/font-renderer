package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class ScriptList {
    private var _scriptCount:UInt = 0;
    private var _scriptRecords:CappedArray<ScriptRecord>;
    private var _scripts:CappedArray<Script>;

    public function new(dis:GlyphByteArray, offset:Int):Void {
        dis.setPosition(0);
        dis.setPosition(offset);

        _scriptCount = dis.readUnsignedShort();
        _scriptRecords = new CappedArray<ScriptRecord>(_scriptCount);
        _scripts = new CappedArray<Script>(_scriptCount);

        var i:UInt;
        for (i in 0..._scriptCount) {
            _scriptRecords.add(new ScriptRecord(dis));
        }
        for (i in 0..._scriptCount) {
            _scripts.add(new Script( dis, offset + _scriptRecords.get(i).offset ));
        }
    }

    public function getScriptCount():UInt {
        return _scriptCount;
    }

    public function getScriptRecord(i:UInt):ScriptRecord {
        return _scriptRecords.get(i);
    }

    public function getScript(i:UInt):Script {
        return _scripts.get(i);
    }

    public function findScript(tag:String):String {
        if (tag.length != 4) {
            return null;
        }

        var tagVal:Int = ((tag.charCodeAt(0) << 24) | (tag.charCodeAt(1) << 16) | (tag.charCodeAt(2) << 8) | tag.charCodeAt(3));

        for (i in 0..._scriptCount) {
            if (_scriptRecords.get(i).getTag() == tagVal) {
                return Std.string(_scripts.get(i));
            }
        }
        return null;
    }
}
