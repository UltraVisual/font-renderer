package uk.co.ultravisual.fontrenderer.table;
class ID {
    public static var platformUnicode:Int = 0;
    public static var platformMacintosh:Int = 1;
    public static var platformISO:Int = 2;
    public static var platformMicrosoft:Int = 3;

// Unicode Encoding IDs
    public static var encodingUnicode10Semantics:Int = 0;
    public static var encodingUnicode11Semantics:Int = 1;
    public static var encodingISO10646Semantics:Int = 2;
    public static var encodingUnicode20Semantics:Int = 3;

// Microsoft Encoding IDs
// public static var encodingUndefined:Int = 0;
// public static var encodingUGL:Int = 1;
    public static var encodingSymbol:Int = 0;
    public static var encodingUnicode:Int = 1;
    public static var encodingShiftJIS:Int = 2;
    public static var encodingPRC:Int = 3;
    public static var encodingBig5:Int = 4;
    public static var encodingWansung:Int = 5;
    public static var encodingJohab:Int = 6;
    public static var encodingUCS4:Int = 10;

// Macintosh Encoding IDs
    public static var encodingRoman:Int = 0;
    public static var encodingJapanese:Int = 1;
    public static var encodingChinese:Int = 2;
    public static var encodingKorean:Int = 3;
    public static var encodingArabic:Int = 4;
    public static var encodingHebrew:Int = 5;
    public static var encodingGreek:Int = 6;
    public static var encodingRussian:Int = 7;
    public static var encodingRSymbol:Int = 8;
    public static var encodingDevanagari:Int = 9;
    public static var encodingGurmukhi:Int = 10;
    public static var encodingGujarati:Int = 11;
    public static var encodingOriya:Int = 12;
    public static var encodingBengali:Int = 13;
    public static var encodingTamil:Int = 14;
    public static var encodingTelugu:Int = 15;
    public static var encodingKannada:Int = 16;
    public static var encodingMalayalam:Int = 17;
    public static var encodingSinhalese:Int = 18;
    public static var encodingBurmese:Int = 19;
    public static var encodingKhmer:Int = 20;
    public static var encodingThai:Int = 21;
    public static var encodingLaotian:Int = 22;
    public static var encodingGeorgian:Int = 23;
    public static var encodingArmenian:Int = 24;
    public static var encodingMaldivian:Int = 25;
    public static var encodingTibetan:Int = 26;
    public static var encodingMongolian:Int = 27;
    public static var encodingGeez:Int = 28;
    public static var encodingSlavic:Int = 29;
    public static var encodingVietnamese:Int = 30;
    public static var encodingSindhi:Int = 31;
    public static var encodingUninterp:Int = 32;

// ISO Encoding IDs
    public static var encodingASCII:Int = 0;
    public static var encodingISO10646:Int = 1;
    public static var encodingISO8859_1:Int = 2;

// Microsoft Language IDs
    public static var languageSQI:Int = 0x041c;
    public static var languageEUQ:Int = 0x042d;
    public static var languageBEL:Int = 0x0423;
    public static var languageBGR:Int = 0x0402;
    public static var languageCAT:Int = 0x0403;
    public static var languageSHL:Int = 0x041a;
    public static var languageCSY:Int = 0x0405;
    public static var languageDAN:Int = 0x0406;
    public static var languageNLD:Int = 0x0413;
    public static var languageNLB:Int = 0x0813;
    public static var languageENU:Int = 0x0409;
    public static var languageENG:Int = 0x0809;
    public static var languageENA:Int = 0x0c09;
    public static var languageENC:Int = 0x1009;
    public static var languageENZ:Int = 0x1409;
    public static var languageENI:Int = 0x1809;
    public static var languageETI:Int = 0x0425;
    public static var languageFIN:Int = 0x040b;
    public static var languageFRA:Int = 0x040c;
    public static var languageFRB:Int = 0x080c;
    public static var languageFRC:Int = 0x0c0c;
    public static var languageFRS:Int = 0x100c;
    public static var languageFRL:Int = 0x140c;
    public static var languageDEU:Int = 0x0407;
    public static var languageDES:Int = 0x0807;
    public static var languageDEA:Int = 0x0c07;
    public static var languageDEL:Int = 0x1007;
    public static var languageDEC:Int = 0x1407;
    public static var languageELL:Int = 0x0408;
    public static var languageHUN:Int = 0x040e;
    public static var languageISL:Int = 0x040f;
    public static var languageITA:Int = 0x0410;
    public static var languageITS:Int = 0x0810;
    public static var languageLVI:Int = 0x0426;
    public static var languageLTH:Int = 0x0427;
    public static var languageNOR:Int = 0x0414;
    public static var languageNON:Int = 0x0814;
    public static var languagePLK:Int = 0x0415;
    public static var languagePTB:Int = 0x0416;
    public static var languagePTG:Int = 0x0816;
    public static var languageROM:Int = 0x0418;
    public static var languageRUS:Int = 0x0419;
    public static var languageSKY:Int = 0x041b;
    public static var languageSLV:Int = 0x0424;
    public static var languageESP:Int = 0x040a;
    public static var languageESM:Int = 0x080a;
    public static var languageESN:Int = 0x0c0a;
    public static var languageSVE:Int = 0x041d;
    public static var languageTRK:Int = 0x041f;
    public static var languageUKR:Int = 0x0422;

// Macintosh Language IDs
    public static var languageEnglish:Int = 0;
    public static var languageFrench:Int = 1;
    public static var languageGerman:Int = 2;
    public static var languageItalian:Int = 3;
    public static var languageDutch:Int = 4;
    public static var languageSwedish:Int = 5;
    public static var languageSpanish:Int = 6;
    public static var languageDanish:Int = 7;
    public static var languagePortuguese:Int = 8;
    public static var languageNorwegian:Int = 9;
    public static var languageHebrew:Int = 10;
    public static var languageJapanese:Int = 11;
    public static var languageArabic:Int = 12;
    public static var languageFinnish:Int = 13;
    public static var languageGreek:Int = 14;
    public static var languageIcelandic:Int = 15;
    public static var languageMaltese:Int = 16;
    public static var languageTurkish:Int = 17;
    public static var languageYugoslavian:Int = 18;
    public static var languageChinese:Int = 19;
    public static var languageUrdu:Int = 20;
    public static var languageHindi:Int = 21;
    public static var languageThai:Int = 22;
    public static var nameCopyrightNotice:Int = 0;
    public static var nameFontFamilyName:Int = 1;
    public static var nameFontSubfamilyName:Int = 2;
    public static var nameUniqueFontIdentifier:Int = 3;
    public static var nameFullFontName:Int = 4;
    public static var nameVersionString:Int = 5;
    public static var namePostscriptName:Int = 6;
    public static var nameTrademark:Int = 7;
    public static var nameManufacturerName:Int = 8;
    public static var nameDesigner:Int = 9;
    public static var nameDescription:Int = 10;
    public static var nameURLVendor:Int = 11;
    public static var nameURLDesigner:Int = 12;
    public static var nameLicenseDescription:Int = 13;
    public static var nameLicenseInfoURL:Int = 14;
    public static var namePreferredFamily:Int = 16;
    public static var namePreferredSubfamily:Int = 17;
    public static var nameCompatibleFull:Int = 18;
    public static var nameSampleText:Int = 19;
    public static var namePostScriptCIDFindfontName:Int = 20;


