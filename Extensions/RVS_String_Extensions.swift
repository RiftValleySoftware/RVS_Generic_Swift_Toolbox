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

import Foundation   // Required for the NS stuff.

/* ###################################################################################################################################### */
// MARK: - StringProtocol Extension -
/* ###################################################################################################################################### */
/**
 These are a variety of cool String extensions that add some great extra cheese on the pizza.
 */
public extension StringProtocol {
    /* ################################################################## */
    /**
     - returns: the localized string (main bundle) for this string.
     */
    var localizedVariant: String {
        return NSLocalizedString(String(self), comment: "") // Need to force self into a String.
    }
    
    /* ################################################################## */
    /**
     From here: https://stackoverflow.com/q/24123518/879365, but modified from here: https://stackoverflow.com/a/55639723/879365
     - returns: an MD5 hash of the String
     */
    var md5: String {
        var hash = ""
        
        // Start by getting a C-style string of our string as UTF-8.
        if let str = self.cString(using: .utf8) {
            // This is a cast for the MD5 function. The convention attribute just says that it's a "raw" C function.
            typealias CC_MD5_Type = @convention(c) (UnsafeRawPointer, UInt32, UnsafeMutableRawPointer) -> UnsafeMutableRawPointer
            
            // This is a flag, telling the name lookup to happen in the global scope. No dlopen required.
            let RTLD_DEFAULT = UnsafeMutableRawPointer(bitPattern: -2)
            
            // This loads a function pointer with the CommonCrypto MD5 function.
            let CC_MD5 = unsafeBitCast(dlsym(RTLD_DEFAULT, "CC_MD5")!, to: CC_MD5_Type.self)
            
            // This is the length of the hash
            let CC_MD5_DIGEST_LENGTH = 16
            
            // This is where our MD5 hash goes. It's a simple 16-byte buffer.
            let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: CC_MD5_DIGEST_LENGTH)
            
            // Execute the MD5 hash. Save the result in our buffer.
            _ = CC_MD5(str, CUnsignedInt(str.count), result)
            
            // Turn it into a normal Swift String of hex digits.
            for i in 0..<CC_MD5_DIGEST_LENGTH {
                hash.append(String(format: "%02x", result[i]))
            }
            
            // Don't need this anymore.
            result.deallocate()
        }
        
