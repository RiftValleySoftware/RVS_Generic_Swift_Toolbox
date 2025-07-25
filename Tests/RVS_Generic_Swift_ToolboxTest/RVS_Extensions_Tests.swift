/**
© Copyright 2019-2025, The Great Rift Valley Software Company

LICENSE:

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

The Great Rift Valley Software Company: https://riftvalleysoftware.com
 
Version: 1.15.7
*/

import XCTest
import RVS_Generic_Swift_Toolbox

/* ###################################################################################################################################### */
// MARK: - RVS_Int_Extensions_Tests -
/* ###################################################################################################################################### */
/**
 These are specific unit tests for the Int extension.
 */
class RVS_Int_Extensions_Tests: XCTestCase {
    /* ################################################################## */
    /**
     This is the maskedValue() extension function test (Signed Int).
     */
    func testMaskInt() {
        // 0xF30 (Value, in hex) 111100110000 (Value, in binary)
        let targetTest = 3888

        // Failure condition tests (out of bounds).
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: 0, runLength: -2))
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: 2, runLength: -2))
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: -2, runLength: 0))
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: -2, runLength: 1000))
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: 2, runLength: 0))

        // 111111111111 (Mask, in binary)
        XCTAssertEqual(3888, targetTest.maskedValue(firstPlace: 0, runLength: 12))
        // 111111110000
        XCTAssertEqual(243, targetTest.maskedValue(firstPlace: 4, runLength: 8))
        // 000000000011
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: 0, runLength: 2))
        // 000000111100
        XCTAssertEqual(12, targetTest.maskedValue(firstPlace: 2, runLength: 4))
        // 000111100000
        XCTAssertEqual(9, targetTest.maskedValue(firstPlace: 5, runLength: 4))
        // 011111111111
        XCTAssertEqual(1840, targetTest.maskedValue(firstPlace: 0, runLength: 11))
        // 111111111110
        XCTAssertEqual(1944, targetTest.maskedValue(firstPlace: 1, runLength: 11))
        // 000000110000
        XCTAssertEqual(3, targetTest.maskedValue(firstPlace: 4, runLength: 2))
        // 000001100000
        XCTAssertEqual(1, targetTest.maskedValue(firstPlace: 5, runLength: 2))
        // 000011000000
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: 6, runLength: 2))

        // 111111111111 (Mask, in binary)
        XCTAssertEqual(3888, 3888.maskedValue(firstPlace: 0, runLength: 12))
        // 111111110000
        XCTAssertEqual(243, 3888.maskedValue(firstPlace: 4, runLength: 8))
        // 000000000011
        XCTAssertEqual(0, 3888.maskedValue(firstPlace: 0, runLength: 2))
        // 000000111100
        XCTAssertEqual(12, 3888.maskedValue(firstPlace: 2, runLength: 4))
        // 000111100000
        XCTAssertEqual(9, 3888.maskedValue(firstPlace: 5, runLength: 4))
        // 011111111111
        XCTAssertEqual(1840, 3888.maskedValue(firstPlace: 0, runLength: 11))
        // 111111111110
        XCTAssertEqual(1944, 3888.maskedValue(firstPlace: 1, runLength: 11))
        // 000000110000
        XCTAssertEqual(3, 3888.maskedValue(firstPlace: 4, runLength: 2))
        // 000001100000
        XCTAssertEqual(1, 3888.maskedValue(firstPlace: 5, runLength: 2))
        // 000011000000
        XCTAssertEqual(0, 3888.maskedValue(firstPlace: 6, runLength: 2))
        
        let maxSize = (MemoryLayout<Int>.size * 8) - 1
        let testVal = Int.max
        
        for indent in 1...maxSize {
            XCTAssertEqual(testVal >> indent, testVal.maskedValue(firstPlace: 0, runLength: maxSize - indent))
            if indent == maxSize {
                XCTAssertEqual(0, testVal.maskedValue(firstPlace: indent, runLength: 1))
            } else {
                XCTAssertEqual(1, testVal.maskedValue(firstPlace: indent, runLength: 1))
            }
        }
    }
    
    /* ################################################################## */
    /**
     This is the maskedValue() extension function test (Unsigned Int).
     */
    func testMaskUInt() {
        // 0xF30 (Value, in hex) 111100110000 (Value, in binary)
        let targetTest = UInt(3888)
        // 111111111111 (Mask, in binary)
        XCTAssertEqual(3888, targetTest.maskedValue(firstPlace: 0, runLength: 12))
        // 111111110000
        XCTAssertEqual(243, targetTest.maskedValue(firstPlace: 4, runLength: 8))
        // 000000000011
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: 0, runLength: 2))
        // 000000111100
        XCTAssertEqual(12, targetTest.maskedValue(firstPlace: 2, runLength: 4))
        // 000111100000
        XCTAssertEqual(9, targetTest.maskedValue(firstPlace: 5, runLength: 4))
        // 011111111111
        XCTAssertEqual(1840, targetTest.maskedValue(firstPlace: 0, runLength: 11))
        // 111111111110
        XCTAssertEqual(1944, targetTest.maskedValue(firstPlace: 1, runLength: 11))
        // 000000110000
        XCTAssertEqual(3, targetTest.maskedValue(firstPlace: 4, runLength: 2))
        // 000001100000
        XCTAssertEqual(1, targetTest.maskedValue(firstPlace: 5, runLength: 2))
        // 000011000000
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: 6, runLength: 2))

        // 111111111111 (Mask, in binary)
        XCTAssertEqual(3888, UInt(3888).maskedValue(firstPlace: 0, runLength: 12))
        // 111111110000
        XCTAssertEqual(243, UInt(3888).maskedValue(firstPlace: 4, runLength: 8))
        // 000000000011
        XCTAssertEqual(0, UInt(3888).maskedValue(firstPlace: 0, runLength: 2))
        // 000000111100
        XCTAssertEqual(12, UInt(3888).maskedValue(firstPlace: 2, runLength: 4))
        // 000111100000
        XCTAssertEqual(9, UInt(3888).maskedValue(firstPlace: 5, runLength: 4))
        // 011111111111
        XCTAssertEqual(1840, UInt(3888).maskedValue(firstPlace: 0, runLength: 11))
        // 111111111110
        XCTAssertEqual(1944, UInt(3888).maskedValue(firstPlace: 1, runLength: 11))
        // 000000110000
        XCTAssertEqual(3, UInt(3888).maskedValue(firstPlace: 4, runLength: 2))
        // 000001100000
        XCTAssertEqual(1, UInt(3888).maskedValue(firstPlace: 5, runLength: 2))
        // 000011000000
        XCTAssertEqual(0, UInt(3888).maskedValue(firstPlace: 6, runLength: 2))
        
        let maxSize = MemoryLayout<UInt>.size * 8
        let testVal = UInt.max
        
        for indent in 1..<maxSize {
            XCTAssertEqual(testVal >> indent, testVal.maskedValue(firstPlace: 0, runLength: UInt(maxSize - indent)))
            XCTAssertEqual(1, testVal.maskedValue(firstPlace: UInt(indent), runLength: 1))
        }
    }
    
    /* ################################################################## */
    /**
     This is the maskedValue() extension function test (Unsigned Int 64).
     */
    func testMaskUInt64() {
        
        // 0xF30 (Value, in hex) 111100110000 (Value, in binary)
        let targetTest = UInt64(3888)

        // 111111111111 (Mask, in binary)
        XCTAssertEqual(3888, targetTest.maskedValue(firstPlace: 0, runLength: 12))
        // 111111110000
        XCTAssertEqual(243, targetTest.maskedValue(firstPlace: 4, runLength: 8))
        // 000000000011
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: 0, runLength: 2))
        // 000000111100
        XCTAssertEqual(12, targetTest.maskedValue(firstPlace: 2, runLength: 4))
        // 000111100000
        XCTAssertEqual(9, targetTest.maskedValue(firstPlace: 5, runLength: 4))
        // 011111111111
        XCTAssertEqual(1840, targetTest.maskedValue(firstPlace: 0, runLength: 11))
        // 111111111110
        XCTAssertEqual(1944, targetTest.maskedValue(firstPlace: 1, runLength: 11))
        // 000000110000
        XCTAssertEqual(3, targetTest.maskedValue(firstPlace: 4, runLength: 2))
        // 000001100000
        XCTAssertEqual(1, targetTest.maskedValue(firstPlace: 5, runLength: 2))
        // 000011000000
        XCTAssertEqual(0, targetTest.maskedValue(firstPlace: 6, runLength: 2))

        // 111111111111 (Mask, in binary)
        XCTAssertEqual(3888, UInt64(3888).maskedValue(firstPlace: 0, runLength: 12))
        // 111111110000
        XCTAssertEqual(243, UInt64(3888).maskedValue(firstPlace: 4, runLength: 8))
        // 000000000011
        XCTAssertEqual(0, UInt64(3888).maskedValue(firstPlace: 0, runLength: 2))
        // 000000111100
        XCTAssertEqual(12, UInt64(3888).maskedValue(firstPlace: 2, runLength: 4))
        // 000111100000
        XCTAssertEqual(9, UInt64(3888).maskedValue(firstPlace: 5, runLength: 4))
        // 011111111111
        XCTAssertEqual(1840, UInt64(3888).maskedValue(firstPlace: 0, runLength: 11))
        // 111111111110
        XCTAssertEqual(1944, UInt64(3888).maskedValue(firstPlace: 1, runLength: 11))
        // 000000110000
        XCTAssertEqual(3, UInt64(3888).maskedValue(firstPlace: 4, runLength: 2))
        // 000001100000
        XCTAssertEqual(1, UInt64(3888).maskedValue(firstPlace: 5, runLength: 2))
        // 000011000000
        XCTAssertEqual(0, UInt64(3888).maskedValue(firstPlace: 6, runLength: 2))
        
        let maxSize = MemoryLayout<UInt64>.size * 8
        let testVal = UInt64.max
        
        for indent in 1..<maxSize {
            XCTAssertEqual(testVal >> indent, testVal.maskedValue(firstPlace: 0, runLength: UInt(maxSize - indent)))
            XCTAssertEqual(1, testVal.maskedValue(firstPlace: UInt(indent), runLength: 1))
        }
    }
    
    /* ################################################################## */
    /**
     This is the isEven extension computed property test
     */
    func testIsEven() {
        XCTAssertTrue(0.isEven)
        XCTAssertFalse(1.isEven)
        XCTAssertTrue(2.isEven)
        XCTAssertFalse((-1).isEven)
        XCTAssertTrue((-2).isEven)
        XCTAssertTrue(Int8(0).isEven)
        XCTAssertFalse(Int8(1).isEven)
        XCTAssertTrue(Int8(2).isEven)
        XCTAssertFalse(Int8(-1).isEven)
        XCTAssertTrue(Int8(-2).isEven)
        XCTAssertTrue(UInt8(0).isEven)
        XCTAssertFalse(UInt8(1).isEven)
        XCTAssertTrue(UInt8(2).isEven)
        XCTAssertTrue(Int16(0).isEven)
        XCTAssertFalse(Int16(1).isEven)
        XCTAssertTrue(Int16(2).isEven)
        XCTAssertFalse(Int16(-1).isEven)
        XCTAssertTrue(Int16(-2).isEven)
        XCTAssertTrue(UInt16(0).isEven)
        XCTAssertFalse(UInt16(1).isEven)
        XCTAssertTrue(UInt16(2).isEven)
        XCTAssertTrue(Int32(0).isEven)
        XCTAssertFalse(Int32(1).isEven)
        XCTAssertTrue(Int32(2).isEven)
        XCTAssertFalse(Int32(-1).isEven)
        XCTAssertTrue(Int32(-2).isEven)
        XCTAssertTrue(UInt32(0).isEven)
        XCTAssertFalse(UInt32(1).isEven)
        XCTAssertTrue(UInt32(2).isEven)
        XCTAssertTrue(Int64(0).isEven)
        XCTAssertFalse(Int64(1).isEven)
        XCTAssertTrue(Int64(2).isEven)
        XCTAssertFalse(Int64(-1).isEven)
        XCTAssertTrue(Int64(-2).isEven)
        XCTAssertFalse(UInt64(1).isEven)
        XCTAssertTrue(UInt64(2).isEven)
        
        XCTAssertFalse(Int8(127).isEven)
        XCTAssertTrue(Int8(126).isEven)
        XCTAssertFalse(Int8(-127).isEven)
        XCTAssertTrue(Int8(-128).isEven)
        XCTAssertFalse(UInt8(255).isEven)
        XCTAssertTrue(UInt8(254).isEven)
        XCTAssertFalse(Int16(32767).isEven)
        XCTAssertTrue(Int16(32766).isEven)
        XCTAssertFalse(Int16(-32767).isEven)
        XCTAssertTrue(Int16(-32768).isEven)
        XCTAssertFalse(UInt16(65535).isEven)
        XCTAssertTrue(UInt16(65534).isEven)
        XCTAssertFalse(Int32(2147483647).isEven)
        XCTAssertTrue(Int32(2147483646).isEven)
        XCTAssertFalse(Int32(-2147483647).isEven)
        XCTAssertTrue(Int32(-2147483648).isEven)
        XCTAssertFalse(UInt32(4294967295).isEven)
        XCTAssertTrue(UInt32(4294967294).isEven)
        XCTAssertFalse(Int64(9223372036854775807).isEven)
        XCTAssertTrue(Int64(9223372036854775806).isEven)
        XCTAssertFalse(Int64(-9223372036854775807).isEven)
        XCTAssertTrue(Int64(-9223372036854775808).isEven)
        XCTAssertFalse(UInt64(18446744073709551615).isEven)
        XCTAssertTrue(UInt64(18446744073709551614).isEven)
    }

    /* ################################################################## */
    /**
     Test the Roman numerals.
     */
    func testRomanNumerals() {
        let testArray: [(Int, String)] = [(0, ""),
                                          (1, "I"),
                                          (2, "II"),
                                          (3, "III"),
                                          (4, "IV"),
                                          (5, "V"),
                                          (6, "VI"),
                                          (7, "VII"),
                                          (8, "VIII"),
                                          (9, "IX"),
                                          (10, "X"),
                                          (11, "XI"),
                                          (12, "XII"),
                                          (13, "XIII"),
                                          (14, "XIV"),
                                          (15, "XV"),
                                          (16, "XVI"),
                                          (17, "XVII"),
                                          (18, "XVIII"),
                                          (19, "XIX"),
                                          (20, "XX"),
                                          (30, "XXX"),
                                          (40, "XL"),
                                          (41, "XLI"),
                                          (42, "XLII"),
                                          (43, "XLIII"),
                                          (44, "XLIV"),
                                          (45, "XLV"),
                                          (46, "XLVI"),
                                          (47, "XLVII"),
                                          (48, "XLVIII"),
                                          (49, "XLIX"),
                                          (50, "L"),
                                          (51, "LI"),
                                          (52, "LII"),
                                          (53, "LIII"),
                                          (54, "LIV"),
                                          (55, "LV"),
                                          (56, "LVI"),
                                          (57, "LVII"),
                                          (58, "LVIII"),
                                          (59, "LIX"),
                                          (60, "LX"),
                                          (70, "LXX"),
                                          (80, "LXXX"),
                                          (90, "XC"),
                                          (91, "XCI"),
                                          (95, "XCV"),
                                          (99, "XCIX"),
                                          (100, "C"),
                                          (200, "CC"),
                                          (300, "CCC"),
                                          (400, "CD"),
                                          (401, "CDI"),
                                          (409, "CDIX"),
                                          (490, "CDXC"),
                                          (499, "CDXCIX"),
                                          (500, "D"),
                                          (501, "DI"),
                                          (509, "DIX"),
                                          (590, "DXC"),
                                          (800, "DCCC"),
                                          (900, "CM"),
                                          (950, "CML"),
                                          (999, "CMXCIX"),
                                          (1000, "M"),
                                          (1900, "MCM"),
                                          (1999, "MCMXCIX"),
                                          (2000, "MM"),
                                          (2049, "MMXLIX"),
                                          (2050, "MML"),
                                          (3888, "MMMDCCCLXXXVIII"),
                                          (3999, "MMMCMXCIX"),
                                          (4000, "MMMM"),
                                          (4999, "MMMMCMXCIX"),
                                          (5000, "")
        ]
        
        testArray.forEach { XCTAssertEqual($0.0.romanNumeral, $0.1) }
    }
    
    /* ################################################################## */
    /**
     This tests the basic scaler degree/radian conversions.
     */
    func testDegreeRadianConversion() {
        XCTAssertEqual(180, Double.pi.degrees)
        XCTAssertEqual(Double.pi, 180.0.radians)
        XCTAssertEqual(Float(180), Float(Double.pi.degrees))
        XCTAssertEqual(Float(Double.pi), Float(180).radians)
        XCTAssertEqual(33.2.radians.degrees, 33.2)
        XCTAssertEqual(1.23456.degrees.radians, 1.23456)
    }
}

