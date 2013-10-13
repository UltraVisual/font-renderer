package uk.co.ultravisual.fontrenderer.collection;

class ArrayCollection <T> {

    public var length:Int;

    private var collection:Array<T>;

    public function new() {
        collection = new Array<T>();
    }

    public function getItemAt(i:Int):Dynamic {
        return collection[i];
    }

    public function addItem(item:Dynamic):Void {
        collection.push(item);
        length = collection.length;
    }

    public function toArray():Array<T> {
        return collection.concat([]);
    }

    public function removeAll():Void {
        collection = [];
        collection.length;
    }
}
