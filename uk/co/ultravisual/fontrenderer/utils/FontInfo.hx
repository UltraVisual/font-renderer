package uk.co.ultravisual.fontrenderer.utils;

class FontInfo {

    private var url:String;
    private var name:String;

    public function new(url:String, name:String):Void {
        this.url = url;
        this.name = name;
    }

    public function getName():String {
        return name;
    }

    public function getUrl():String {
        return url;
    }
}