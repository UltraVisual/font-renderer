package uk.co.ultravisual.fontrenderer.table;
import uk.co.ultravisual.fontrenderer.utils.Fixed;
import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
import uk.co.ultravisual.fontrenderer.utils.GlyphByteArray;
class MaxpTable extends Table{
    private var versionNumber:Int;
    private var numGlyphs:Int;
    private var maxPoints:Int;
    private var maxContours:Int;
    private var maxCompositePoints:Int;
    private var maxCompositeContours:Int;
    private var maxZones:Int;
    private var maxTwilightPoints:Int;
    private var maxStorage:Int;
    private var maxFunctionDefs:Int;
    private var maxInstructionDefs:Int;
    private var maxStackElements:Int;
    private var maxSizeOfInstructions:Int;
    private var maxComponentElements:Int;
    private var maxComponentDepth:Int;

    public function new(de:DirectoryEntry, di:GlyphByteArray):Void {
        super(de, TableType.maxp);

        versionNumber = di.readInt();

        if (versionNumber == 0x00005000) {
            numGlyphs = di.readUnsignedShort();
        } else if (versionNumber == 0x00010000) {
            numGlyphs = di.readUnsignedShort();
            maxPoints = di.readUnsignedShort();
            maxContours = di.readUnsignedShort();
            maxCompositePoints = di.readUnsignedShort();
            maxCompositeContours = di.readUnsignedShort();
            maxZones = di.readUnsignedShort();
            maxTwilightPoints = di.readUnsignedShort();
            maxStorage = di.readUnsignedShort();
            maxFunctionDefs = di.readUnsignedShort();
            maxInstructionDefs = di.readUnsignedShort();
            maxStackElements = di.readUnsignedShort();
            maxSizeOfInstructions = di.readUnsignedShort();
            maxComponentElements = di.readUnsignedShort();
            maxComponentDepth = di.readUnsignedShort();
        }
    }

    public function getVersionNumber():Int {
        return versionNumber;
    }

    public function getMaxComponentDepth():Int {
        return maxComponentDepth;
    }

    public function getMaxComponentElements():Int {
        return maxComponentElements;
    }

    public function getMaxCompositeContours():Int {
        return maxCompositeContours;
    }

    public function getMaxCompositePoints():Int {
        return maxCompositePoints;
    }

    public function getMaxContours():Int {
        return maxContours;
    }

    public function getMaxFunctionDefs():Int {
        return maxFunctionDefs;
    }

    public function getMaxInstructionDefs():Int {
        return maxInstructionDefs;
    }

    public function getMaxPoints():Int {
        return maxPoints;
    }

    public function getMaxSizeOfInstructions():Int {
        return maxSizeOfInstructions;
    }

    public function getMaxStackElements():Int {
        return maxStackElements;
    }

    public function getMaxStorage():Int {
        return maxStorage;
    }

    public function getMaxTwilightPoints():Int {
        return maxTwilightPoints;
    }

    public function getMaxZones():Int {
        return maxZones;
    }

    public function getNumGlyphs():Int {
        return numGlyphs;
    }

    public function toString():String {
        var sb:StringBuffer = new StringBuffer();
        sb.append("'maxp' Table - Maximum Profile\n------------------------------");
        sb.append("\n        'maxp' version:         ");
        sb.append(Fixed.floatValue(versionNumber));
        sb.append("\n        numGlyphs:              ");
        sb.append(numGlyphs);
        if (versionNumber == 0x00010000) {
            sb.append("\n        maxPoints:              ");
            sb.append(maxPoints);
            sb.append("\n        maxContours:            ").append(maxContours);
            sb.append("\n        maxCompositePoints:     ").append(maxCompositePoints);
            sb.append("\n        maxCompositeContours:   ").append(maxCompositeContours);
            sb.append("\n        maxZones:               ").append(maxZones);
            sb.append("\n        maxTwilightPoints:      ").append(maxTwilightPoints);
            sb.append("\n        maxStorage:             ").append(maxStorage);
            sb.append("\n        maxFunctionDefs:        ").append(maxFunctionDefs);
            sb.append("\n        maxInstructionDefs:     ").append(maxInstructionDefs);
            sb.append("\n        maxStackElements:       ").append(maxStackElements);
            sb.append("\n        maxSizeOfInstructions:  ").append(maxSizeOfInstructions);
            sb.append("\n        maxComponentElements:   ").append(maxComponentElements);
            sb.append("\n        maxComponentDepth:      ").append(maxComponentDepth);
        } else {
            sb.append("\n");
        }
        return sb.toString();
    }
}
