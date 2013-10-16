package;

import uk.co.ultravisual.fontrenderer.utils.FontNames;
import uk.co.ultravisual.fontrenderer.utils.GlyphInfo;
import flash.utils.JSON;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLStream;
import flash.net.FileReference;
import uk.co.ultravisual.fontrenderer.utils.GlyphFontRequest;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
import uk.co.ultravisual.fontrenderer.table.PostTable;
import flash.geom.Rectangle;
import flash.display.Graphics;
import uk.co.ultravisual.fontrenderer.table.TableType;
import uk.co.ultravisual.fontrenderer.path.PathBuilder;
import uk.co.ultravisual.fontrenderer.table.Table;
import uk.co.ultravisual.fontrenderer.table.GlyfTable;
import uk.co.ultravisual.fontrenderer.table.GlyfDescript;
import uk.co.ultravisual.fontrenderer.render.GlyphPathFactory;
import uk.co.ultravisual.fontrenderer.geom.Glyph;
import uk.co.ultravisual.fontrenderer.TFontCollection;
import uk.co.ultravisual.fontrenderer.TFont;
import uk.co.ultravisual.fontrenderer.graphics.Stroke;
import uk.co.ultravisual.fontrenderer.graphics.Graphics2D;
import uk.co.ultravisual.fontrenderer.graphics.Fill;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Matrix;

class FontRenderer {

    private var fileRequest:GlyphFontRequest;
    private var fontCollections:Array<TFontCollection>;
    private var fontCollection:TFontCollection;
    private static var _drawBounds:Bool = false;
    private var currentIndex:UInt;
    private static var spacing:UInt = 0;
    private var charList:Array<String>;
    private var parent:Sprite;
    private var textToRender:String;
    private var texts:Array<Sprite>;
    private var complete:Dynamic;
    private static var size:Int = 16;
    private static var stroke:Stroke = new Stroke();
    private static var fill:Fill = new Fill();
    private static var glyphs:Array<GlyphInfo> = FontNames.getAsArray();

    public function new(parentSprite:Sprite):Void {
        charList = new Array<String>();
        parent = parentSprite;
    }

    public function renderFont(fontUrlString:String):FontRenderer {
        init(fontUrlString);
        return this;
    }

    public function setDrawBounds(val:Bool):FontRenderer {
        _drawBounds = val;
        return this;
    }

    public function setCompleteCallback(completeCallback:Dynamic):FontRenderer {
        complete = completeCallback;
        return this;
    }

    public function setText(text:String):FontRenderer {
        textToRender = text;
        return this;
    }

    public function setFontSize(_size:Int):FontRenderer {
        size = _size;
        return this;
    }

    public function setStroke(_stroke:Stroke):FontRenderer {
        stroke = _stroke;
        return this;
    }

    public function setFill(_fill:Fill):FontRenderer {
        fill = _fill;
        return this;
    }

    public function getSprites():Array<Sprite> {
        return texts;
    }

    private function init(url:String):Void {
        fontCollections = new Array<TFontCollection>();
        fileRequest = new GlyphFontRequest();
        fileRequest.addEventListener(Event.COMPLETE, onFontLoaded);
        fileRequest.load(url);
    }

    private function getCharacterIndex(char:String):UInt {
        for (i in 0...charList.length) {
            if (char == charList[i]) {
                return i;
            }
        }
        return 0;
    }


    private function onFontLoaded(event:Event):Void {
        var font:TFont = fileRequest.getFont();
        var table:GlyfTable = cast font.getTable(TableType.glyf);
        var postTable:PostTable = cast font.getTable(TableType.post);
        var numGlyphs = font.getNumGlyphs();
        for (i in 0...numGlyphs) {
            var glyphName = postTable.getGlyphName(i);
            charList.push(FontNames.getValueFromName(glyphName));

        }
        drawText(textToRender, font, table);
    }

    private function drawText(text:String, font:TFont, table:GlyfTable):Void {
        texts = new Array<Sprite>();

        for (i in 0...text.length) {
            var glyph:GlyfDescript = table.getDescription(getCharacterIndex(text.charAt(i)));
            var sprite:Sprite = buildPath(font, glyph);
            texts.push(sprite);
        }

        for (j in 1...texts.length) {
            var sprite:Sprite = texts[j];
            var previousSprite:Sprite = texts[j - 1];
            sprite.x = previousSprite.x + previousSprite.width + spacing;
        }

        if (complete != null) {
            complete(getSprites());
        }
    }

    private function buildPath(font:TFont, descript:GlyfDescript):Sprite {
        var glyph:Glyph = null;
        var path:PathBuilder = null;

        var glyphCanvas:Sprite = new Sprite();

        glyph = new Glyph(descript,
        font.getHmtxTable().getLeftSideBearing(descript.getGlyphIndex()),
        font.getHmtxTable().getAdvanceWidth(descript.getGlyphIndex()));

        path = GlyphPathFactory.buildPath(glyph);

        if (path != null) {

            glyphCanvas.graphics.clear();

            var g:Graphics2D = new Graphics2D(glyphCanvas.graphics, stroke, fill, path);
            g.render();

            if (_drawBounds) {
                drawBounds(glyphCanvas);
            }

            var matrix:Matrix = glyphCanvas.transform.matrix.clone();
            var translate = 600;
            matrix.translate(translate, 1000 + translate);
            var scale = 0.006 * size;
            matrix.scale(scale, scale);
            glyphCanvas.transform.matrix = matrix;


            parent.addChild(glyphCanvas);
        }

        return glyphCanvas;
    }

    private function drawBounds(canvas:Sprite):Sprite {
        var rect:Rectangle = canvas.getBounds(canvas);
        var graphics:Graphics = canvas.graphics;
        graphics.lineStyle(1, 0x0000ff);
        graphics.beginFill(0, 0);
        graphics.drawRect(rect.x, rect.y, canvas.width, canvas.height);
        graphics.endFill();

        return canvas;
    }

}