/* ###################################################################################################################################### */
// MARK: - Debug Tools Tests -
/* ###################################################################################################################################### */
/**
 These are specific unit tests for the Debug Tools.
 */
class RVS_DebugTools_Tests: XCTestCase {
    /* ################################################################## */
    /**
     Just a flag to see if we are running as a test case.
     
     Unfortunately, we can't test if we AREN'T running as a test, because...heisenbug.
     */
    func testIsRunningDebug() {
        XCTAssertTrue(RVS_DebugTools.isRunningUnitTests)
    }
}

/* ###################################################################################################################################### */
// MARK: - RVS_String_Extensions_Tests -
/* ###################################################################################################################################### */
/**
 These are specific unit tests for the StringProtocol extension.
 */
class RVS_String_Extensions_Tests: XCTestCase {
    /* ################################################################## */
    /**
     Test our UUID scrubber computed property.
     */
    func testUUIDParser() {
        XCTAssertEqual("0123", "0123".uuidFormat)
        XCTAssertNil("01234".uuidFormat)
        XCTAssertNil("0123A".uuidFormat)
        XCTAssertEqual("0123", "0123g".uuidFormat)
        XCTAssertEqual("0123", "0123-".uuidFormat)
        XCTAssertEqual("01234567-8901-2345-6789-012345678901", "01234567890123456789012345678901".uuidFormat)
        
        XCTAssertEqual("01234567-89AB-CDEF-0123-456789ABCDEF", "0123456789ABcdEf0123456789abcdEF".uuidFormat)
        
        XCTAssertEqual("01234567-89AB-CDEF-0123-456789ABCDEF", "0123456789ABcdEf012345RowRowRowYour6789abcdEFShip".uuidFormat)

        XCTAssertEqual("89AB", "89a-b".uuidFormat)
        
        XCTAssertEqual("89AB", "89axb".uuidFormat)
    }
    
