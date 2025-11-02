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
 
 Version 1.16.0
 */

import XCTest
import RVS_Generic_Swift_Toolbox

class RVS_IPAddress_Tests: XCTestCase {
    static let stringTestSetV4: [(in: String?, out: String?, padded: Bool)] = [
        (in: "1.1.1.1", out: "1.1.1.1", padded: false),
        (in: "0.0.0.0", out: "0.0.0.0", padded: false),
        (in: "0.0.0.1", out: "0.0.0.1", padded: false),
        (in: "0.0.1.2", out: "0.0.1.2", padded: false),
        (in: "0.1.2.3", out: "0.1.2.3", padded: false),
        (in: "1.2.3.4", out: "1.2.3.4", padded: false),
        (in: "2.3.4.5", out: "2.3.4.5", padded: false),
        (in: "3.4.5.6", out: "3.4.5.6", padded: false),
        (in: "4.5.6.7", out: "4.5.6.7", padded: false),
        (in: "5.6.7.8", out: "5.6.7.8", padded: false),
        (in: "6.7.8.9", out: "6.7.8.9", padded: false),
        (in: "7.8.9.0", out: "7.8.9.0", padded: false),
        (in: "8.9.0.0", out: "8.9.0.0", padded: false),
        (in: "9.0.0.0", out: "9.0.0.0", padded: false),
        (in: "128.128.128.128", out: "128.128.128.128", padded: false),
        (in: "255.255.255.255", out: "255.255.255.255", padded: false),
        (in: "256.256.256.256", out: nil, padded: false),
        (in: "255.256.255.255", out: nil, padded: false),
        (in: "0.0.0.255", out: "0.0.0.255", padded: false),
        (in: "256.0.0.0", out: nil, padded: false),
        (in: "0.256.0.0", out: nil, padded: false),
        (in: "0.0.256.0", out: nil, padded: false),
        (in: "0.0.0.256", out: nil, padded: false),
        (in: "0.65535.0.0", out: nil, padded: false),
        (in: "a.b.c.d", out: nil, padded: false),
        (in: "2.0.0.-2", out: nil, padded: false),
        (in: "-1.0.0.1", out: nil, padded: false),
        (in: "IP Address: 1.2.3.4", out: nil, padded: false),
        (in: "2.3.4", out: nil, padded: false),
        (in: "1.2.3.4:1", out: "1.2.3.4:1", padded: false),
        (in: "0.1.2.3:1234567890", out: "0.1.2.3:1234567890", padded: false),
        (in: "0.1.2.3:0", out: "0.1.2.3", padded: false),
        (in: "000.001.002.003:0000000000000100", out: "0.1.2.3:100", padded: false),
        (in: "0.0.0.0:23", out: "0.0.0.0:23", padded: false),
        (in: ":23", out: nil, padded: false),
        (in: "42:", out: nil, padded: false),
        (in: "Leviticus 15:33", out: nil, padded: false),
        (in: "  \t 0.0.0.0:23\n ", out: "0.0.0.0:23", padded: false)
    ]
    
