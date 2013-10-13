package uk.co.ultravisual.fontrenderer.utils;

import flash.utils.ByteArray;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class GlyphByteArray {

    private var byteArray:ByteArray;

    public function new():Void {
        byteArray = new ByteArray();
    }

    public function setPosition(value:Int):Void{
        byteArray.position = value;
    }

    public function getPosition():Int {
        return byteArray.position;
    }

    public function increasePosition(amount:Int):Void {
        byteArray.position += amount;
    }

    public function readInt():Int {
        return byteArray.readInt();
    }

    public function readShort():Int {
        return byteArray.readShort();
    }

    public function readByte():Int {
        return byteArray.readByte();
    }

    public function readDouble():Float {
        return byteArray.readDouble();
    }

    public function readUnsignedByte():Int {
        return byteArray.readUnsignedByte();
    }

    public function readUTFBytes(length:UInt):String {
        return byteArray.readUTFBytes(length);
    }

    public function readUnsignedShort():UInt {
        return byteArray.readUnsignedShort();
    }

    public function readBytes(bytes:GlyphByteArray, offset:UInt = 0, length:UInt = 0):Void {
        byteArray.readBytes(bytes.getBytes(), offset, length);
        bytes.getBytes();
    }

    public function getBytes():ByteArray {
        return byteArray;
    }
}
