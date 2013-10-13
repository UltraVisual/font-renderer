package uk.co.ultravisual.fontrenderer.utils;

import flash.events.Event;
import flash.net.URLStream;
import flash.net.URLRequest;
import flash.events.EventDispatcher;

class GlyphFileRequest extends EventDispatcher {

    public var requestUrl:String;

    private var byteArray:GlyphByteArray;
    private var urlStream:URLStream;

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
        this.dispatchEvent(new Event(Event.COMPLETE));
    }

    public function getLoadedBytes():GlyphByteArray {
        return byteArray;
    }

    public function close():Void {
        urlStream.close();
    }
}
