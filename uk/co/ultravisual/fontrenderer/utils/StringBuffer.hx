package uk.co.ultravisual.fontrenderer.utils;

class StringBuffer {

    private var _buffer:String;

    public function new(buf:String = ""):Void {
        _buffer = buf;
    }

    public function append(obj:Dynamic):StringBuffer {
        _buffer += Std.string(obj);
        return this;
    }

    public function toString():String {
        return _buffer;
    }
}