    static let stringTestSetV6: [(in: String?, out: String?, padded: Bool)] = [
        (in: "1:1:1:1:1:1:1:1", out: "1:1:1:1:1:1:1:1", padded: false),
        (in: "1:1:1:1:1:1:1:1", out: "0001:0001:0001:0001:0001:0001:0001:0001", padded: true),
        (in: "1:0:0:0:0:0:0:1", out: "1::1", padded: false),
        (in: "1:0:0:1:0:0:0:1", out: "1:0:0:1::1", padded: false),
        (in: "1:0:0:0:1:0:0:1", out: "1::1:0:0:1", padded: false),
        (in: "1::1", out: "0001:0000:0000:0000:0000:0000:0000:0001", padded: true),
        (in: "::", out: "0000:0000:0000:0000:0000:0000:0000:0000", padded: true),
        (in: "1::", out: "0001:0000:0000:0000:0000:0000:0000:0000", padded: true),
        (in: "::", out: "::", padded: false),
        (in: "::", out: "::", padded: false),
        (in: "0::0000", out: "::", padded: false),
        (in: "0:0:0000::", out: "::", padded: false),
        (in: "f:0:0000::", out: "f::", padded: false),
        (in: "1:0:0::0", out: "1::", padded: false),
        (in: "1:2::", out: "1:2::", padded: false),
        (in: "1:2::0", out: "1:2::", padded: false),
        (in: "1:2:0::", out: "1:2::", padded: false),
        (in: "1:2:0::0", out: "1:2::", padded: false),
        (in: "::1", out: "::1", padded: false),
        (in: "0::0:1", out: "::1", padded: false),
        (in: "::1", out: "0000:0000:0000:0000:0000:0000:0000:0001", padded: true),
        (in: "::1:2", out: "::1:2", padded: false),
        (in: "::1:2", out: "0000:0000:0000:0000:0000:0000:0001:0002", padded: true),
        (in: "1:0:2:a:cdef:0:0:0", out: "1:0:2:a:cdef::", padded: false),
        (in: "1:0:2:a:cdef:0:0:0", out: "0001:0000:0002:000a:cdef:0000:0000:0000", padded: true),
        (in: "1:0:2:a:cdef:0:3:0", out: "1:0:2:a:cdef:0:3:0", padded: false),
        (in: "1:0:2:a:cdef:0:3:0", out: "0001:0000:0002:000a:cdef:0000:0003:0000", padded: true),
        (in: "0001:0000:0002:000a:cdef:0000:0003:0000", out: "1:0:2:a:cdef:0:3:0", padded: false),
        (in: "0001:0000:0002:000a:cdef:0000:0000:0000", out: "1:0:2:a:cdef::", padded: false),
        (in: "aaa0:0b0b:6f4e:0:0:8621:0:0", out: "aaa0:b0b:6f4e::8621:0:0", padded: false),
        (in: "aaa0:0b0b:6f4e:0:0:8621::", out: "aaa0:b0b:6f4e::8621:0:0", padded: false),
        (in: "aaa0:0b0b:0:0:0:8621::", out: "aaa0:b0b::8621:0:0", padded: false),
        (in: "aaa0::0:0:0:8621:0:0", out: "aaa0::8621:0:0", padded: false),
        (in: "AAA0::0:0:0:FF21:0:0", out: "aaa0::ff21:0:0", padded: false),
        (in: "aaa0:0b0b:6f4e:0:0:8621:0:0", out: "aaa0:0b0b:6f4e:0000:0000:8621:0000:0000", padded: true),
        (in: "aaa0:0b0b:6f4e:0:0:86210:0:0", out: nil, padded: true),
        (in: "A:0b0b:6f4E:0:0:8621:0:0", out: "a:b0b:6f4e::8621:0:0", padded: false),
        (in: "-A:0b0b:6f4E:0:0:8621:0:0", out: nil, padded: true),
        (in: "[1:0:0:0:1:0:0:1]:1024", out: "[1::1:0:0:1]:1024", padded: false),
        (in: "[1:1:1:1:1:1:1:1]:23", out: "[1:1:1:1:1:1:1:1]:23", padded: false),
        (in: "[1:1:1:1:1:1:1:1:23", out: nil, padded: false),
        (in: "1:1:1:1:1:1:1:1]:23", out: nil, padded: false),
        (in: "[1:1:1:1:1:1:1:1:23]", out: nil, padded: false),
        (in: "[::]", out: "::", padded: false),
        (in: "[::]", out: "0000:0000:0000:0000:0000:0000:0000:0000", padded: true),
        (in: "[::]:23", out: "[0000:0000:0000:0000:0000:0000:0000:0000]:23", padded: true),
        (in: "[0:1:0::]", out: "0:1::", padded: false),
        (in: "[::]:23", out: "[::]:23", padded: false),
        (in: "[::]:0000000000000023", out: "[::]:23", padded: false),
        (in: "[0000:0000:0000:0000:0000:0000:0000:0000]:23", out: "[::]:23", padded: false),
        (in: "[FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]:65535", out: "[ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff]:65535", padded: false),
        (in: "[FFFF:ffff:FFFF:ffff:FFFF:ffff:FFFF:ffff]:65535", out: "[ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff]:65535", padded: false),
        (in: "[FFFF:0:0000:ffff]:65535", out: nil, padded: false),
        (in: "  \t [FFFF:0::0000:ffff]:65535 \t\n\t", out: "[ffff::ffff]:65535", padded: false)
    ]
    
