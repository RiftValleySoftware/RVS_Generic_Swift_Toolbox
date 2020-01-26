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
     Just tests the simple creation of the class instance, and stores and removes some elements in order to assure type.
     */
    func testSimpleInstantiation() {
        var testTargetInt = RVS_FIFOQueue<Int>()
        XCTAssertEqual(0, testTargetInt.count)
        testTargetInt.enqueue(10)
        XCTAssertEqual(1, testTargetInt.count)
        let valueInt = testTargetInt.dequeue()
        XCTAssertEqual(0, testTargetInt.count)
        XCTAssertEqual(10, valueInt)
        
        var testTargetIntArray = RVS_FIFOQueue<Int>()
        XCTAssertEqual(0, testTargetIntArray.count)
        testTargetIntArray.enqueue([0, 1])
        XCTAssertEqual(2, testTargetIntArray.count)
        testTargetIntArray.enqueue(2)
        XCTAssertEqual(3, testTargetIntArray.count)
        var valueIntArray = testTargetIntArray.dequeue()
        XCTAssertEqual(2, testTargetIntArray.count)
        XCTAssertEqual(0, valueIntArray)
        valueIntArray = testTargetIntArray.dequeue()
        XCTAssertEqual(1, testTargetIntArray.count)
        XCTAssertEqual(1, valueIntArray)
        valueIntArray = testTargetIntArray.dequeue()
        XCTAssertEqual(0, testTargetIntArray.count)
        XCTAssertEqual(2, valueIntArray)

        var testTargetString = RVS_FIFOQueue<String>()
        XCTAssertEqual(0, testTargetString.count)
        testTargetString.enqueue("HI HOWAYA")
        XCTAssertEqual(1, testTargetString.count)
        let valueString = testTargetString.dequeue()
        XCTAssertEqual(0, testTargetString.count)
        XCTAssertEqual("HI HOWAYA", valueString)
        
        var testTargetStringArray = RVS_FIFOQueue<String>()
        XCTAssertEqual(0, testTargetStringArray.count)
        testTargetStringArray.enqueue(["HI HOWAYA", "IM FINE"])
        XCTAssertEqual(2, testTargetStringArray.count)
        testTargetStringArray.enqueue("HOWRU")
        var valueStringArray = testTargetStringArray.dequeue()
        XCTAssertEqual(2, testTargetStringArray.count)
        XCTAssertEqual("HI HOWAYA", valueStringArray)
        valueStringArray = testTargetStringArray.dequeue()
        XCTAssertEqual(1, testTargetStringArray.count)
        XCTAssertEqual("IM FINE", valueStringArray)
        valueStringArray = testTargetStringArray.dequeue()
        XCTAssertEqual(0, testTargetStringArray.count)
        XCTAssertEqual("HOWRU", valueStringArray)
    }
}
