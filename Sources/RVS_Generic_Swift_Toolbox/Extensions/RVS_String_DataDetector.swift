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
// MARK: - Protocol for the URLs that we will produce. -
/* ###################################################################################################################################### */
/**
 */
public protocol RVS_String_DataDetectorURLProtocol {
    /* ################################################################## */
    /**
     */
    var url: URL? { get set }
    
    /* ################################################################## */
    /**
     */
    init(_: URL)
}

/* ###################################################################################################################################### */
// MARK: - Extension of the standard URL type, to conform to us. -
/* ###################################################################################################################################### */
/**
 The reason that we do this, is so that we can use regular URLs for our listings, if we want.
 */
extension URL: RVS_String_DataDetectorURLProtocol {
    /* ################################################################## */
    /**
     */
    public init(_ inURL: URL) {
        self = inURL
    }
    
    /* ################################################################## */
    /**
     */
    public var url: URL? {
        get { self }
        set { if let url = newValue {
                self = url
            }
        }
    }
}

/* ###################################################################################################################################### */
// MARK: - Detected Data Wrapper Type -
/* ###################################################################################################################################### */
/**
 */
public struct RVS_String_DataDetectorURL_DetectedDataURL: RVS_String_DataDetectorURLProtocol, Hashable {
    /* ################################################################################################################################## */
    // MARK: - Detected Data Type Enum -
    /* ################################################################################################################################## */
    /**
     */
    public enum DetectedURLType {
        /// No URL. This is basically an error codition
        case none
        
        /// HTTP or SSL URL
        case http(_: URL)
        
        /// Phone Number URL
        case phone(_: URL)
        
        /// All other types of URL
        case app(_: URL)
    }

    /* ############################################################## */
    /**
     */
    public var urlType: DetectedURLType {
        guard let url = url else { return .none }
        
        if url.scheme?.lowercased().starts(with: "http") ?? false {
            return .http(url)
        } else if "tel" == url.scheme?.lowercased() {
            return .phone(url)
        } else {
            return .app(url)
        }
    }
    
    /* ############################################################## */
    /**
     */
    public let range: Range<String.Index>?

    /* ############################################################## */
    /**
     */
    public init(phoneNumber inPhoneNumber: String, range inRange: Range<String.Index>? = nil) {
        range = inRange
    }

    /* ############################################################## */
    /**
     */
    public init(url inDetectedURLAsString: String, range inRange: Range<String.Index>? = nil) {
        url = URL(string: inDetectedURLAsString)
        range = inRange
    }

    /* ############################################################## */
    /**
     */
    public init(url inDetectedURL: URL, range inRange: Range<String.Index>? = nil) {
        url = inDetectedURL
        range = inRange
    }

    /* ############################################################################################################################## */
    // MARK: - RVS_String_DataDetectorURLProtocol Conformance -
    /* ############################################################################################################################## */
    /* ############################################################## */
    /**
     */
    public var url: URL?
    
    /* ############################################################## */
    /**
     */
    public init(_ inURL: URL) {
        self.init(url: inURL, range: nil)
    }
    
    /* ############################################################################################################################## */
    // MARK: - Equatable Conformance -
    /* ############################################################################################################################## */
    /* ############################################################## */
    /**
     */
    public static func == (lhs: RVS_String_DataDetectorURL_DetectedDataURL, rhs: RVS_String_DataDetectorURL_DetectedDataURL) -> Bool { lhs.url == rhs.url }

    /* ############################################################################################################################## */
    // MARK: - Hashable Conformance -
    /* ############################################################################################################################## */
    /* ############################################################## */
    /**
     */
    public func hash(into hasher: inout Hasher) { hasher.combine(url) }
}

/* ###################################################################################################################################### */
// MARK: - StringProtocol Extension for Data Detector -
/* ###################################################################################################################################### */
/**
 This adds a data detctor to the basic String type.
 */
public extension String {
    /* ################################################################## */
    /**
     */
    var detectedURIs: [RVS_String_DataDetectorURL_DetectedDataURL] {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue + NSTextCheckingResult.CheckingType.phoneNumber.rawValue) else { return [] }

        var ret = [RVS_String_DataDetectorURL_DetectedDataURL]()
        
        detector.matches(in: self, options: [], range: NSRange(location: 0, length: utf16.count)).forEach {
            if let range = Range($0.range, in: self),
               let url = URL(string: String(self[range])) {
                ret.append(RVS_String_DataDetectorURL_DetectedDataURL(url: url, range: range))
            }
        }
        
        return ret
    }
}
