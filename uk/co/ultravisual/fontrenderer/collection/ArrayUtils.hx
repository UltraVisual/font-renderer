package uk.co.ultravisual.fontrenderer.collection;

import Reflect;
class ArrayUtils<T> {

    @final public static var ASCENDING:String = 'ArrayUtils.ASCENDING';
    @final public static var DESCENDING:String = 'ArrayUtils.DESCENDING';
    @final public static var NUMERIC:String = 'ArrayUtils.NUMERIC';

    public function new() {
    }

    public static function sortOn(collection:Dynamic, name:String, ?type:String = 'ArrayUtils.ASCENDING'):Array<Dynamic> {
        var newArray:Array<Dynamic> = new Array<Dynamic>();
        if (collection.size) {
            for (i in 0...collection.size()) {
                newArray[i] = Reflect.field(collection.get(i), name);
            }
        }
        else if (collection.length) {
            for (i in 0...collection.length) {
                newArray[i] = Reflect.field(collection[i], name);

            }
        }
        var sortedArray = sortByProperty(newArray, name, type);

        return remapArray(collection, sortedArray, name);
    }

    private static function remapArray(collection:Dynamic, sortedArray:Array<Dynamic>, name:String):Array<Dynamic> {
        var returnArray:Array<Dynamic> = new Array<Dynamic>();
        for (i in 0...sortedArray.length) {
            var sortedElement = sortedArray[i];
            if (collection.size) {
                for (j in 0...collection.size()) {
                    var unsortedElement = collection.get(j);
                    if (unsortedElement != null && sortedElement == Reflect.field(unsortedElement, name)) {
                        returnArray.push(unsortedElement);
                        collection.remove(j);
                        break;
                    }
                }
            }
            else {
                var length = collection.length;
                for (j in 0...length) {
                    var unsortedElement = collection[j];
                    if (sortedElement == Reflect.field(unsortedElement, name)) {
                        returnArray.push(unsortedElement);
                        collection.splice(j, 1);
                        break;
                    }
                }
            }
        }
        return returnArray;
    }

    private static function sortByProperty(startArray:Array<Dynamic>, prop:Dynamic, order:String):Array<Dynamic> {
        var field = startArray[0];
        if(!Math.isNaN(Std.parseFloat(field)) && order == ArrayUtils.NUMERIC){
            startArray.sort(sortArrayOfNumeralsAscending);
        }
        else if (Std.is(field, String)) {
            order == ASCENDING ? startArray.sort(sortArrayOfStringsAscending) : startArray.sort(sortArrayOfStringsDescending);
        }
        return startArray;
    }

    private static function sortArrayOfNumeralsAscending(a:Dynamic, b:Dynamic):Int {
        if (a < b) return -1;
        if (a > b) return 1;
        return 0;
    }

    private static function sortArrayOfStringsAscending(a:String, b:String):Int {
        a = a.toLowerCase();
        b = b.toLowerCase();
        if (a < b) return -1;
        if (a > b) return 1;
        return 0;
    }

    private static function sortArrayOfStringsDescending(a:String, b:String):Int {
        a = a.toLowerCase();
        b = b.toLowerCase();
        if (a < b) return 1;
        if (a > b) return -1;
        return 0;
    }
}
