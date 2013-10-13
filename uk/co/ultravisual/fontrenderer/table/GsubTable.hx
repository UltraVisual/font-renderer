package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.table.FeatureList;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class GsubTable extends Table implements ILookupSubtableFactory{
    public var scriptList:ScriptList;
    public var featureList:FeatureList;
    public var lookupList:LookupList;

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.GSUB);

        var dis:GlyphByteArray = new GlyphByteArray();
        di.readBytes(dis, 0, _de.length);

        var version:Int = dis.readInt();
        var scriptListOffset:UInt = dis.readUnsignedShort();
        var featureListOffset:UInt = dis.readUnsignedShort();
        var lookupListOffset:UInt = dis.readUnsignedShort();

        scriptList = new ScriptList(dis, scriptListOffset);

        featureList = new FeatureList(dis, featureListOffset);

        lookupList = new LookupList(dis, lookupListOffset, this);
    }

/**
		 * 1 - Single - Replace one glyph with one glyph
		 * 2 - Multiple - Replace one glyph with more than one glyph
		 * 3 - Alternate - Replace one glyph with one of many glyphs
		 * 4 - Ligature - Replace multiple glyphs with one glyph
		 * 5 - Context - Replace one or more glyphs in context
		 * 6 - Chaining - Context Replace one or more glyphs in chained context
		 */

    public function read(type:Int, dis:GlyphByteArray, offset:Int):ILookupSubtable {
        var s:ILookupSubtable = null;

        switch (type)
        {
            case 1:
                s = SingleSubst.read(dis, offset);
            case 2:
            case 3:
                s = null;
            case 4:
                s = LigatureSubst.read(dis, offset);
            case 5:
            case 6:
        }
        return s;
    }

    public function toString():String {
        return "GSUB";
    }

    public static function lookupTypeAsString(type:Int):String {
        switch (type)
        {
            case 1:
                return "Single";
            case 2:
                return "Multiple";
            case 3:
                return "Alternate";
            case 4:
                return "Ligature";
            case 5:
                return "Context";
            case 6:
                return "Chaining";
        }
        return "Unknown";
    }
}
