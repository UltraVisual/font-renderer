package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.collection.CappedArray;

import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class PcltTable extends Table {
    private var version:Int;
    private var fontNumber:Int;
    private var pitch:UInt;
    private var xHeight:UInt;
    private var style:UInt;
    private var typeFamily:UInt;
    private var capHeight:UInt;
    private var symbolSet:UInt;
    private static var typeface:CappedArray<UInt> = new CappedArray<UInt>(16); // char[]
    private static var characterComplement:CappedArray<Int> = new CappedArray<Int>(8); // short[]
    private static var fileName:CappedArray<UInt> = new CappedArray<UInt>(6); // char[]
    private var strokeWeight:UInt;
    private var widthType:UInt;
    private var serifStyle:Int;
    private var reserved:Int;

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
       super(de, TableType.PCLT);

        var i:UInt;

        version = di.readInt();
        fontNumber = di.readInt();
        pitch = di.readUnsignedShort();
        xHeight = di.readUnsignedShort();
        style = di.readUnsignedShort();
        typeFamily = di.readUnsignedShort();
        capHeight = di.readUnsignedShort();
        symbolSet = di.readUnsignedShort();

        for (i in 0...16) {
            typeface.add(di.readUnsignedByte());
        }

        for (i in 0...8) {
            characterComplement.add(di.readUnsignedByte());
        }

        for (i in 0...6) {
            fileName.add(di.readUnsignedByte());
        }

        strokeWeight = di.readUnsignedByte();
        widthType = di.readUnsignedByte();
        serifStyle = di.readByte();
        reserved = di.readByte();
    }


    public function toString():String {
        var sb = new StringBuffer();
        sb.append("'PCLT' Table - Printer Command Language Table\n---------------------------------------------");
        sb.append("\n        version:             0x").append((version));
        sb.append("\n        fontNumber:          ").append(fontNumber).append(" (0x").append((fontNumber));
        sb.append(")\n        pitch:               ").append(pitch);
        sb.append("\n        xHeight:             ").append(xHeight);
        sb.append("\n        style:               0x").append(style);
        sb.append("\n        typeFamily:          0x").append(typeFamily >> 12);
        sb.append(" ").append(typeFamily & 0xfff);
        sb.append("\n        capHeight:           ").append(capHeight);
        sb.append("\n        symbolSet:           ").append(symbolSet);
        sb.append("\n        typeFace:            ").append(typeface.toString());
        sb.append("\n        characterComplement  0x");
        sb.append((characterComplement.get(0)));
        sb.append("\n        fileName:            ").append(fileName.toString());
        sb.append("\n        strokeWeight:        ").append(strokeWeight);
        sb.append("\n        widthType:           ").append(widthType);
        sb.append("\n        serifStyle:          ").append(serifStyle);
        sb.append("\n        reserved:            ").append(reserved);
        return sb.toString();
    }
}
