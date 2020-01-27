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
     This is the maskedValue() extension function test.
     */
    func testMask() {
        let targetTest = 3888 // 0xF30 (Value, in hex) 111100110000 (Value, in binary)
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
     */
    func testSimpleInstantiation() {
    }
}
