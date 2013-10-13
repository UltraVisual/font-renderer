package uk.co.ultravisual.fontrenderer.errors;
import flash.errors.Error;
class NonImplementationError extends Error{
    public function new(?message:String = "", id:Int = 0) {
        super(message, id);
    }
}
