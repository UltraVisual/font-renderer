package uk.co.ultravisual.fontrenderer.utils;

import uk.co.ultravisual.fontrenderer.table.ID;
import uk.co.ultravisual.fontrenderer.table.NameTable;
import flash.events.Event;
import flash.net.URLStream;
import flash.net.URLRequest;
import flash.events.EventDispatcher;

class GlyphFontRequest extends EventDispatcher {

    public var requestUrl:String;

    private var byteArray:GlyphByteArray;
    private var urlStream:URLStream;
    private var tFont:TFont;

    public function new():Void {
        super();
        urlStream = new URLStream();
    }

    public function load(url:String):Void {
        requestUrl = url;
        urlStream.addEventListener(Event.COMPLETE, onLoadComplete);
        urlStream.load(new URLRequest(url));
    }

    public function onLoadComplete(e:Event):Void {
        byteArray = new GlyphByteArray();
        urlStream.readBytes(byteArray.getBytes(), 0, urlStream.bytesAvailable);
        var bytes:GlyphByteArray = this.getLoadedBytes();
        var fontCollection = TFontCollection.create(bytes, this.requestUrl);
        this.close();
        tFont = fontCollection.getFont(0);
        this.dispatchEvent(new Event(Event.COMPLETE));
    }

    public function getLoadedBytes():GlyphByteArray {
        return byteArray;
    }

    public function close():Void {
        urlStream.close();
    }

    public function getFontInfo():FontInfo{
        return new FontInfo(requestUrl, tFont.getNameTable().getRecordString(ID.nameFullFontName));
    }

    public function getFont():TFont{
        return tFont;
    }
}
