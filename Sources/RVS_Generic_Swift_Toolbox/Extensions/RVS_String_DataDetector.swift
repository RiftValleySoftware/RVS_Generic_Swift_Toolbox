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
 
Version: 1.6.0
*/

import Foundation

/* ###################################################################################################################################### */
// MARK: - StringProtocol Extension for Data Detector -
/* ###################################################################################################################################### */
/**
 This adds a data detctor to the basic String type.
 */
public extension String {
    /* ################################################################################################################################## */
    // MARK: - Detected Data Wrapper Type -
    /* ################################################################################################################################## */
    /**
     */
    struct DetectedDataURL {
        /* ################################################################## */
        /**
         */
        public let detectedData: URL
        
        /* ################################################################## */
        /**
         */
        public let range: Range<String.Index>
        
        /* ################################################################## */
        /**
         */
        init(detectedData inDetectedData: URL, range inRange: Range<String.Index>) {
            detectedData = inDetectedData
            range = inRange
        }
    }
    
    /* ################################################################## */
    /**
     */
    var detectedURIs: [DetectedDataURL] {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue + NSTextCheckingResult.CheckingType.phoneNumber.rawValue) else { return [] }

        var ret = [DetectedDataURL]()
        
        detector.matches(in: self, options: [], range: NSRange(location: 0, length: utf16.count)).forEach {
            if let range = Range($0.range, in: self),
               let url = URL(string: String(self[range])) {
                ret.append(DetectedDataURL(detectedData: url, range: range))
            }
        }
        
        return ret
    }
}
