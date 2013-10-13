package uk.co.ultravisual.fontrenderer.table;

class TableType{
    public static var BASE:Int = 0x42415345; // Baseline data [OpenType]
    public static var CFF:Int = 0x43464620;  // PostScript font program (compact font format) [PostScript]
    public static var DSIG:Int = 0x44534947; // Digital signature
    public static var EBDT:Int = 0x45424454; // Embedded bitmap data
    public static var EBLC:Int = 0x45424c43; // Embedded bitmap location data
    public static var EBSC:Int = 0x45425343; // Embedded bitmap scaling data
    public static var GDEF:Int = 0x47444546; // Glyph definition data [OpenType]
    public static var GPOS:Int = 0x47504f53; // Glyph positioning data [OpenType]
    public static var GSUB:Int = 0x47535542; // Glyph substitution data [OpenType]
    public static var JSTF:Int = 0x4a535446; // Justification data [OpenType]
    public static var LTSH:Int = 0x4c545348; // Linear threshold table
    public static var MMFX:Int = 0x4d4d4658; // Multiple master font metrics [PostScript]
    public static var MMSD:Int = 0x4d4d5344; // Multiple master supplementary data [PostScript]
    public static var OS_2:Int = 0x4f532f32; // OS/2 and Windows specific metrics [r]
    public static var PCLT:Int = 0x50434c54; // PCL5
    public static var VDMX:Int = 0x56444d58; // Vertical Device Metrics table
    public static var cmap:Int = 0x636d6170; // character to glyph mapping [r]
    public static var cvt:Int = 0x63767420;  // Control Value Table
    public static var fpgm:Int = 0x6670676d; // font program
    public static var fvar:Int = 0x66766172; // Apple's font variations table [PostScript]
    public static var gasp:Int = 0x67617370; // grid-fitting and scan conversion procedure (grayscale)
    public static var glyf:Int = 0x676c7966; // glyph data [r]
    public static var hdmx:Int = 0x68646d78; // horizontal device metrics
    public static var head:Int = 0x68656164; // font header [r]
    public static var hhea:Int = 0x68686561; // horizontal header [r]
    public static var hmtx:Int = 0x686d7478; // horizontal metrics [r]
    public static var kern:Int = 0x6b65726e; // kerning
    public static var loca:Int = 0x6c6f6361; // index to location [r]
    public static var maxp:Int = 0x6d617870; // maximum profile [r]
    public static var name:Int = 0x6e616d65; // naming table [r]
    public static var prep:Int = 0x70726570; // CVT Program
    public static var post:Int = 0x706f7374; // PostScript information [r]
    public static var vhea:Int = 0x76686561; // Vertical Metrics header
    public static var vmtx:Int = 0x766d7478; // Vertical Metrics
}