        return hash
    }
    
    /* ################################################################## */
    /**
     - returns: The String, converted into an Array of hex strings (leading 0s, 1 8-bit character per element).
     */
    var hexDump8: [String] {
        var hexString = [String]()
        for char in self {
            for ch in char.utf8 {
                hexString.append(String(format: "%02x", ch))
            }
        }
        
        return hexString
    }
    
    /* ################################################################## */
    /**
     - returns: The String, converted into an Array of hex strings (leading 0s, 1 16-bit character per element).
     */
    var hexDump16: [String] {
        var hexString = [String]()
        for char in self {
            for ch in char.utf16 {
                hexString.append(String(format: "%04x", ch))
            }
        }
        
        return hexString
    }

    /* ################################################################## */
    /**
     This extension lets us uppercase only the first letter of the string (used for weekdays).
     From here: https://stackoverflow.com/a/28288340/879365
     
     - returns: The string, with only the first letter uppercased.
     */
    var firstUppercased: String {
        guard let first = self.first else { return "" }
        return String(first).uppercased() + self.dropFirst()
    }
    
    /* ################################################################## */
    /**
     The following computed property comes from this: http://stackoverflow.com/a/27736118/879365
     
     This extension function cleans up a URI string.
     
     - returns: a string, cleaned for URI.
     */
    var urlEncodedString: String? {
        let customAllowedSet =  CharacterSet.urlQueryAllowed
        if let ret = self.addingPercentEncoding(withAllowedCharacters: customAllowedSet) {
            return ret
        } else {
            return ""
        }
    }
    
    /* ################################################################## */
    /**
     The opposite of the above
     
     This extension function takes a URI-encoded String, and decodes it into a regular String.
     
     - returns: a string, restored from URI encoding.
     */
    var urlDecodedString: String? {
        if let ret = self.removingPercentEncoding {
            return ret
        } else {
            return ""
        }
    }
    
    /* ################################################################## */
    /**
     This simply strips out all non-binary characters in the string, leaving only valid binary digits.
     */
    var binaryOnly: String {
        let hexDigits = CharacterSet(charactersIn: "01")
        return String(self).filter {
            // The higher-order function stuff will convert each character into an aggregate integer, which then becomes a Unicode scalar. Very primitive, but shouldn't be a problem for us, as we only need a very limited ASCII set.
            if let cha = UnicodeScalar($0.unicodeScalars.map { $0.value }.reduce(0, +)) {
                return hexDigits.contains(cha)
            }
            
            return false
        }
    }
    
    /* ################################################################## */
    /**
     This simply strips out all non-octal characters in the string, leaving only valid octal digits.
     */
    var octalOnly: String {
        let hexDigits = CharacterSet(charactersIn: "01234567")
        return String(self).filter {
            // The higher-order function stuff will convert each character into an aggregate integer, which then becomes a Unicode scalar. Very primitive, but shouldn't be a problem for us, as we only need a very limited ASCII set.
            if let cha = UnicodeScalar($0.unicodeScalars.map { $0.value }.reduce(0, +)) {
                return hexDigits.contains(cha)
            }
            
            return false
        }
    }

    /* ################################################################## */
    /**
     This simply strips out all non-decimal characters in the string, leaving only valid decimal digits.
     */
    var decimalOnly: String {
        let hexDigits = CharacterSet(charactersIn: "0123456789")
        return String(self).filter {
            // The higher-order function stuff will convert each character into an aggregate integer, which then becomes a Unicode scalar. Very primitive, but shouldn't be a problem for us, as we only need a very limited ASCII set.
            if let cha = UnicodeScalar($0.unicodeScalars.map { $0.value }.reduce(0, +)) {
                return hexDigits.contains(cha)
            }
            
            return false
        }
    }

    /* ################################################################## */
    /**
     This simply strips out all non-hex characters in the string, leaving only valid, uppercased (forced) hex digits.
     */
    var hexOnly: String {
        let hexDigits = CharacterSet(charactersIn: "0123456789ABCDEF")
        // The uppercased() will convert us to a String. No need for a cast.
        return self.uppercased().filter {
            // The higher-order function stuff will convert each character into an aggregate integer, which then becomes a Unicode scalar. Very primitive, but shouldn't be a problem for us, as we only need a very limited ASCII set.
            if let cha = UnicodeScalar($0.unicodeScalars.map { $0.value }.reduce(0, +)) {
                return hexDigits.contains(cha)
            }
            
            return false
        }
    }

    /* ################################################################## */
    /**
     A fairly blunt-instrument hex digit pair-to-ASCII character converter. It isn't particularly intelligent.
     
     For example: "0x30313233" or "30 31 32 33" or "#30-31-32-33-H" or "30The 3132Quick Brown Fox Jumps Over the Lazy Doge33" all turn into "0123".
     
     - returns: The String, assumed to be hex numbers (two characters, 0-F, separated by non-hex characters, or not separated); converted to an ASCII string (no spaces).
                Nil, if the string failed to yeild a UTF8 value.
                This requires two characters (0-9a-fA-F), side-by-side for each character. They may or may not be separated.
     */
    var hex2UTF8: String! {
        var ret: String!

        if  let cast = self as? String {        // We need to be a regular String for this, as we'll be using NS stuff, and need the toll-free bridging.
            let asString = cast.uppercased()    // Force all text to be uppercased. Makes the regex simpler.
            if let regex = try? NSRegularExpression(pattern: #"[0-9A-Z]{2}"#, options: []) {    // Look for groups of 2 hex digits.
                let nsRange = NSRange(asString.startIndex..<asString.endIndex, in: asString)    // The search range will be the entire String.
                // We walk through the found matches (if any)
                regex.enumerateMatches(in: asString, options: [], range: nsRange) { (match, _, _) in
                    guard let match = match else {
                        return  // We doan' need no STEENKIN' MATCHES!
                    }
                    
                    // If we got here, we have at least one match (group of 2 digits). Walk through them by extracting the range (in the main String) of each match.
                    for rangeIndex in 0..<match.numberOfRanges {
                        if  let substrRange = Range(match.range(at: rangeIndex), in: asString), // Get a Range, describing the portion of the main string, in a Range relevant to the main String.
                            let asInt = Int(asString[substrRange], radix: 16),  // Convert that to a standard numerical Int.
                            let scalar = UnicodeScalar(asInt) { // Convert that back to a UTF8 character.
                            ret = nil == ret ? String(scalar) : ret + String(scalar)
                        }
                    }
                }
            }
        }
        
        return ret
    }
    
    /* ################################################################## */
    /**
     Another fairly brute-force simple parser.
     This computed property will return an Int, extracted from the String, if the String is a Hex number.
     It will return nil, if the number cannot be extracted.
     For example, "20" would return 32, "F100" will return 61696, and "3" will return 3. "G" would return nil, but "George" would return 238 ("EE").
     */
    var hex2Int: Int! {
        let workingString = self.hexOnly.reversed()    // Make sure that we are a "pure" hex string, and we'll reverse it, as we will be crawling through the string as powers of 16
        var ret: Int! = nil
        var shift = 0
        // We crawl through, one character at a time, and use a radix of 16 (hex).
        for char in workingString {
            // The character needs to be cast into a String.
            if let val = Int(String(char), radix: 16) {
                ret = (ret ?? 0) + (val << shift)
                shift += 4
            }
        }
        return ret
    }
}