    public static function getPlatformName(platformId:Int):String {
        switch (platformId)
        {
            case ID.platformUnicode: return "Unicode";
            case ID.platformMacintosh: return "Macintosh";
            case ID.platformISO: return "ISO";
            case ID.platformMicrosoft: return "Microsoft";
            default: return "Custom";
        }
    }

    public static function getEncodingName(platformId:Int, encodingId:Int):String {
        if (platformId == platformUnicode) {
            switch ( encodingId )
            {
                case ID.encodingUnicode10Semantics:
                    return "Unicode 1.0 semantics";
                case ID.encodingUnicode11Semantics:
                    return "Unicode 1.1 semantics";
                case ID.encodingISO10646Semantics:
                    return "ISO 10646:1993 semantics";
                case ID.encodingUnicode20Semantics:
                    return "Unicode 2.0 and onwards semantics";
                default:
                    return "";
            }

        } else if (platformId == platformMacintosh) {
            switch (encodingId)
            {
                case ID.encodingRoman:
                    return "Roman";
                case ID.encodingJapanese:
                    return "Japanese";
                case ID.encodingChinese:
                    return "Chinese";
                case ID.encodingKorean:
                    return "Korean";
                case ID.encodingArabic:
                    return "Arabi";
                case ID.encodingHebrew:
                    return "Hebrew";
                case ID.encodingGreek:
                    return "Greek";
                case ID.encodingRussian:
                    return "Russian";
                case ID.encodingRSymbol:
                    return "RSymbol";
                case ID.encodingDevanagari:
                    return "Devanagari";
                case ID.encodingGurmukhi:
                    return "Gurmukhi";
                case ID.encodingGujarati:
                    return "Gujarati";
                case ID.encodingOriya:
                    return "Oriya";
                case ID.encodingBengali:
                    return "Bengali";
                case ID.encodingTamil:
                    return "Tamil";
                case ID.encodingTelugu:
                    return "Telugu";
                case ID.encodingKannada:
                    return "Kannada";
                case ID.encodingMalayalam:
                    return "Malayalam";
                case ID.encodingSinhalese:
                    return "Sinhalese";
                case ID.encodingBurmese:
                    return "Burmese";
                case ID.encodingKhmer:
                    return "Khmer";
                case ID.encodingThai:
                    return "Thai";
                case ID.encodingLaotian:
                    return "Laotian";
                case ID.encodingGeorgian:
                    return "Georgian";
                case ID.encodingArmenian:
                    return "Armenian";
                case ID.encodingMaldivian:
                    return "Maldivian";
                case ID.encodingTibetan:
                    return "Tibetan";
                case ID.encodingMongolian:
                    return "Mongolian";
                case ID.encodingGeez:
                    return "Geez";
                case ID.encodingSlavic:
                    return "Slavic";
                case ID.encodingVietnamese:
                    return "Vietnamese";
                case ID.encodingSindhi:
                    return "Sindhi";
                case ID.encodingUninterp:
                    return "Uninterpreted";
                default:
                    return "";
            }

        } else if (platformId == platformISO) {
            switch ( encodingId )
            {
                case ID.encodingASCII:
                    return "7-bit ASCII";
                case ID.encodingISO10646:
                    return "ISO 10646";
                case ID.encodingISO8859_1:
                    return "ISO 8859-1";
                default:
                    return "";
            }

        } else if (platformId == platformMicrosoft) {
            switch ( encodingId )
            {
                case ID.encodingSymbol: return "Symbol";
                case ID.encodingUnicode: return "Unicode";
                case ID.encodingShiftJIS: return "ShiftJIS";
                case ID.encodingPRC: return "PRC";
                case ID.encodingBig5: return "Big5";
                case ID.encodingWansung: return "Wansung";
                case ID.encodingJohab: return "Johab";
                case 7: return "Reserved";
                case 8: return "Reserved";
                case 9: return "Reserved";
                case ID.encodingUCS4: return "UCS-4";
                default: return "";
            }
        }
        return "";
    }