    static let arrayTestIPv4: [(inputArray: [Int]?, port: Int?, out: String?, padded: Bool)] = [
        (inputArray: [1, 1, 1, 1], port: 0, out: "1.1.1.1", padded: false),
        (inputArray: [0, 0, 0, 0], port: 0, out: "0.0.0.0", padded: false),
        (inputArray: [0, 0, 0, 0], port: 23, out: "0.0.0.0:23", padded: false),
        (inputArray: [0, 0, 0, 1], port: 0, "0.0.0.1", padded: false),
        (inputArray: [0, 0, 1, 2], port: 1, "0.0.1.2:1", padded: false),
        (inputArray: [0, 1, 2, 3], port: 2, "0.1.2.3:2", padded: false),
        (inputArray: [1, 2, 3, 4], port: 3, "1.2.3.4:3", padded: false),
        (inputArray: [2, 3, 4, 5], port: 4, "2.3.4.5:4", padded: false),
        (inputArray: [3, 4, 5, 6], port: 5, "3.4.5.6:5", padded: false),
        (inputArray: [4, 5, 6, 7], port: 6, "4.5.6.7:6", padded: false),
        (inputArray: [5, 6, 7, 8], port: 7, "5.6.7.8:7", padded: false),
        (inputArray: [6, 7, 8, 9], port: 8, "6.7.8.9:8", padded: false),
        (inputArray: [7, 8, 9, 0], port: 9, "7.8.9.0:9", padded: false),
        (inputArray: [8, 9, 0, 0], port: 0, "8.9.0.0", padded: false),
        (inputArray: [9, 0, 0, 0], port: 0, "9.0.0.0", padded: false),
        (inputArray: [], port: 23, out: nil, padded: false),
        (inputArray: [0, 0, 256, 0], port: 0, out: nil, padded: false),
        (inputArray: [0, 0, 0, 0, 0], port: 23, out: nil, padded: false),
        (inputArray: [0, 0, 0], port: 23, out: nil, padded: false),
        (inputArray: [255, 255, 255, 255], port: 255, out: "255.255.255.255:255", padded: false),
        (inputArray: [0xFF, 0xFF, 0xFF, 0xFF], port: 0xFF, out: "255.255.255.255:255", padded: false)
    ]
    
    static let arrayTestIPv6: [(inputArray: [Int]?, port: Int?, out: String?, padded: Bool)] = [
        (inputArray: [1, 1, 1, 1, 1, 1, 1, 1], port: 0, out: "1:1:1:1:1:1:1:1", padded: false),
        (inputArray: [0, 0, 0, 0, 0, 0, 0, 0], port: 0, out: "::", padded: false),
        (inputArray: [0, 0, 0, 0, 0, 0, 0, 0], port: 0, out: "0000:0000:0000:0000:0000:0000:0000:0000", padded: true),
        (inputArray: [0, 0, 0, 0, 0, 0, 0, 0], port: 23, out: "[0000:0000:0000:0000:0000:0000:0000:0000]:23", padded: true),
        (inputArray: [0, 0, 0, 0, 0, 0, 0, 0], port: 23, out: "[::]:23", padded: false),
        (inputArray: [0, 0, 0, 0, 0, 0, 0, 0], port: 23, out: "[0000:0000:0000:0000:0000:0000:0000:0000]:23", padded: true),
        (inputArray: [0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF], port: 0xFFFF, out: "[ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff]:65535", padded: true),
        (inputArray: [65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535], port: 0, out: "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", padded: true),
        (inputArray: [0, 0, 0, 0, 0, 0, 0], port: 23, out: nil, padded: true)
    ]