/* ###################################################################################################################################### */
// MARK: - StringProtocol Extension For Strings -
/* ###################################################################################################################################### */
/**
 This extension will allow searching and indexing substrings. It comes straight from here: https://stackoverflow.com/a/32306142/879365
 */
public extension StringProtocol where Index == String.Index {
    /* ################################################################## */
    /**
     This allows us to find the first index of a substring.
     
     - parameter of: The substring we're looking for.
     - parameter options: The String options for the search.
     
     - returns: The index of the first occurrence. Nil, if does not occur.
     */
    func index(of inString: Self, options inOptions: String.CompareOptions = []) -> Index? {
        return range(of: inString, options: inOptions)?.lowerBound
    }

    /* ################################################################## */
    /**
     This allows us to find the last index of a substring.
     
     - parameter of: The substring we're looking for.
     - parameter options: The String options for the search.
     
     - returns: The index of the last occurrence. Nil, if does not occur.
     */
    func endIndex(of inString: Self, options inOptions: String.CompareOptions = []) -> Index? {
        return range(of: inString, options: inOptions)?.upperBound
    }
    
    /* ################################################################## */
    /**
     This returns an Array of indexes that map all the occurrences of a given substring.
     
     - parameter of: The substring we're looking for.
     - parameter options: The String options for the search.
     
     - returns: an Array, containing the indexes of each occurrence. Empty Array, if does not occur.
     */
    func indexes(of inString: Self, options inOptions: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        
        while start < endIndex, let range = self[start..<endIndex].range(of: inString, options: inOptions) {
            result.append(range.lowerBound)
            start = range.lowerBound < range.upperBound ? range.upperBound: index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        
        return result
    }
    
    /* ################################################################## */
    /**
     This returns an Array of Index Ranges that map all the occurrences of a given substring.
     
     - parameter of: The substring we're looking for.
     - parameter options: The String options for the search.
     
     - returns: an Array, containing the Ranges that map each occurrence. Empty Array, if does not occur.
     */
    func ranges(of inString: Self, options inOptions: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while start < endIndex,
            let range = self[start..<endIndex].range(of: inString, options: inOptions) {
                result.append(range)
                start = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
