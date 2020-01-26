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
// MARK: - RVS_FIFOQueue_Tests -
/* ###################################################################################################################################### */
/**
 These are specific unit tests for the RVS_FIFOQueue struct.
 */
class RVS_FIFOQueue_Tests: XCTestCase {
    /* ################################################################## */
    /**
     Just tests the simple creation of the class instance, and stores and removes an element in order to assure type.
     */
    func testSimpleInstantiation() {
        var testTarget = RVS_FIFOQueue<Int>()
        XCTAssertEqual(0, testTarget.count)
        testTarget.enqueue(10)
        XCTAssertEqual(1, testTarget.count)
        let val = testTarget.dequeue()
        XCTAssertEqual(0, testTarget.count)
        XCTAssertEqual(10, val)
    }
}