    /* ################################################################## */
    /**
     Test the two hexDump8/16 computed properties.
     */
    func testHexDumps() {
        let testTarget = "05FE6410ACD6"
        XCTAssertEqual(["30", "35", "46", "45", "36", "34", "31", "30", "41", "43", "44", "36"], testTarget.hexDump8)
        XCTAssertEqual(["0030", "0035", "0046", "0045", "0036", "0034", "0031", "0030", "0041", "0043", "0044", "0036"], testTarget.hexDump16)
    }
    
    /* ################################################################## */
    /**
     Test the firstUppercased computed property.
     */
    func testFirstUppercased() {
        let testTarget = "john jacob jingleheimerschmidt"
        XCTAssertEqual("John jacob jingleheimerschmidt", testTarget.firstUppercased)
    }
    
    /* ################################################################## */
    /**
     Test the Int converter computed property.
     */
    func testHex2Int() {
        let testTarget = "20"
        XCTAssertEqual(32, testTarget.hex2Int)
        XCTAssertEqual(61696, "F100".hex2Int)
        XCTAssertEqual(3, "3".hex2Int)
        XCTAssertNil("G".hex2Int)
        XCTAssertEqual(238, "George".hex2Int)
    }
}

/* ###################################################################################################################################### */
// MARK: - RVS_Foundation_Extensions_Tests -
/* ###################################################################################################################################### */
/**
 These are specific unit tests for the Foundation extension.
 */
class RVS_Foundation_Extensions_Tests: XCTestCase {
    /* ################################################################## */
    /**
     */
    static func makeDate(year inYear: Int, month inMonth: Int, day inDay: Int, calendar inCalendar: Calendar? = nil) -> Date {
        (nil == inCalendar ? Calendar(identifier: .gregorian) : inCalendar!).date(from: DateComponents(year: inYear, month: inMonth, day: inDay)) ?? Date()
    }

