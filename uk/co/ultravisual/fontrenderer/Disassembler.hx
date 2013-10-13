package uk.co.ultravisual.fontrenderer;

import uk.co.ultravisual.fontrenderer.utils.StringBuffer;
class Disassembler {

    public static function advanceIP(instructions:Array<Int>, ip:Int):Int {
        var i:Int = ip & 0xffff;
        var dataCount:Int;
        ip++;

        if (Mnemonic.NPUSHB == instructions[i]) {
            dataCount = instructions[++i];
            ip += dataCount + 1;
        } else if (Mnemonic.NPUSHW == instructions[i]) {
            dataCount = instructions[++i];
            ip += dataCount * 2 + 1;
        } else if (Mnemonic.PUSHB == (instructions[i] & 0xf8)) {
            dataCount = ((instructions[i] & 0x07) + 1);
            ip += dataCount;
        } else if (Mnemonic.PUSHW == (instructions[i] & 0xf8)) {
            dataCount = ((instructions[i] & 0x07) + 1);
            ip += dataCount * 2;
        }
        return ip;
    }

    public static function getPushCount(instructions:Array<Int>, ip:Int):Int {
        var instr:Int = instructions[ip & 0xffff];

        if ((Mnemonic.NPUSHB == instr) || (Mnemonic.NPUSHW == instr)) {
            return instructions[(ip & 0xffff) + 1];
        } else if ((Mnemonic.PUSHB == (instr & 0xf8)) || (Mnemonic.PUSHW == (instr & 0xf8))) {
            return ((instr & 0x07) + 1);
        }
        return 0;
    }


    public static function getPushData(instructions:Array<Int>, ip:Int):Array<Int> {
        var count:Int = getPushCount(instructions, ip);
        var data:Array<Int> = new Array<Int>(); // Int[]
        var i:Int = ip & 0xffff;
        var instr:Int = instructions[i];
        var j:Int;

        if (Mnemonic.NPUSHB == instr) {
            for (j in 0...count) {
                data[j] = instructions[i + j + 2];
            }
        } else if (Mnemonic.PUSHB == (instr & 0xf8)) {
            for (j in 0...count) {
                data[j] = instructions[i + j + 1];
            }
        } else if (Mnemonic.NPUSHW == instr) {
            for (j in 0...count) {
                data[j] = (instructions[i + j * 2 + 2] << 8) | instructions[i + j * 2 + 3];
            }
        } else if (Mnemonic.PUSHW == (instr & 0xf8)) {
            for (j in 0...count) {
                data[j] = (instructions[i + j * 2 + 1] << 8) | instructions[i + j * 2 + 2];
            }
        }
        return data;
    }


    public static function disassemble(instructions:Array<Int>, leadingSpaces:Int):String {
        var sb:StringBuffer = new StringBuffer();
        var ip:Int = 0;
        var i:Int;

        while (ip < instructions.length) {
            for (i in 0...leadingSpaces) {
                sb.append(" ");
            }

            sb.append(ip).append(": ");
            sb.append(Mnemonic.getMnemonic(instructions[ip]));

            if (getPushCount(instructions, ip) > 0) {
                var data:Array<Int> = getPushData(instructions, ip); // Int[]
                for (j in 0...data.length) {
                    if ((instructions[ip] == Mnemonic.PUSHW) || (instructions[ip] == Mnemonic.NPUSHW)) {
                        sb.append(" ").append(data[j]);
                    } else {
                        sb.append(" ").append(data[j]);
                    }
                }
            }
            sb.append("\n");
            ip = advanceIP(instructions, ip);
        }
        return sb.toString();
    }
}
