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

/* ###################################################################################################################################### */
// MARK: - Int Extension -
/* ###################################################################################################################################### */
/**
 These are a variety of cool Int extensions that add some great extra cheese on the pizza.
 */
public extension UInt {
    /* ################################################################## */
    /**
     This method allows us to mask a discrete bit range within the number, and return its value as a basic Int.
     For example, if we have the hex number 0xF30 (3888 decimal, or 111100110000 binary), we can mask parts of it to get masked values, like so:
     ```
        // 111100110000 (Value, in binary)
     
        // 111111111111 (Mask, in binary)
        let wholeValue = 3888.maskedValue(firstPlace: 0, runLength: 12)     // Returns 3888
        // 111111110000
        let lastByte = 3888.maskedValue(firstPlace: 4, runLength: 8)        // Returns 243
        // 000000000011
        let lowestTwoBits = 3888.maskedValue(firstPlace: 0, runLength: 2)   // Returns 0
        // 000000111100
        let middleTwelve = 3888.maskedValue(firstPlace: 2, runLength: 4)    // Returns 12
        // 000111100000
        let middleNine = 3888.maskedValue(firstPlace: 5, runLength: 4)      // Returns 9
        // 011111111111
        let theFirstElevenBits = 3888.maskedValue(firstPlace: 0, runLength: 11) // Returns 1840
        // 111111111110
        let theLastElevenBits = 3888.maskedValue(firstPlace: 1, runLength: 11)  // Returns 1944
        // 000000110000
        let lowestTwoBitsOfTheSecondHalfOfTheFirstByte = 3888.maskedValue(firstPlace: 4, runLength: 2)          // Returns 3
        // 000001100000
        let secondToLowestTwoBitsOfTheSecondHalfOfTheFirstByte = 3888.maskedValue(firstPlace: 5, runLength: 2)  // Returns 1
        // 000011000000
        let thirdFromLowestTwoBitsOfTheSecondHalfOfTheFirstByte = 3888.maskedValue(firstPlace: 6, runLength: 2) // Returns 0
     ```
     This is BIT-based, not BYTE-based, and assumes the number is in a linear (bigendian) format, in which the least significant bit is the rightmost one (position one).
     In reality, this doesn't matter, as the language takes care of transposing byte order.
     
     The value of the Int must be positive. It is declared as an Int, in order to provide as much flexibility as possible.
     The parameters must be positive, but are declared as signed Int, in order to be as flexible as possible.
     
     - parameters:
        - firstPlace: The 1-based (1 is the first bit) starting position for the mask. Must be a positive integer.
        - runLength: The inclusive (includes the starting place) number of bits to mask. Must be a positive integer. If 0, then the return will always be 0.
     
     - returns: An Unsigned Int, with the masked value.
     */
    func maskedValue(firstPlace inFirstPlace: UInt, runLength inRunLength: UInt) -> UInt {
        let maxRunLength = (MemoryLayout<Self>.size * 8)
        precondition((inFirstPlace + inRunLength) <= maxRunLength, "Requested Mask is Out of Bounds")
        guard 0 < inRunLength else { return 0 }   // Shortcut, if they aren't looking for anything.
        // We create a mask, starting at bit one, then shift our value down to fit that mask.
        // We do the crazy ternary operator stuff, because the library can't really do our shortcut for the top byte.
        let mask = UInt64(0xFFFFFFFFFFFFFFFF) >> (UInt64(maxRunLength) - UInt64(inRunLength))
        let shifted = UInt(self >> inFirstPlace)
        return shifted & UInt(mask)
    }
}

/* ###################################################################################################################################### */
// MARK: - Int Extension -
/* ###################################################################################################################################### */
/**
 These are a variety of cool Int extensions that add some great extra cheese on the pizza.
 */
public extension Int {
    /* ################################################################## */
    /**
     This method allows us to mask a discrete bit range within the number, and return its value as a basic Int.
     For example, if we have the hex number 0xF30 (3888 decimal, or 111100110000 binary), we can mask parts of it to get masked values, like so:
     ```
        // 111100110000 (Value, in binary)
     
        // 111111111111 (Mask, in binary)
        let wholeValue = 3888.maskedValue(firstPlace: 0, runLength: 12)     // Returns 3888
        // 111111110000
        let lastByte = 3888.maskedValue(firstPlace: 4, runLength: 8)        // Returns 243
        // 000000000011
        let lowestTwoBits = 3888.maskedValue(firstPlace: 0, runLength: 2)   // Returns 0
        // 000000111100
        let middleTwelve = 3888.maskedValue(firstPlace: 2, runLength: 4)    // Returns 12
        // 000111100000
        let middleNine = 3888.maskedValue(firstPlace: 5, runLength: 4)      // Returns 9
        // 011111111111
        let theFirstElevenBits = 3888.maskedValue(firstPlace: 0, runLength: 11) // Returns 1840
        // 111111111110
        let theLastElevenBits = 3888.maskedValue(firstPlace: 1, runLength: 11)  // Returns 1944
        // 000000110000
        let lowestTwoBitsOfTheSecondHalfOfTheFirstByte = 3888.maskedValue(firstPlace: 4, runLength: 2)          // Returns 3
        // 000001100000
        let secondToLowestTwoBitsOfTheSecondHalfOfTheFirstByte = 3888.maskedValue(firstPlace: 5, runLength: 2)  // Returns 1
        // 000011000000
        let thirdFromLowestTwoBitsOfTheSecondHalfOfTheFirstByte = 3888.maskedValue(firstPlace: 6, runLength: 2) // Returns 0
     ```
     This is BIT-based, not BYTE-based, and assumes the number is in a linear (bigendian) format, in which the least significant bit is the rightmost one (position one).
     In reality, this doesn't matter, as the language takes care of transposing byte order.
     
     The value of the Int must be positive. It is declared as an Int, in order to provide as much flexibility as possible.
     The parameters must be positive, but are declared as signed Int, in order to be as flexible as possible.
     
     - parameters:
        - firstPlace: The 1-based (1 is the first bit) starting position for the mask. Must be a positive integer.
        - runLength: The inclusive (includes the starting place) number of bits to mask. Must be a positive integer. If 0, then the return will always be 0.
     
     - returns: An Int, with the masked value.
     */
    func maskedValue(firstPlace inFirstPlace: Int, runLength inRunLength: Int) -> Int {
        precondition(0 <= self, "Value cannot be negative")
        precondition(0 <= inFirstPlace, "First position cannot be negative")
        precondition(0 <= inRunLength, "Run length cannot be negative")
        return Int(UInt(self).maskedValue(firstPlace: UInt(inFirstPlace), runLength: UInt(inRunLength)))
    }
}