    public static function getLanguageName(platformId:Int, languageId:Int):String {
        if (platformId == platformMacintosh) {
            switch ( languageId )
            {
                case ID.languageEnglish: return "English";
                case ID.languageFrench: return "French";
                case ID.languageGerman: return "German";
                case ID.languageItalian: return "Italian";
                case ID.languageDutch: return "Dutch";
                case ID.languageSwedish: return "Swedish";
                case ID.languageSpanish: return "Spanish";
                case ID.languageDanish: return "Danish";
                case ID.languagePortuguese: return "Portuguese";
                case ID.languageNorwegian: return "Norwegian";
                case ID.languageHebrew: return "Hebrew";
                case ID.languageJapanese: return "Japanese";
                case ID.languageArabic: return "Arabic";
                case ID.languageFinnish: return "Finnish";
                case ID.languageGreek: return "Greek";
                case ID.languageIcelandic: return "Icelandic";
                case ID.languageMaltese: return "Maltese";
                case ID.languageTurkish: return "Turkish";
                case ID.languageYugoslavian: return "Yugoslavian";
                case ID.languageChinese: return "Chinese";
                case ID.languageUrdu: return "Urdu";
                case ID.languageHindi: return "Hindi";
                case ID.languageThai: return "Thai";
                default: return "";
            }
        } else if (platformId == platformMicrosoft) {
            switch ( languageId )
            {
                case ID.languageSQI: return "Albanian (Albania)";
                case ID.languageEUQ: return "Basque (Basque)";
                case ID.languageBEL: return "Byelorussian (Byelorussia)";
                case ID.languageBGR: return "Bulgarian (Bulgaria)";
                case ID.languageCAT: return "Catalan (Catalan)";
                case ID.languageSHL: return "Croatian (Croatian)";
                case ID.languageCSY: return "Czech (Czech)";
                case ID.languageDAN: return "Danish (Danish)";
                case ID.languageNLD: return "Dutch (Dutch (Standard))";
                case ID.languageNLB: return "Dutch (Belgian (Flemish))";
                case ID.languageENU: return "English (American)";
                case ID.languageENG: return "English (British)";
                case ID.languageENA: return "English (Australian)";
                case ID.languageENC: return "English (Canadian)";
                case ID.languageENZ: return "English (New Zealand)";
                case ID.languageENI: return "English (Ireland)";
                case ID.languageETI: return "Estonian (Estonia)";
                case ID.languageFIN: return "Finnish (Finnish)";
                case ID.languageFRA: return "French (French (Standard))";
                case ID.languageFRB: return "French (Belgian)";
                case ID.languageFRC: return "French (Canadian)";
                case ID.languageFRS: return "French (Swiss)";
                case ID.languageFRL: return "French (Luxembourg)";
                case ID.languageDEU: return "German (German (Standard))";
                case ID.languageDES: return "German (Swiss)";
                case ID.languageDEA: return "German (Austrian)";
                case ID.languageDEL: return "German (Luxembourg)";
                case ID.languageDEC: return "German (Liechtenstein)";
                case ID.languageELL: return "Greek (Greek)";
                case ID.languageHUN: return "Hungarian (Hungarian)";
                case ID.languageISL: return "Icelandic (Icelandic)";
                case ID.languageITA: return "Italian (Italian (Standard))";
                case ID.languageITS: return "Italian (Swiss)";
                case ID.languageLVI: return "Latvian (Latvia)";
                case ID.languageLTH: return "Lithuanian (Lithuania)";
                case ID.languageNOR: return "Norwegian (Norwegian (Bokmal))";
                case ID.languageNON: return "Norwegian (Norwegian (Nynorsk))";
                case ID.languagePLK: return "Polish (Polish)";
                case ID.languagePTB: return "Portuguese (Portuguese (Brazilian))";
                case ID.languagePTG: return "Portuguese (Portuguese (Standard))";
                case ID.languageROM: return "Romanian (Romania)";
                case ID.languageRUS: return "Russian (Russian)";
                case ID.languageSKY: return "Slovak (Slovak)";
                case ID.languageSLV: return "Slovenian (Slovenia)";
                case ID.languageESP: return "Spanish (Spanish (Traditional Sort))";
                case ID.languageESM: return "Spanish (Mexican)";
                case ID.languageESN: return "Spanish (Spanish (Modern Sort))";
                case ID.languageSVE: return "Swedish (Swedish)";
                case ID.languageTRK: return "Turkish (Turkish)";
                case ID.languageUKR: return "Ukrainian (Ukraine)";
                default: return "";
            }
        }
        return "";
    }

