package uk.co.ultravisual.fontrenderer.errors;

import flash.errors.Error;

class ArrayIndexOutOfBoundError extends Error{
    public function new(message:String = "", id:Int = 0):Void {
        super(message, id);
    }
}
