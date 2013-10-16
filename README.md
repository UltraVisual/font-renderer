Font Renderer for Haxe
=============

Install as haxe lib via
```
haxelib git font-renderer https://github.com/UltraVisual/font-renderer
```

Haxe font rendering library

Example usage:
```javascript
	private var renderedFonts:FontRenderer;
    private var sprites:Array<Sprite>;

    public function new():Void {
        super();

        renderedFonts = new FontRenderer(this).setStroke(new Stroke())
                                              .setFill(new Fill(0, 1))
                                              .setText("Sample")
                                              .setFontSize(25)
                                              .setCompleteCallback( 
                                              	function() {
                                                    sprites = renderedFonts.getSprites();
                                                            }
                                              )
                                              .renderFont("assets/fonts/umberto.ttf");
```
