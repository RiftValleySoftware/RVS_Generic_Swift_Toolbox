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
public extension Int {
    /* ################################################################## */
    /**
     This method allows us to mask a certaing bit range within the number, and return its value as a basic Int.
     For example, if we have the hex number 0xF30 (3888 decimal, or 111100110000 binary), we can mask parts of it to get masked values, like so:
        let lowestTwoBits = 3888.maskedValue(firstPlace: 0, runLength: 2)   // Returns 0
        let lowestTwoBitsOfTheSecondHalfOfTheFirstByte = 3888.maskedValue(firstPlace: 4, runLength: 2)   // Returns 3
        let secondToLowestTwoBitsOfTheSecondHalfOfTheFirstByte = 3888.maskedValue(firstPlace: 5, runLength: 2)   // Returns 1
        let thirdFromLowestTwoBitsOfTheSecondHalfOfTheFirstByte = 3888.maskedValue(firstPlace: 6, runLength: 2)   // Returns 0
        let wholeValue = 3888.maskedValue(firstPlace: 0, runLength: 12) // Returns 3888
        let theFirstElevenBits = 3888.maskedValue(firstPlace: 0, runLength: 11) // Returns 1840
        let theLastElevenBits = 3888.maskedValue(firstPlace: 1, runLength: 11)  // Returns 1944
        let middleTwelve = 3888.maskedValue(firstPlace: 2, runLength: 4)  // Returns 12
        let middleNine = 3888.maskedValue(firstPlace: 5, runLength: 4)  // Returns 9
        let lastByte = 3888.maskedValue(firstPlace: 4, runLength: 8)    // Returns 243
     
     This is BIT-based, not BYTE-based, and assumes the number is in a linear (bigendian) format, in which the least significant bit is the rightmost one (position one).
     In reality, this doesn't matter, as the language takes care of transposing byte order.
     
     The parameters must be positive, but are declared as signed Int, in order to be as flexible as possible.
     
     - parameters:
        - firstPlace: The 1-based (1 is the first bit) starting position for the mask. Must be a positive integer.
        - runLength: The inclusive (includes the starting place) number of bits to mask. Must be a positive integer. If 0, then the return will always be 0.
     
     - returns: An Int, with the masked value.
     */
    func maskedValue(firstPlace: Int, runLength: Int) -> Int {
        precondition(0 <= firstPlace, "First Place Must be Positive")
        precondition(0 <= runLength, "Run Length Must be Positive")
        precondition((firstPlace + runLength) <= (MemoryLayout<Self>.size * 8), "Requested Mask is Out of Bounds")
        guard 0 < runLength else { return 0 }   // Shortcut, if they aren't looking for anything.
        // We create a mask, starting at bit one, then shift our value down to fit that mask.
        let mask = UInt64(1 << runLength) - 1   // Simple way to do a 1-mask.
        let shifted = UInt64(self >> firstPlace)
        return Int(shifted & mask)
    }
}
