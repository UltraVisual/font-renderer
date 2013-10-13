package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
interface ILookupSubtableFactory {
    function read(type:Int, dis:GlyphByteArray, offset:Int):ILookupSubtable;
}