    func runIPTestsFromStrings(_ inTestSet: [(in: String?, out: String?, padded: Bool)]) {
        inTestSet.forEach {
            print("Comparing \(String(describing: $0))")
            if let inputString = $0.in, let outputString = $0.out {
                if let testIP = RVS_IPAddressExtractIPAddress(inputString, isPadded: $0.padded) {
                    XCTAssertFalse(testIP.isEmpty, "Should not be empty!")
                    XCTAssertTrue(testIP.isValidAddress, "Returns invalid valid!")
                    XCTAssertEqual(testIP.addressAndPort, outputString, "Unexpected Output")
                } else {
                    XCTFail("Unexpected Nil!")
                }
            } else if nil == $0.out, let inputString = $0.in {
                let testString = RVS_IPAddressExtractIPAddress(inputString, isPadded: $0.padded)
                XCTAssertNil(testString, "This should be nil")
            } else {
                XCTFail("BAD TEST SET!")
            }
        }
    }
    
    func runIPTestsFromArrays(_ inTestSet: [(inputArray: [Int]?, port: Int?, out: String?, padded: Bool)]) {
        inTestSet.forEach {
            print("Comparing \(String(describing: $0))")
            if let inputArray = $0.inputArray, let outputString = $0.out, let port = $0.port {
                if let testIP = RVS_IPAddressExtractIPAddress(array: inputArray, port: port, isPadded: $0.padded) {
                    XCTAssertTrue(testIP.isValidAddress, "Returns invalid valid!")
                    XCTAssertEqual(testIP.addressAndPort, outputString, "Unexpected Output")
                } else {
                    XCTFail("Unexpected Nil!")
                }
            } else if nil == $0.out, let inputArray = $0.inputArray, let port = $0.port {
                let testString = RVS_IPAddressExtractIPAddress(array: inputArray, port: port, isPadded: $0.padded)
                XCTAssertNil(testString, "This should be nil")
            } else {
                XCTFail("BAD TEST SET!")
            }
        }
    }

    func testIPV4() {
        runIPTestsFromStrings(type(of: self).stringTestSetV4)
        runIPTestsFromArrays(type(of: self).arrayTestIPv4)
        XCTAssertFalse("0.1.2.3".ipAddress?.isV6 ?? true, "Should not be V6!")
        XCTAssertTrue("0.1.2.3".ipAddress?.isValidAddress ?? false, "Should be Valid!")
        XCTAssertEqual("0.1.2.3".ipAddress?.addressArray, [0,1,2,3])
        XCTAssertNil("".ipAddress?.addressArray)
        XCTAssertNil("256.1.2.3".ipAddress?.addressArray)
        if var testAddress = "0.1.2.3".ipAddress {
            testAddress.addressArray = [257,257,257,257]
            XCTAssertTrue(testAddress.addressArray.isEmpty)
        } else {
            XCTFail("Bad Address!")
        }
    }

    func testIPV6() {
        runIPTestsFromStrings(type(of: self).stringTestSetV6)
        runIPTestsFromArrays(type(of: self).arrayTestIPv6)
        XCTAssertEqual("[::]".ipAddress?.addressArray, [0,0,0,0,0,0,0,0])
        XCTAssertTrue("[::]".ipAddress?.isValidAddress ?? false, "Should be Valid!")
        XCTAssertTrue("[::]".ipAddress?.isV6 ?? false, "Should be V6!")
        XCTAssertNotNil("::".ipAddress?.addressArray)
        XCTAssertNil("65536::".ipAddress?.addressArray)
        if var testAddress = "0.1.2.3".ipAddress {
            testAddress.addressArray = [0,0,0,-1,0,0,0,0]
            XCTAssertTrue(testAddress.addressArray.isEmpty)
        } else {
            XCTFail("Bad Address!")
        }
        let iPv6 = RVS_IPAddressV6([0, 1, 2, 3])
        print(iPv6)
    }
}
