package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class SignatureBlock {
    private var reserved1:Int;
    private var reserved2:Int;
    private var signatureLen:Int;
    private var signature:GlyphByteArray;

    public function new(di:GlyphByteArray):Void {
        reserved1 = di.readUnsignedShort();
        reserved2 = di.readUnsignedShort();
        signatureLen = di.readInt();
        signature = new GlyphByteArray();
        di.readBytes(signature, 0, signatureLen);
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        var i:Int = 0;
        while (i < signatureLen) {
            if (signatureLen - i >= 16) {
                signature.setPosition(i);
                sb.append(signature.readUTFBytes(16)).append("\n");
            } else {
                signature.setPosition(i);
                sb.append(signature.readUTFBytes(signatureLen - i)).append("\n");
            }
            i += 16;
        }
        return sb.toString();
    }
}