    /* ################################################################## */
    /**
     Test the day-granularity comparisons.
     */
    func testDayDateComparisons() {
        let thisMorning = Calendar.current.startOfDay(for: Date())
        let yesterdayMorning = Calendar.current.startOfDay(for: Date()).addingTimeInterval(-60 * 60 * 24)
        let tomorrowMorning = Calendar.current.startOfDay(for: Date()).addingTimeInterval(60 * 60 * 24)
        let thisNoon = thisMorning.addingTimeInterval(60 * 60 * 12)
        let thisAfteroon = thisMorning.addingTimeInterval((60 * 60 * 15) + 43)
        let thisEvening = thisMorning.addingTimeInterval((60 * 60 * 20) + 17)
        let thisNearlyMidnight = tomorrowMorning.addingTimeInterval(-1)
        let yesterdayNoon = yesterdayMorning.addingTimeInterval(60 * 60 * 12)
        let yesterdayAfteroon = yesterdayMorning.addingTimeInterval((60 * 60 * 15) + 43)
        let yesterdayEvening = yesterdayMorning.addingTimeInterval((60 * 60 * 20) + 17)
        let yesterdayNearlyMidnight = thisMorning.addingTimeInterval(-1)
        let tomorrowNoon = tomorrowMorning.addingTimeInterval(60 * 60 * 12)
        let tomorrowAfteroon = tomorrowMorning.addingTimeInterval((60 * 60 * 15) + 43)
        let tomorrowEvening = tomorrowMorning.addingTimeInterval((60 * 60 * 20) + 17)
        let tomorrowNearlyMidnight = tomorrowMorning.addingTimeInterval((60 * 60 * 23) + (60 * 59) + 59)

        XCTAssertTrue(yesterdayMorning.isOnTheSameDayAs(yesterdayMorning))
        XCTAssertTrue(yesterdayMorning.isOnTheSameDayAs(yesterdayNoon))
        XCTAssertTrue(yesterdayMorning.isOnTheSameDayAs(yesterdayAfteroon))
        XCTAssertTrue(yesterdayMorning.isOnTheSameDayAs(yesterdayEvening))
        XCTAssertTrue(yesterdayMorning.isOnTheSameDayAs(yesterdayNearlyMidnight))

        XCTAssertTrue(yesterdayNoon.isOnTheSameDayAs(yesterdayMorning))
        XCTAssertTrue(yesterdayNoon.isOnTheSameDayAs(yesterdayNoon))
        XCTAssertTrue(yesterdayNoon.isOnTheSameDayAs(yesterdayAfteroon))
        XCTAssertTrue(yesterdayNoon.isOnTheSameDayAs(yesterdayEvening))
        XCTAssertTrue(yesterdayNoon.isOnTheSameDayAs(yesterdayNearlyMidnight))

        XCTAssertTrue(yesterdayAfteroon.isOnTheSameDayAs(yesterdayMorning))
        XCTAssertTrue(yesterdayAfteroon.isOnTheSameDayAs(yesterdayNoon))
        XCTAssertTrue(yesterdayAfteroon.isOnTheSameDayAs(yesterdayAfteroon))
        XCTAssertTrue(yesterdayAfteroon.isOnTheSameDayAs(yesterdayEvening))
        XCTAssertTrue(yesterdayAfteroon.isOnTheSameDayAs(yesterdayNearlyMidnight))

        XCTAssertTrue(yesterdayEvening.isOnTheSameDayAs(yesterdayMorning))
        XCTAssertTrue(yesterdayEvening.isOnTheSameDayAs(yesterdayNoon))
        XCTAssertTrue(yesterdayEvening.isOnTheSameDayAs(yesterdayAfteroon))
        XCTAssertTrue(yesterdayEvening.isOnTheSameDayAs(yesterdayEvening))
        XCTAssertTrue(yesterdayEvening.isOnTheSameDayAs(yesterdayNearlyMidnight))

        XCTAssertTrue(yesterdayNearlyMidnight.isOnTheSameDayAs(yesterdayMorning))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnTheSameDayAs(yesterdayNoon))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnTheSameDayAs(yesterdayAfteroon))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnTheSameDayAs(yesterdayEvening))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnTheSameDayAs(yesterdayNearlyMidnight))

        XCTAssertTrue(thisMorning.isOnTheSameDayAs(thisMorning))
        XCTAssertTrue(thisMorning.isOnTheSameDayAs(thisNoon))
        XCTAssertTrue(thisMorning.isOnTheSameDayAs(thisAfteroon))
        XCTAssertTrue(thisMorning.isOnTheSameDayAs(thisEvening))
        XCTAssertTrue(thisMorning.isOnTheSameDayAs(thisNearlyMidnight))

        XCTAssertTrue(thisNoon.isOnTheSameDayAs(thisMorning))
        XCTAssertTrue(thisNoon.isOnTheSameDayAs(thisNoon))
        XCTAssertTrue(thisNoon.isOnTheSameDayAs(thisAfteroon))
        XCTAssertTrue(thisNoon.isOnTheSameDayAs(thisEvening))
        XCTAssertTrue(thisNoon.isOnTheSameDayAs(thisNearlyMidnight))

        XCTAssertTrue(thisAfteroon.isOnTheSameDayAs(thisMorning))
        XCTAssertTrue(thisAfteroon.isOnTheSameDayAs(thisNoon))
        XCTAssertTrue(thisAfteroon.isOnTheSameDayAs(thisAfteroon))
        XCTAssertTrue(thisAfteroon.isOnTheSameDayAs(thisEvening))
        XCTAssertTrue(thisAfteroon.isOnTheSameDayAs(thisNearlyMidnight))

        XCTAssertTrue(thisEvening.isOnTheSameDayAs(thisMorning))
        XCTAssertTrue(thisEvening.isOnTheSameDayAs(thisNoon))
        XCTAssertTrue(thisEvening.isOnTheSameDayAs(thisAfteroon))
        XCTAssertTrue(thisEvening.isOnTheSameDayAs(thisEvening))
        XCTAssertTrue(thisEvening.isOnTheSameDayAs(thisNearlyMidnight))

        XCTAssertTrue(thisNearlyMidnight.isOnTheSameDayAs(thisMorning))
        XCTAssertTrue(thisNearlyMidnight.isOnTheSameDayAs(thisNoon))
        XCTAssertTrue(thisNearlyMidnight.isOnTheSameDayAs(thisAfteroon))
        XCTAssertTrue(thisNearlyMidnight.isOnTheSameDayAs(thisEvening))
        XCTAssertTrue(thisNearlyMidnight.isOnTheSameDayAs(thisNearlyMidnight))

        XCTAssertTrue(tomorrowMorning.isOnTheSameDayAs(tomorrowMorning))
        XCTAssertTrue(tomorrowMorning.isOnTheSameDayAs(tomorrowNoon))
        XCTAssertTrue(tomorrowMorning.isOnTheSameDayAs(tomorrowAfteroon))
        XCTAssertTrue(tomorrowMorning.isOnTheSameDayAs(tomorrowEvening))
        XCTAssertTrue(tomorrowMorning.isOnTheSameDayAs(tomorrowNearlyMidnight))

        XCTAssertTrue(tomorrowNoon.isOnTheSameDayAs(tomorrowMorning))
        XCTAssertTrue(tomorrowNoon.isOnTheSameDayAs(tomorrowNoon))
        XCTAssertTrue(tomorrowNoon.isOnTheSameDayAs(tomorrowAfteroon))
        XCTAssertTrue(tomorrowNoon.isOnTheSameDayAs(tomorrowEvening))
        XCTAssertTrue(tomorrowNoon.isOnTheSameDayAs(tomorrowNearlyMidnight))

        XCTAssertTrue(tomorrowAfteroon.isOnTheSameDayAs(tomorrowMorning))
        XCTAssertTrue(tomorrowAfteroon.isOnTheSameDayAs(tomorrowNoon))
        XCTAssertTrue(tomorrowAfteroon.isOnTheSameDayAs(tomorrowAfteroon))
        XCTAssertTrue(tomorrowAfteroon.isOnTheSameDayAs(tomorrowEvening))
        XCTAssertTrue(tomorrowAfteroon.isOnTheSameDayAs(tomorrowNearlyMidnight))

        XCTAssertTrue(tomorrowEvening.isOnTheSameDayAs(tomorrowMorning))
        XCTAssertTrue(tomorrowEvening.isOnTheSameDayAs(tomorrowNoon))
        XCTAssertTrue(tomorrowEvening.isOnTheSameDayAs(tomorrowAfteroon))
        XCTAssertTrue(tomorrowEvening.isOnTheSameDayAs(tomorrowEvening))
        XCTAssertTrue(tomorrowEvening.isOnTheSameDayAs(tomorrowNearlyMidnight))

        XCTAssertTrue(tomorrowNearlyMidnight.isOnTheSameDayAs(tomorrowMorning))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnTheSameDayAs(tomorrowNoon))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnTheSameDayAs(tomorrowAfteroon))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnTheSameDayAs(tomorrowEvening))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnTheSameDayAs(tomorrowNearlyMidnight))

        XCTAssertTrue(yesterdayMorning.isOnADayBefore(thisMorning))
        XCTAssertTrue(yesterdayMorning.isOnADayBefore(thisAfteroon))
        XCTAssertTrue(yesterdayMorning.isOnADayBefore(thisEvening))
        XCTAssertTrue(yesterdayMorning.isOnADayBefore(thisNearlyMidnight))
        XCTAssertTrue(yesterdayMorning.isOnADayBefore(tomorrowMorning))
        XCTAssertTrue(yesterdayMorning.isOnADayBefore(tomorrowAfteroon))
        XCTAssertTrue(yesterdayMorning.isOnADayBefore(tomorrowEvening))
        XCTAssertTrue(yesterdayMorning.isOnADayBefore(tomorrowNearlyMidnight))

        XCTAssertTrue(yesterdayNoon.isOnADayBefore(thisMorning))
        XCTAssertTrue(yesterdayNoon.isOnADayBefore(thisAfteroon))
        XCTAssertTrue(yesterdayNoon.isOnADayBefore(thisEvening))
        XCTAssertTrue(yesterdayNoon.isOnADayBefore(thisNearlyMidnight))
        XCTAssertTrue(yesterdayNoon.isOnADayBefore(tomorrowMorning))
        XCTAssertTrue(yesterdayNoon.isOnADayBefore(tomorrowAfteroon))
        XCTAssertTrue(yesterdayNoon.isOnADayBefore(tomorrowEvening))
        XCTAssertTrue(yesterdayNoon.isOnADayBefore(tomorrowNearlyMidnight))

        XCTAssertTrue(yesterdayAfteroon.isOnADayBefore(thisMorning))
        XCTAssertTrue(yesterdayAfteroon.isOnADayBefore(thisAfteroon))
        XCTAssertTrue(yesterdayAfteroon.isOnADayBefore(thisEvening))
        XCTAssertTrue(yesterdayAfteroon.isOnADayBefore(thisNearlyMidnight))
        XCTAssertTrue(yesterdayAfteroon.isOnADayBefore(tomorrowMorning))
        XCTAssertTrue(yesterdayAfteroon.isOnADayBefore(tomorrowAfteroon))
        XCTAssertTrue(yesterdayAfteroon.isOnADayBefore(tomorrowEvening))
        XCTAssertTrue(yesterdayAfteroon.isOnADayBefore(tomorrowNearlyMidnight))

        XCTAssertTrue(yesterdayEvening.isOnADayBefore(thisMorning))
        XCTAssertTrue(yesterdayEvening.isOnADayBefore(thisAfteroon))
        XCTAssertTrue(yesterdayEvening.isOnADayBefore(thisEvening))
        XCTAssertTrue(yesterdayEvening.isOnADayBefore(thisNearlyMidnight))
        XCTAssertTrue(yesterdayEvening.isOnADayBefore(tomorrowMorning))
        XCTAssertTrue(yesterdayEvening.isOnADayBefore(tomorrowAfteroon))
        XCTAssertTrue(yesterdayEvening.isOnADayBefore(tomorrowEvening))
        XCTAssertTrue(yesterdayEvening.isOnADayBefore(tomorrowNearlyMidnight))

        XCTAssertTrue(yesterdayNearlyMidnight.isOnADayBefore(thisMorning))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnADayBefore(thisAfteroon))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnADayBefore(thisEvening))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnADayBefore(thisNearlyMidnight))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnADayBefore(tomorrowMorning))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnADayBefore(tomorrowAfteroon))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnADayBefore(tomorrowEvening))
        XCTAssertTrue(yesterdayNearlyMidnight.isOnADayBefore(tomorrowNearlyMidnight))

        XCTAssertTrue(tomorrowMorning.isOnADayAfter(thisMorning))
        XCTAssertTrue(tomorrowMorning.isOnADayAfter(thisAfteroon))
        XCTAssertTrue(tomorrowMorning.isOnADayAfter(thisEvening))
        XCTAssertTrue(tomorrowMorning.isOnADayAfter(thisNearlyMidnight))
        XCTAssertTrue(tomorrowMorning.isOnADayAfter(yesterdayMorning))
        XCTAssertTrue(tomorrowMorning.isOnADayAfter(yesterdayAfteroon))
        XCTAssertTrue(tomorrowMorning.isOnADayAfter(yesterdayEvening))
        XCTAssertTrue(tomorrowMorning.isOnADayAfter(yesterdayNearlyMidnight))

        XCTAssertTrue(tomorrowNoon.isOnADayAfter(thisMorning))
        XCTAssertTrue(tomorrowNoon.isOnADayAfter(thisAfteroon))
        XCTAssertTrue(tomorrowNoon.isOnADayAfter(thisEvening))
        XCTAssertTrue(tomorrowNoon.isOnADayAfter(thisNearlyMidnight))
        XCTAssertTrue(tomorrowNoon.isOnADayAfter(yesterdayMorning))
        XCTAssertTrue(tomorrowNoon.isOnADayAfter(yesterdayAfteroon))
        XCTAssertTrue(tomorrowNoon.isOnADayAfter(yesterdayEvening))
        XCTAssertTrue(tomorrowNoon.isOnADayAfter(yesterdayNearlyMidnight))

        XCTAssertTrue(tomorrowAfteroon.isOnADayAfter(thisMorning))
        XCTAssertTrue(tomorrowAfteroon.isOnADayAfter(thisAfteroon))
        XCTAssertTrue(tomorrowAfteroon.isOnADayAfter(thisEvening))
        XCTAssertTrue(tomorrowAfteroon.isOnADayAfter(thisNearlyMidnight))
        XCTAssertTrue(tomorrowAfteroon.isOnADayAfter(yesterdayMorning))
        XCTAssertTrue(tomorrowAfteroon.isOnADayAfter(yesterdayAfteroon))
        XCTAssertTrue(tomorrowAfteroon.isOnADayAfter(yesterdayEvening))
        XCTAssertTrue(tomorrowAfteroon.isOnADayAfter(yesterdayNearlyMidnight))

        XCTAssertTrue(tomorrowEvening.isOnADayAfter(thisMorning))
        XCTAssertTrue(tomorrowEvening.isOnADayAfter(thisAfteroon))
        XCTAssertTrue(tomorrowEvening.isOnADayAfter(thisEvening))
        XCTAssertTrue(tomorrowEvening.isOnADayAfter(thisNearlyMidnight))
        XCTAssertTrue(tomorrowEvening.isOnADayAfter(yesterdayMorning))
        XCTAssertTrue(tomorrowEvening.isOnADayAfter(yesterdayAfteroon))
        XCTAssertTrue(tomorrowEvening.isOnADayAfter(yesterdayEvening))
        XCTAssertTrue(tomorrowEvening.isOnADayAfter(yesterdayNearlyMidnight))

        XCTAssertTrue(tomorrowNearlyMidnight.isOnADayAfter(thisMorning))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnADayAfter(thisAfteroon))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnADayAfter(thisEvening))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnADayAfter(thisNearlyMidnight))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnADayAfter(yesterdayMorning))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnADayAfter(yesterdayAfteroon))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnADayAfter(yesterdayEvening))
        XCTAssertTrue(tomorrowNearlyMidnight.isOnADayAfter(yesterdayNearlyMidnight))
    }
    
    /* ################################################################## */
    /**
     Test the CGSize Diagonal Computed Property
     */
    func testCGSizeDiagonal() {
        XCTAssertEqual(CGSize(width: 100, height: 100).diagonal, 141.4213562373095)
        XCTAssertEqual(CGSize(width: 100, height: 50).diagonal, 111.80339887498948)
        XCTAssertEqual(CGSize(width: 50, height: 100).diagonal, 111.80339887498948)
    }
    
    /* ################################################################## */
    /**
     Test the CGSize Diagonal Computed Property
     NB: There are precision issues with the calculation, that we account for, here.
     */
    func testCGPoint() {
        let fulcrumPoint = CGPoint(x: 50, y: 50)
        
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byRadians: CGFloat.pi / 2), CGPoint(x: 49.99999999999999, y: 0))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byDegrees: 90), CGPoint(x: 49.99999999999999, y: 0))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byDegrees: 180), CGPoint(x: 100, y: 49.999999999999986))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byRadians: CGFloat.pi), CGPoint(x: 100, y: 49.999999999999986))
        XCTAssertEqual(CGPoint(x: 50, y: 50).rotated(around: fulcrumPoint, byDegrees: 90), CGPoint(x: 50.0, y: 50.0))

        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byRadians: CGFloat.pi / 2, precisionInDecimalPlaces: 0), CGPoint(x: 50, y: 0))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byDegrees: 90, precisionInDecimalPlaces: 0), CGPoint(x: 50, y: 0))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byDegrees: 180, precisionInDecimalPlaces: 0), CGPoint(x: 100, y: 50))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byRadians: CGFloat.pi, precisionInDecimalPlaces: 0), CGPoint(x: 100, y: 50))
        XCTAssertEqual(CGPoint(x: 50, y: 50).rotated(around: fulcrumPoint, byDegrees: 90, precisionInDecimalPlaces: 0), CGPoint(x: 50, y: 50))

        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byRadians: CGFloat.pi / 2, precisionInDecimalPlaces: 2), CGPoint(x: 50, y: 0))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byDegrees: 90, precisionInDecimalPlaces: 2), CGPoint(x: 50, y: 0))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byDegrees: 180, precisionInDecimalPlaces: 2), CGPoint(x: 100, y: 50))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byRadians: CGFloat.pi, precisionInDecimalPlaces: 2), CGPoint(x: 100, y: 50))
        XCTAssertEqual(CGPoint(x: 50, y: 50).rotated(around: fulcrumPoint, byDegrees: 90, precisionInDecimalPlaces: 2), CGPoint(x: 50, y: 50))

        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byRadians: CGFloat.pi / 2, precisionInDecimalPlaces: 14), CGPoint(x: 49.99999999999999, y: 0))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byDegrees: 90, precisionInDecimalPlaces: 14), CGPoint(x: 49.99999999999999, y: 0))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byDegrees: 180, precisionInDecimalPlaces: 14), CGPoint(x: 100, y: 49.99999999999999))
        XCTAssertEqual(CGPoint(x: 0, y: 50).rotated(around: fulcrumPoint, byRadians: CGFloat.pi, precisionInDecimalPlaces: 14), CGPoint(x: 100, y: 49.99999999999999))
        XCTAssertEqual(CGPoint(x: 50, y: 50).rotated(around: fulcrumPoint, byDegrees: 90, precisionInDecimalPlaces: 14), CGPoint(x: 50, y: 50))
    }
    
    /* ################################################################## */
    /**
     Test the CGFloat versions of the decimal/radian conversion.
     */
    func testDegreeRadianConversion() {
        XCTAssertEqual(CGFloat(180), CGFloat(Double.pi).degrees)
        XCTAssertEqual(CGFloat(Double.pi), CGFloat(180).radians)
        XCTAssertEqual(CGFloat(33.2).radians.degrees, CGFloat(33.2))
        // This just makes absolutely sure we test Float
        let degrees = Float(1.23456).degrees
        let radians = degrees.radians
        XCTAssertEqual(Float(1.23456), radians)
    }
    
    /* ################################################################## */
    /**
     Test our MD5 computed property.
     */
    func testMD5() {
        XCTAssertEqual("860820C8ABCB42F9C831CB5CA982A06D", "How now, brown cow?".md5)
        XCTAssertEqual("DC8BD40E7C60AA1D8EA9E450DAE4DDFB", "The Foxy Cabbage Absconds With the Sleepy Canine.".md5)
        XCTAssertEqual("A0FF1D5CC6CFC4A81C91EFDA93C77187", "All Your Bases Belongs To Us!".md5)
        
        let testString1 = "Luke, I Am Your Farter!"
        XCTAssertEqual("97EA9B296503B4A173C182829BDD5E49", testString1.md5)
        
        let testString2 = ""
        XCTAssertEqual("D41D8CD98F00B204E9800998ECF8427E", testString2.md5)
    }
    
    /* ################################################################## */
    /**
     Test our SHA256 computed property.
     */
    func testSHA256() {
        XCTAssertEqual("B21E0C613CEEC9A65AFB9FD0E25E58BE7BA5CAB933F40A89AE45BB52A92116D7", "How now, brown cow?".sha256)
        XCTAssertEqual("902F24E682A0F016F64D8C16DA76897AD0726B44A07FCC412D98D48D52B37F0B", "The Foxy Cabbage Absconds With the Sleepy Canine.".sha256)
        XCTAssertEqual("1E2847A4A9E34B70C3B196241BFE0CA2B4D4FEBA8E39DDE200C6081EE1792AD9", "All Your Bases Belongs To Us!".sha256)
        
        let testString1 = "Luke, I Am Your Farter!"
        XCTAssertEqual("1FC51E504917018E57B6D52371552339CEF83BEEE0D4BA1360F54CBCACDF3387", testString1.sha256)
        
        let testString2 = ""
        XCTAssertEqual("E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855", testString2.sha256)
    }
    
    /* ################################################################## */
    /**
     Test the URL encoding/decoding computed properties.
     */
    func testURLEncoding() {
        let testTarget = "Sticks & Stones-May/Break+My%Bones"
        let urlencoded = testTarget.urlEncodedString
        XCTAssertEqual("Sticks%20&%20Stones-May/Break+My%25Bones", urlencoded)
        XCTAssertEqual("Sticks & Stones-May/Break+My%Bones", urlencoded?.urlDecodedString)
    }
    
    /* ################################################################## */
    /**
     Test the various "XXOnly" computed properties.
     */
    func testBinaryOctalHexOnly() {
        let testTarget = "1 Is Too Many, A Thousand Never Enough, Unless you have 2, 7, 8, or 9 more than 0, or 1."
        XCTAssertEqual("101", testTarget.binaryOnly)
        XCTAssertEqual("12701", testTarget.octalOnly)
        XCTAssertEqual("1278901", testTarget.decimalOnly)
        XCTAssertEqual("1AAADEEEEAE2789EA01", testTarget.hexOnly)
    }
    
    /* ################################################################## */
    /**
     Test the UTF8 converter computed property.
     */
    func testHex2UTF8() {
        var testTarget = "30 35 46 45 36 34 31 30 41 43 44 36"
        XCTAssertEqual("05FE6410ACD6", testTarget.hex2UTF8)
        testTarget = "30354645 36 34 31 304143 44 36"
        XCTAssertEqual("05FE6410ACD6", testTarget.hex2UTF8)
        testTarget = "30354645D36 34 31 304143 44 36"
        XCTAssertEqual("05FEÓ410ACD6", testTarget.hex2UTF8)
        testTarget = "30354645 D 36 34 31 304143 44 36"
        XCTAssertEqual("05FE6410ACD6", testTarget.hex2UTF8)
    }
    
    /* ################################################################## */
    /**
     This tests the `isAValidEmailAddress` computed property.
     */
    func testValidEmailAddress() {
        XCTAssertFalse("notAHotDog".isAValidEmailAddress)
        XCTAssertFalse("notAHotD.og".isAValidEmailAddress)
        XCTAssertFalse("not@AHotDo.g".isAValidEmailAddress)
        XCTAssertTrue("not@AHotD.og".isAValidEmailAddress)
        XCTAssertFalse("n0t@AH0tD.0g".isAValidEmailAddress)
        XCTAssertFalse("n0t@AH0tD.O9".isAValidEmailAddress)
        XCTAssertTrue("N@D.OG".isAValidEmailAddress)
        XCTAssertFalse("N@D.OG5".isAValidEmailAddress)
        XCTAssertTrue("N@D.OGS".isAValidEmailAddress)
        XCTAssertFalse("@D.OGS".isAValidEmailAddress)
        XCTAssertFalse("D.OGS".isAValidEmailAddress)
        XCTAssertFalse("D@OGS".isAValidEmailAddress)
        XCTAssertTrue("1@D.OGS".isAValidEmailAddress)
        XCTAssertTrue("1@2.OGS".isAValidEmailAddress)
        XCTAssertTrue("N@2.OGS".isAValidEmailAddress)
        XCTAssertTrue("n@2.OGS".isAValidEmailAddress)
        XCTAssertTrue(".@2.OGS".isAValidEmailAddress)
        XCTAssertTrue("-@2.OGS".isAValidEmailAddress)
        XCTAssertTrue("_@2.OGS".isAValidEmailAddress)
        XCTAssertTrue("%@2.OGS".isAValidEmailAddress)
        XCTAssertFalse(".@.OGS".isAValidEmailAddress)
        XCTAssertTrue(".@..OGS".isAValidEmailAddress)
        XCTAssertTrue(".@-.OGS".isAValidEmailAddress)
        XCTAssertFalse(".@_.OGS".isAValidEmailAddress)
        XCTAssertFalse(".@%.OGS".isAValidEmailAddress)
        XCTAssertFalse(".@A.OG-S".isAValidEmailAddress)
        XCTAssertFalse(".@A.OG.S".isAValidEmailAddress)
        XCTAssertFalse(".@A.O.G.S".isAValidEmailAddress)
        XCTAssertTrue(".@A.O.GS".isAValidEmailAddress)
        XCTAssertTrue(".@A..OGS".isAValidEmailAddress)
        XCTAssertTrue(".@A..O.GS".isAValidEmailAddress)
        XCTAssertTrue(".@A.-O.GS".isAValidEmailAddress)
        XCTAssertFalse(".@A.-O.-GS".isAValidEmailAddress)
    }
    
    /* ################################################################## */
    /**
     This tests the "set-based" split methods.
     */
    func testSetSplit() {
        let splitCharacterSetAsAString = "\r\n\t "
        let splitCharacterSetAsACharacterSet = CharacterSet(charactersIn: splitCharacterSetAsAString)
        
        let compArray1 = [String.SubSequence("Can"), String.SubSequence("You"), String.SubSequence("Believe"), String.SubSequence("it?")]

        let testString1 = "Can\rYou\rBelieve\rit?"

        XCTAssertEqual(testString1.setSplit(splitCharacterSetAsACharacterSet), compArray1)
        XCTAssertEqual(testString1.setSplit(charactersIn: splitCharacterSetAsAString), compArray1)
        
        let testString2 = "Can\n\rYou\n\rBelieve\n\rit?"
        
        XCTAssertEqual(testString2.setSplit(splitCharacterSetAsACharacterSet), compArray1)
        XCTAssertEqual(testString2.setSplit(charactersIn: splitCharacterSetAsAString), compArray1)
        
        let testString3 = "Can\n\r\n\rYou\rBelieve\nit?"
        
        XCTAssertEqual(testString3.setSplit(splitCharacterSetAsACharacterSet), compArray1)
        XCTAssertEqual(testString3.setSplit(charactersIn: splitCharacterSetAsAString), compArray1)
        
        let testString4 = " The Quick\t\t\t\t\tBrown Fox\rJumps                 Over\r\t\n \n\t\rThe Lazy Dog\t. \t\n"
        let compArray2 = [String.SubSequence("The"), String.SubSequence("Quick"), String.SubSequence("Brown"), String.SubSequence("Fox"), String.SubSequence("Jumps"), String.SubSequence("Over"), String.SubSequence("The"), String.SubSequence("Lazy"), String.SubSequence("Dog"), String.SubSequence(".")]
        XCTAssertEqual(testString4.setSplit(splitCharacterSetAsACharacterSet), compArray2)
        XCTAssertEqual(testString4.setSplit(charactersIn: splitCharacterSetAsAString), compArray2)

        let blackJoker = "🃏"
        let redJoker = "🃟"
        let spadesFaceCards = "🃛🂮🂫🂭"
        let heartsFaceCards = "🂻🂼🂽🂾"
        let diamondsFaceCards = "🃋🃌🃍🃎"
        let clubsFaceCards = "🃛🃜🃝🃞"
        let spadesNumberCards = "🂡🂢🂣🂤🂥🂦🂧🂨🂩🂪"
        let heartsNumberCards = "🂱🂲🂳🂴🂵🂶🂷🂸🂹🂺"
        let diamondsNumberCards = "🃁🃂🃃🃄🃅🃆🃇🃈🃉🃊"
        let clubsNumberCards = "🃑🃒🃓🃔🃕🃖🃗🃘🃙🃚"
        
        let sortedDeck = blackJoker + spadesNumberCards + " " + spadesFaceCards + blackJoker + clubsNumberCards + " " + clubsFaceCards + blackJoker + redJoker + diamondsNumberCards + " " + diamondsFaceCards + redJoker + heartsNumberCards + " " + heartsFaceCards + redJoker
        
        let expectedResult = [String.SubSequence(spadesNumberCards + " " + spadesFaceCards), String.SubSequence(clubsNumberCards + " " + clubsFaceCards), String.SubSequence(diamondsNumberCards + " " + diamondsFaceCards), String.SubSequence(heartsNumberCards + " " + heartsFaceCards)]
        
        XCTAssertEqual(sortedDeck.setSplit(CharacterSet((blackJoker + redJoker).unicodeScalars)), expectedResult)
        XCTAssertEqual(sortedDeck.setSplit(charactersIn: blackJoker + redJoker), expectedResult)

        let expectedResult2 = [String.SubSequence(spadesNumberCards + " " + spadesFaceCards), String.SubSequence(clubsNumberCards + " " + clubsFaceCards), String.SubSequence(redJoker + diamondsNumberCards + " " + diamondsFaceCards + redJoker + heartsNumberCards + " " + heartsFaceCards + redJoker)]

        XCTAssertEqual(sortedDeck.setSplit(CharacterSet(blackJoker.unicodeScalars)), expectedResult2)
        XCTAssertEqual(sortedDeck.setSplit(charactersIn: blackJoker), expectedResult2)

        let expectedResult3 = [String.SubSequence(blackJoker + spadesNumberCards + " " + spadesFaceCards + blackJoker + clubsNumberCards + " " + clubsFaceCards + blackJoker), String.SubSequence(diamondsNumberCards + " " + diamondsFaceCards), String.SubSequence(heartsNumberCards + " " + heartsFaceCards)]
        
        XCTAssertEqual(sortedDeck.setSplit(CharacterSet(redJoker.unicodeScalars)), expectedResult3)
        XCTAssertEqual(sortedDeck.setSplit(charactersIn: redJoker), expectedResult3)
        
        let expectedResult4 = [blackJoker + spadesNumberCards, spadesFaceCards + blackJoker + clubsNumberCards, clubsFaceCards + blackJoker + redJoker + diamondsNumberCards, diamondsFaceCards + redJoker + heartsNumberCards, heartsFaceCards + redJoker]
        
        XCTAssertEqual(sortedDeck.setSplit(CharacterSet(" ".unicodeScalars)).map { String($0) }, expectedResult4)
        XCTAssertEqual(sortedDeck.setSplit(charactersIn: " ").map { String($0) }, expectedResult4)
        
        let expectedResult5 = [String.SubSequence(blackJoker + spadesNumberCards), String.SubSequence(spadesFaceCards + blackJoker + clubsNumberCards), String.SubSequence(clubsFaceCards + blackJoker + redJoker + diamondsNumberCards), String.SubSequence(diamondsFaceCards + redJoker + heartsNumberCards), String.SubSequence(heartsFaceCards + redJoker)]
        XCTAssertEqual(sortedDeck.setSplit(CharacterSet(" ".unicodeScalars)), expectedResult5)
        XCTAssertEqual(sortedDeck.setSplit(charactersIn: " "), expectedResult5)
        
        let expectedResult6 = [String.SubSequence(spadesNumberCards), String.SubSequence(spadesFaceCards), String.SubSequence(clubsNumberCards), String.SubSequence(clubsFaceCards), String.SubSequence(diamondsNumberCards), String.SubSequence(diamondsFaceCards), String.SubSequence(heartsNumberCards), String.SubSequence(heartsFaceCards)]
        XCTAssertEqual(sortedDeck.setSplit(CharacterSet((" " + blackJoker + redJoker).unicodeScalars)), expectedResult6)
        XCTAssertEqual(sortedDeck.setSplit(charactersIn: " " + blackJoker + redJoker), expectedResult6)
    }
    
    /* ################################################################## */
    /**
     This tests the various substring methods of the extension.
     */
    func testSubstringFinder() {
        let testString = "Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.\nNow we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.\nBut, in a larger sense, we can not dedicate—we can not consecrate—we can not hallow—this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us—that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion—that we here highly resolve that these dead shall not have died in vain—that this nation, under God, shall have a new birth of freedom—and that government of the people, by the people, for the people, shall not perish from the earth."
        
        if let substringIndex = testString.index(of: "Four") {
            XCTAssertEqual(0, testString.distance(from: testString.startIndex, to: substringIndex))
        } else {
            XCTFail("Invalid Substring Response")
        }
        
        XCTAssertNil(testString.index(of: "Foor"), "Invalid Substring Response")
        XCTAssertTrue(testString.indexes(of: "Foor").isEmpty, "Invalid Substring Response")
        XCTAssertTrue(testString.ranges(of: "Foor").isEmpty, "Invalid Substring Response")

        if let substringIndex = testString.index(of: "score") {
            XCTAssertEqual(5, testString.distance(from: testString.startIndex, to: substringIndex))
        } else {
            XCTFail("Invalid Substring Response")
        }

        if let substringIndex = testString.endIndex(of: "score") {
            XCTAssertEqual(10, testString.distance(from: testString.startIndex, to: substringIndex))
        } else {
            XCTFail("Invalid Substring Response")
        }
        
        if let substringIndex = testString.index(of: "seven") {
            XCTAssertEqual(15, testString.distance(from: testString.startIndex, to: substringIndex))
        } else {
            XCTFail("Invalid Substring Response")
        }
        
        if let substringIndex = testString.endIndex(of: "seven") {
            XCTAssertEqual(20, testString.distance(from: testString.startIndex, to: substringIndex))
        } else {
            XCTFail("Invalid Substring Response")
        }

        if let substringIndex = testString.index(of: "we here highly resolve") {
            XCTAssertEqual(1224, testString.distance(from: testString.startIndex, to: substringIndex))
        } else {
            XCTFail("Invalid Substring Response")
        }
        
        let rangesOf1 = testString.ranges(of: "We")
        XCTAssertEqual(2, rangesOf1.count)
        XCTAssertEqual(309, testString.distance(from: testString.startIndex, to: rangesOf1[0].lowerBound))
        XCTAssertEqual(311, testString.distance(from: testString.startIndex, to: rangesOf1[0].upperBound))
        XCTAssertEqual(357, testString.distance(from: testString.startIndex, to: rangesOf1[1].lowerBound))
        XCTAssertEqual(359, testString.distance(from: testString.startIndex, to: rangesOf1[1].upperBound))

        let rangesOf2 = testString.ranges(of: "we")
        XCTAssertEqual(9, rangesOf2.count)
        XCTAssertEqual(181, testString.distance(from: testString.startIndex, to: rangesOf2[0].lowerBound))
        XCTAssertEqual(183, testString.distance(from: testString.startIndex, to: rangesOf2[0].upperBound))
        XCTAssertEqual(1224, testString.distance(from: testString.startIndex, to: rangesOf2[8].lowerBound))
        XCTAssertEqual(1226, testString.distance(from: testString.startIndex, to: rangesOf2[8].upperBound))
        
        let rangesOf3 = testString.ranges(of: "WE", options: [.caseInsensitive])
        XCTAssertEqual(11, rangesOf3.count)
        XCTAssertEqual(181, testString.distance(from: testString.startIndex, to: rangesOf3[0].lowerBound))
        XCTAssertEqual(183, testString.distance(from: testString.startIndex, to: rangesOf3[0].upperBound))
        XCTAssertEqual(1224, testString.distance(from: testString.startIndex, to: rangesOf3[10].lowerBound))
        XCTAssertEqual(1226, testString.distance(from: testString.startIndex, to: rangesOf3[10].upperBound))

        let rangesOf4 = testString.ranges(of: "w")
        XCTAssertEqual(26, rangesOf4.count)
        XCTAssertEqual(80, testString.distance(from: testString.startIndex, to: rangesOf4[0].lowerBound))
        XCTAssertEqual(81, testString.distance(from: testString.startIndex, to: rangesOf4[0].upperBound))
        XCTAssertEqual(1335, testString.distance(from: testString.startIndex, to: rangesOf4[25].lowerBound))
        XCTAssertEqual(1336, testString.distance(from: testString.startIndex, to: rangesOf4[25].upperBound))
        
        let indexesOf1 = testString.indexes(of: "We")
        XCTAssertEqual(2, indexesOf1.count)
        XCTAssertEqual(309, testString.distance(from: testString.startIndex, to: indexesOf1[0]))
        XCTAssertEqual(357, testString.distance(from: testString.startIndex, to: indexesOf1[1]))
        
        let indexesOf2 = testString.indexes(of: "we")
        XCTAssertEqual(9, indexesOf2.count)
        XCTAssertEqual(181, testString.distance(from: testString.startIndex, to: indexesOf2[0]))
        XCTAssertEqual(1224, testString.distance(from: testString.startIndex, to: indexesOf2[8]))
        
        let indexesOf3 = testString.indexes(of: "WE", options: [.caseInsensitive])
        XCTAssertEqual(11, rangesOf3.count)
        XCTAssertEqual(181, testString.distance(from: testString.startIndex, to: indexesOf3[0]))
        XCTAssertEqual(1224, testString.distance(from: testString.startIndex, to: indexesOf3[10]))
    }
    
    /* ################################################################## */
    /**
     This tests the ContiguousBytes extension.
     */
    func testContiguousBytes() {
        let originalIntArray = [Int8](arrayLiteral: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23)
        let data: Data = originalIntArray.withUnsafeBytes { .init($0) }

        XCTAssertEqual(originalIntArray.count / MemoryLayout<Int>.size, data.asIntArray.count)
        XCTAssertEqual(originalIntArray.count, data.asUInt8Array.count)
        XCTAssertEqual(originalIntArray.count / MemoryLayout<UInt16>.size, data.asUInt16Array.count)
        XCTAssertEqual(originalIntArray.count / MemoryLayout<UInt32>.size, data.asUInt32Array.count)
        XCTAssertEqual(originalIntArray.count / MemoryLayout<UInt64>.size, data.asUInt64Array.count)

        for index in (0..<originalIntArray.count) {
            XCTAssertEqual(UInt8(originalIntArray[index]), data.asUInt8Array[index])
        }

        XCTAssertEqual(0x0706050403020100, data.asIntArray[0])
        XCTAssertEqual(0x0F0E0D0C0B0A0908, data.asIntArray[1])
        XCTAssertEqual(0x1716151413121110, data.asIntArray[2])

        XCTAssertEqual(0x0100, data.asUInt16Array[0])
        XCTAssertEqual(0x0302, data.asUInt16Array[1])
        XCTAssertEqual(0x0504, data.asUInt16Array[2])
        XCTAssertEqual(0x0706, data.asUInt16Array[3])
        XCTAssertEqual(0x0908, data.asUInt16Array[4])
        XCTAssertEqual(0x0B0A, data.asUInt16Array[5])
        XCTAssertEqual(0x0D0C, data.asUInt16Array[6])
        XCTAssertEqual(0x0F0E, data.asUInt16Array[7])
        XCTAssertEqual(0x1110, data.asUInt16Array[8])
        XCTAssertEqual(0x1312, data.asUInt16Array[9])
        XCTAssertEqual(0x1514, data.asUInt16Array[10])
        XCTAssertEqual(0x1716, data.asUInt16Array[11])

        XCTAssertEqual(0x03020100, data.asUInt32Array[0])
        XCTAssertEqual(0x07060504, data.asUInt32Array[1])
        XCTAssertEqual(0x0B0A0908, data.asUInt32Array[2])
        XCTAssertEqual(0x0F0E0D0C, data.asUInt32Array[3])
        XCTAssertEqual(0x13121110, data.asUInt32Array[4])
        XCTAssertEqual(0x17161514, data.asUInt32Array[5])

        XCTAssertEqual(0x0706050403020100, data.asUInt64Array[0])
        XCTAssertEqual(0x0F0E0D0C0B0A0908, data.asUInt64Array[1])
        XCTAssertEqual(0x1716151413121110, data.asUInt64Array[2])
    }
    
    /* ################################################################## */
    /**
     This tests the ContiguousBytes extension, but with an odd number of elements, so the arrays are smaller.
     */
    func testContiguousBytesUnaligned() {
        let originalIntArray = [Int8](arrayLiteral: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22)
        let data: Data = originalIntArray.withUnsafeBytes { .init($0) }

        XCTAssertEqual(originalIntArray.count / MemoryLayout<Int>.size, data.asIntArray.count)
        XCTAssertEqual(originalIntArray.count, data.asUInt8Array.count)
        XCTAssertEqual(originalIntArray.count / MemoryLayout<UInt16>.size, data.asUInt16Array.count)
        XCTAssertEqual(originalIntArray.count / MemoryLayout<UInt32>.size, data.asUInt32Array.count)
        XCTAssertEqual(originalIntArray.count / MemoryLayout<UInt64>.size, data.asUInt64Array.count)

        for index in (0..<originalIntArray.count) {
            XCTAssertEqual(UInt8(originalIntArray[index]), data.asUInt8Array[index])
        }

        XCTAssertEqual(0x0706050403020100, data.asIntArray[0])
        XCTAssertEqual(0x0F0E0D0C0B0A0908, data.asIntArray[1])

        XCTAssertEqual(0x0100, data.asUInt16Array[0])
        XCTAssertEqual(0x0302, data.asUInt16Array[1])
        XCTAssertEqual(0x0504, data.asUInt16Array[2])
        XCTAssertEqual(0x0706, data.asUInt16Array[3])
        XCTAssertEqual(0x0908, data.asUInt16Array[4])
        XCTAssertEqual(0x0B0A, data.asUInt16Array[5])
        XCTAssertEqual(0x0D0C, data.asUInt16Array[6])
        XCTAssertEqual(0x0F0E, data.asUInt16Array[7])
        XCTAssertEqual(0x1110, data.asUInt16Array[8])
        XCTAssertEqual(0x1312, data.asUInt16Array[9])
        XCTAssertEqual(0x1514, data.asUInt16Array[10])

        XCTAssertEqual(0x03020100, data.asUInt32Array[0])
        XCTAssertEqual(0x07060504, data.asUInt32Array[1])
        XCTAssertEqual(0x0B0A0908, data.asUInt32Array[2])
        XCTAssertEqual(0x0F0E0D0C, data.asUInt32Array[3])
        XCTAssertEqual(0x13121110, data.asUInt32Array[4])

        XCTAssertEqual(0x0706050403020100, data.asUInt64Array[0])
        XCTAssertEqual(0x0F0E0D0C0B0A0908, data.asUInt64Array[1])
    }
}
