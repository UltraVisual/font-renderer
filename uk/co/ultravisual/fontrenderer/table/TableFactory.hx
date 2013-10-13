package uk.co.ultravisual.fontrenderer.table;

import uk.co.ultravisual.fontrenderer.table.base.BaseTable;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;

class TableFactory {

    public static function create(fc:TFontCollection, font:TFont, de:DirectoryEntry, dis:GlyphByteArray):Table {
        var t:Table = null;
        if (fc != null) {
            t = fc.getTable(de);
            if (t != null) {
                return t;
            }
        }

        switch (de.tag)
        {
            case TableType.BASE:
                t = new BaseTable(de, dis);
            case TableType.CFF:
            case TableType.DSIG:
                t = new DsigTable(de, dis);
            case TableType.EBDT:
            case TableType.EBLC:
            case TableType.EBSC:
            case TableType.GDEF:
            case TableType.GPOS:
            case TableType.GSUB:
                t = new GsubTable(de, dis);
            case TableType.JSTF:
            case TableType.LTSH:
                t = new LtshTable(de, dis);
            case TableType.MMFX:
            case TableType.MMSD:
            case TableType.OS_2:
                t = new Os2Table(de, dis);
            case TableType.PCLT:
                t = new PcltTable(de, dis);
            case TableType.VDMX:
                t = new VdmxTable(de, dis);
            case TableType.cmap:
                t = new CmapTable(de, dis);
            case TableType.cvt:
                t = new CvtTable(de, dis);
            case TableType.fpgm:
                t = new FpgmTable(de, dis);
            case TableType.fvar:
            case TableType.gasp:
                t = new GaspTable(de, dis);
            case TableType.glyf:
                t = new GlyfTable(de, dis, font.getMaxpTable(), font.getLocaTable());
            case TableType.hdmx:
                t = new HdmxTable(de, dis, font.getMaxpTable());
            case TableType.head:
                t = new HeadTable(de, dis);
            case TableType.hhea:
                t = new HheaTable(de, dis);
            case TableType.hmtx:
                t = new HmtxTable(de, dis, font.getHheaTable(), font.getMaxpTable());
            case TableType.kern:
                t = new KernTable(de, dis);
            case TableType.loca:
                t = new LocaTable(de, dis, font.getHeadTable(), font.getMaxpTable());
            case TableType.maxp:
                t = new MaxpTable(de, dis);
            case TableType.name:
                t = new NameTable(de, dis);
            case TableType.prep:
                t = new PrepTable(de, dis);
            case TableType.post:
                t = new PostTable(de, dis);
            case TableType.vhea:
                t = new VheaTable(de, dis);
            case TableType.vmtx:
                t = new VmtxTable(de, dis, font.getVheaTable(), font.getMaxpTable());
        }

        if ((fc != null) && (t != null)) {
            fc.addTable(t);
        }
        return t;
    }
}