    public static function getNameName(nameId:Int):String {
        switch ( nameId )
        {
            case ID.nameCopyrightNotice:
                return "Copyright notice";
            case ID.nameFontFamilyName:
                return "Font Family name";
            case ID.nameFontSubfamilyName:
                return "Font Subfamily name";
            case ID.nameUniqueFontIdentifier:
                return "Unique font identifier";
            case ID.nameFullFontName:
                return "Full font name";
            case ID.nameVersionString:
                return "Version string";
            case ID.namePostscriptName:
                return "Postscript name";
            case ID.nameTrademark:
                return "Trademark";
            case ID.nameManufacturerName:
                return "Manufacturer Name";
            case ID.nameDesigner:
                return "Designer";
            case ID.nameDescription:
                return "Description";
            case ID.nameURLVendor:
                return "URL Vendor";
            case ID.nameURLDesigner:
                return "URL Designer";
            case ID.nameLicenseDescription:
                return "License Description";
            case ID.nameLicenseInfoURL:
                return "License Info URL";
            case ID.namePreferredFamily:
                return "Preferred Family";
            case ID.namePreferredSubfamily:
                return "Preferred Subfamily";
            case ID.nameCompatibleFull:
                return "Compatible Full";
            case ID.nameSampleText:
                return "Sample text";
            case ID.namePostScriptCIDFindfontName:
                return "PostScript CID findfont name";
            default:
                return "";
        }
    }
}
