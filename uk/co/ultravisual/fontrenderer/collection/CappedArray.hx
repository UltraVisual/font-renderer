package uk.co.ultravisual.fontrenderer.collection;

class CappedArray<T> {

    private var upperLimit:Int;

    private var collection:Array<T>;

    public function new(?upperLimit:Dynamic = 0):Void {
        this.upperLimit = upperLimit;
        collection = new Array<T>();
    }

    public static function fromArray(array:Array<Dynamic>):CappedArray<Dynamic> {
        var returnArray:CappedArray<Dynamic> = new CappedArray<Dynamic>(array.length);
        for (i in 0...array.length) {
            returnArray.add(array[i]);
        }
        return returnArray;
    }

    public function sortOn(property:String, order:String):CappedArray<T> {
        var sortOn = ArrayUtils.sortOn(collection, property, order);
        collection = cast sortOn;
        return cast fromArray(sortOn);
    }


    public function get(index:Int):T {
        return collection[index];
    }

    public function addAt(index:Int, item:T):Void {
        if (index < upperLimit) {
            collection[index] = item;
        }
    }

    public function add(prop:T):Void {
        if (collection.length < upperLimit) {
            collection.push(prop);
        }
    }

    public function remove(index:Int):Void {
        collection[index] = null;
    }

    public function size():Int {
        return collection.length;
    }

    public function clone():CappedArray<T> {
        var slice = collection.slice(0, collection.length);
        return cast fromArray(slice);
    }

    public function toArray():Array<T> {
        return collection.concat([]);
    }

    public function toString():String {
        return collection.join(", ");
    }
}
