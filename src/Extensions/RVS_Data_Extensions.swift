/**
© Copyright 2019-2020, The Great Rift Valley Software Company

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
 
Version: 1.0.4
*/

import Foundation

/* ###################################################################################################################################### */
// MARK: - Data Extension -
/* ###################################################################################################################################### */
/**
 This extension adds the ability to extract data from a Data instance, cast into various types.
 */
public extension Data {
    /* ################################################################## */
    /**
     This method allows a Data instance to be cast into various standard types.
     
     - parameter inValue: This is an inout parameter, and the type will be used to determine the cast.
     - returns: the cast value (the parameter will also be set to the cast value). Can be ignored.
     */
    @discardableResult
    mutating func castInto<T>(_ inValue: inout T) -> T {
        // Makes sure that we don't try to read past the end of the data.
        let len = Swift.min(MemoryLayout<T>.size, self.count)
        _ = Swift.withUnsafeMutableBytes(of: &inValue) {
            self.copyBytes(to: $0, from: 0..<len)
        }
        
        return inValue
    }
}
