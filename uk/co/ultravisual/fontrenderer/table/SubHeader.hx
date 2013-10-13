package uk.co.ultravisual.fontrenderer.table;

class SubHeader
{
    public var firstCode:Int;
    public var entryCount:Int;
    public var idDelta:Int;
    public var idRangeOffset:Int;
    public var arrayIndex:Int;

    public function new():Void {

    }

    public function toString():String {
        return "Subheader : {\n arrayIndex: " + arrayIndex + ",\n firstCode: " + firstCode + ",\n entryCount: " + entryCount + ",\n idRangeOffset: " + idRangeOffset + ",\n idDelta: " + idDelta + "\n}";
    }
}
