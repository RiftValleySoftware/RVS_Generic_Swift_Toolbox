/**
© Copyright 2019, The Great Rift Valley Software Company

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
*/

import XCTest

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
}

/* ###################################################################################################################################### */
// MARK: - NSLocalizedString Override -
/* ###################################################################################################################################### */
/**
 We override this, because we are running a test, so the bundle is in the XCTest bundle. We override this to intercept the standard call, and reference the testing bundle.
 
 - parameters:
    - inKey: The String we are using to key the token.
    - comment: Ignored
 
 - returns: The localized String (if the key matches).
 */
public func NSLocalizedString(_ inKey: String, comment: String) -> String {
    let bundle = Bundle(for: RVS_String_Extensions_Tests.self)
    return NSLocalizedString(inKey, tableName: nil, bundle: bundle, comment: "")
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
     Test our localizedVariant computed property.
     */
    func testLocalizedVariant() {
        XCTAssertEqual("Test String 1", "TEST-1-SLUG".localizedVariant)
        XCTAssertEqual("Test String Two", "TEST-2-SLUG".localizedVariant)
    }
    
    /* ################################################################## */
    /**
     Test our md5 computed property.
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
     Test our md5 computed property.
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
}
