package uk.co.ultravisual.fontrenderer.table;

class Range {

    private var _startCode:Int;
    private var _endCode:Int;

    public function new(startCode:Int, endCode:Int):Void {
        _startCode = startCode;
        _endCode = endCode;
    }

    public function getStartCode():Int {
        return _startCode;
    }

    public function getEndCode():Int {
        return _endCode;
    }
}
