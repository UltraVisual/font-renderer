package uk.co.ultravisual.fontrenderer.table;
interface IGlyphDescription {
    function getGlyphIndex():Int;
    function getEndPtOfContours(i:Int):Int;
    function getFlags(i:Int):Int;
    function getXCoordinate(i:Int):Int;
    function getYCoordinate(i:Int):Int;
    function getXMaximum():Int;
    function getXMinimum():Int;
    function getYMaximum():Int;
    function getYMinimum():Int;
    function isComposite():Bool;
    function getPointCount():Int;
    function getContourCount():Int;
    function toString():String;
}
