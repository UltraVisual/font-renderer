package uk.co.ultravisual.fontrenderer.utils;

class GlyphInfo {

    private var key:String;
    private var value:String;

    public function new(key:String, value:String):Void {
        this.key = key;
        this.value = value;
    }

    public function getKey():String {
        return key;
    }

    public function getValue():String {
        return value;
    }
}