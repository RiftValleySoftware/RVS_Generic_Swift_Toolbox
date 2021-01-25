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

import XCTest
@testable import RVS_Generic_Swift_Toolbox

/* ###################################################################################################################################### */
// MARK: - String Data Detector Tests -
/* ###################################################################################################################################### */
/**
 These are specific unit tests for the data detector String extension.
 */
class RVS_String_DataDetector_Tests: XCTestCase {
    /// The protocol prefix for the Zoom app.
    static private let _zoomID = "zoomus"
    /// The protocol prefix for the Google Maps app.
    static private let _googleMapsID = "comgooglemaps"
    /// The protocol prefix for telephone URLs.
    static private let _telID = "tel"
    
    /// A fairly basic test String
    static private let _testString00 = "Lorem ipsum dolor sit amet, 631-555-1212 consectetur 6315551212 adipiscing elit, sed do eiusmod tempor 555-1234 incididunt ut labore et 5551234 dolore magna aliqua. Sagittis eu volutpat odio facilisis mauris sit. Praesent tristique magna sit amet purus gravida quis. Suspendisse faucibus interdum posuere lorem ipsum dolor sit. Lacinia quis vel eros donec ac odio tempor. In nibh http://noaa.gov mauris cursus mattis molestie. Dolor purus non enim praesent elementum. Arcu non sodales neque sodales ut ftp://123.156.234.123 etiam sit. Ac felis donec et odio pellentesque diam volutpat commodo. Tortor vitae purus faucibus https://example.com ornare. Ultricies +1-631-555-2345 leo +16315552345 integer malesuada nunc vel. Sed odio morbi quis commodo odio aenean sed. Bibendum est ultricies integer quis auctor elit. tel:+16315556789 Habitant morbi tristique senectus et netus et malesuada fames."
    /// The results we expect from scanning that string.
    static private let _testString00Results = [ "631-555-1212",
                                                "631-555-1212",
                                                "555-1234",
                                                "555-1234",
                                                "http://noaa.gov",
                                                "ftp://123.156.234.123",
                                                "https://example.com",
                                                "+1-631-555-2345",
                                                "+1-631-555-2345",
                                                "tel:+16315556789"
                                                ]
    
    /// A test String with a bunch of text (and embeded data)
    static private let _testString01 = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sagittis eu volutpat odio facilisis mauris sit. Praesent tristique magna sit amet purus gravida quis. Suspendisse faucibus interdum posuere lorem ipsum dolor sit. Lacinia quis vel eros donec ac odio tempor. In nibh mauris cursus mattis molestie. Dolor purus non enim praesent elementum. Arcu non sodales neque sodales ut etiam sit. Ac felis donec et odio pellentesque diam volutpat commodo. Tortor vitae purus faucibus ornare. Ultricies leo integer malesuada nunc vel. Sed odio morbi quis commodo odio aenean sed. Bibendum est ultricies integer quis auctor elit. Habitant morbi tristique senectus et netus et malesuada fames.

Imperdiet massa tincidunt nunc pulvinar. Orci eu lobortis elementum nibh tellus molestie nunc non. Ultrices gravida dictum fusce ut. Consequat semper viverra nam libero justo. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget. Ullamcorper morbi tincidunt ornare massa eget. Risus quis varius quam quisque id. Nibh cras pulvinar mattis nunc sed blandit. Felis imperdiet proin fermentum leo vel orci porta. Lectus nulla at volutpat diam. Eu turpis egestas pretium aenean pharetra. Aliquet nec ullamcorper sit amet risus nullam eget felis eget. Neque laoreet suspendisse interdum consectetur libero id faucibus nisl. Porttitor rhoncus dolor purus non enim praesent. Libero nunc consequat interdum varius sit amet mattis vulputate. Amet massa vitae tortor condimentum lacinia.

Et tortor at risus viverra adipiscing at in. Lectus arcu bibendum at varius vel pharetra vel. In arcu cursus euismod quis viverra nibh cras pulvinar mattis. Semper eget duis at tellus. Aliquet nec ullamcorper sit amet risus. Imperdiet nulla malesuada pellentesque elit. Erat pellentesque adipiscing commodo elit at imperdiet. Fusce id velit ut tortor pretium viverra suspendisse potenti nullam. Purus viverra accumsan in nisl. Purus sit amet luctus venenatis lectus magna fringilla urna. Ac turpis egestas maecenas pharetra convallis posuere morbi leo. Fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis. Adipiscing at in tellus integer feugiat scelerisque varius. Platea dictumst quisque sagittis purus. Varius vel pharetra vel turpis nunc eget lorem dolor. Ullamcorper malesuada proin libero nunc consequat interdum varius sit amet. Massa ultricies mi quis hendrerit dolor magna eget est lorem.

Vivamus at augue eget arcu dictum varius duis at consectetur. Placerat in egestas erat imperdiet sed. Vel turpis nunc eget lorem dolor sed viverra ipsum. Eu sem integer vitae justo eget magna fermentum. Commodo odio aenean sed adipiscing diam. Vitae aliquet nec ullamcorper sit amet risus nullam. Mus mauris vitae ultricies leo integer. Laoreet sit amet cursus sit amet dictum sit. Mattis rhoncus urna neque viverra justo. Eleifend mi in nulla posuere sollicitudin aliquam. Nunc eget lorem dolor sed viverra ipsum nunc aliquet. Porttitor leo a diam sollicitudin tempor id eu nisl. Justo eget magna fermentum iaculis eu non diam. Sed ullamcorper morbi tincidunt ornare massa eget egestas. Faucibus nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est sit.

Non odio euismod lacinia at quis. Eget nullam non nisi est. Nibh tortor id aliquet lectus proin nibh nisl condimentum id. Amet mauris commodo quis imperdiet massa. Adipiscing tristique risus nec feugiat in fermentum posuere urna nec. Gravida dictum fusce ut placerat. Ullamcorper malesuada proin libero nunc consequat interdum. Varius vel pharetra vel turpis nunc. Tellus in hac habitasse platea dictumst vestibulum rhoncus est. Nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices. Auctor urna nunc id cursus metus aliquam eleifend. Commodo elit at imperdiet dui accumsan sit amet nulla. Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque. Enim tortor at auctor urna nunc id cursus metus aliquam. Diam maecenas sed enim ut sem viverra aliquet. Viverra nam libero justo laoreet. Eu mi bibendum neque egestas congue quisque egestas. Enim sed faucibus turpis in eu mi bibendum. Cursus vitae congue mauris rhoncus aenean vel elit. Ornare arcu odio ut sem nulla.

Quis imperdiet massa tincidunt nunc pulvinar sapien et ligula. Massa ultricies mi quis hendrerit. Amet nisl suscipit adipiscing bibendum est ultricies. Vitae elementum curabitur vitae nunc sed velit dignissim sodales ut. Porta non pulvinar neque laoreet suspendisse. Amet risus nullam eget felis. Diam sollicitudin tempor id eu nisl. Proin fermentum leo vel orci porta non pulvinar. Risus quis varius quam quisque id diam vel quam elementum. Malesuada bibendum arcu vitae elementum curabitur vitae. Duis at consectetur lorem donec massa sapien faucibus et molestie. Ut eu sem integer vitae justo eget magna fermentum iaculis.

Ac placerat vestibulum lectus mauris ultrices eros in. Diam sit amet nisl suscipit adipiscing. Ultrices sagittis orci a scelerisque purus semper. Sit amet consectetur adipiscing elit ut. Dignissim sodales ut eu sem integer vitae justo eget. Lacus laoreet non curabitur gravida arcu ac tortor. Vel fringilla est ullamcorper eget nulla facilisi etiam. Sed turpis tincidunt id aliquet risus. Consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo. Ac tortor dignissim convallis aenean et. Felis eget velit aliquet sagittis id. Vitae tempus quam pellentesque nec nam aliquam. Elit at imperdiet dui accumsan sit amet. Leo in vitae turpis massa sed. Dolor magna eget est lorem ipsum. Vel eros donec ac odio tempor orci dapibus ultrices. Blandit volutpat maecenas volutpat blandit aliquam etiam erat. Ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis.

In nibh mauris cursus mattis. Vel fringilla est ullamcorper eget. Magna sit amet purus gravida quis blandit turpis cursus. Consectetur adipiscing elit ut aliquam purus sit amet. Dui faucibus in ornare quam viverra. Mattis nunc sed blandit libero volutpat sed. Lectus arcu bibendum at varius vel pharetra. Sit amet mattis vulputate enim nulla aliquet. Nisl vel pretium lectus quam. Sollicitudin aliquam ultrices sagittis orci a. Habitant morbi tristique senectus et netus et malesuada. Scelerisque fermentum dui faucibus in ornare. Dictum non consectetur a erat nam at. Morbi enim nunc faucibus a pellentesque sit amet porttitor. Felis imperdiet proin fermentum leo. Amet justo donec enim diam vulputate. A scelerisque purus semper eget. Ornare lectus sit amet est placerat in egestas. Cursus mattis molestie a iaculis at. Tristique et egestas quis ipsum.

Integer feugiat scelerisque varius morbi enim nunc faucibus a. Urna nec tincidunt praesent semper feugiat nibh. Tristique senectus et netus et malesuada. Morbi tempus iaculis urna id volutpat lacus. Amet aliquam id diam maecenas. Imperdiet massa tincidunt nunc pulvinar. Dapibus ultrices in iaculis nunc sed augue lacus viverra vitae. Egestas congue quisque egestas diam in arcu cursus euismod quis. Pharetra convallis posuere morbi leo urna molestie. Turpis egestas sed tempus urna. Iaculis eu non diam phasellus. Vitae congue eu consequat ac felis donec. Nulla facilisi etiam dignissim diam quis. Tellus in hac habitasse platea dictumst. Dictum varius duis at consectetur lorem donec massa. Lacus viverra vitae congue eu consequat ac felis donec. Vitae proin sagittis nisl rhoncus mattis. Volutpat maecenas volutpat blandit aliquam etiam.

Risus nullam eget felis eget nunc lobortis mattis aliquam faucibus. Enim sed faucibus turpis in eu. Integer feugiat scelerisque varius morbi enim. Egestas quis ipsum suspendisse ultrices gravida. Magna fringilla urna porttitor rhoncus. Nam at lectus urna duis convallis convallis tellus. Diam phasellus vestibulum lorem sed risus ultricies tristique nulla. Eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus. Fermentum odio eu feugiat pretium nibh. Amet nisl purus in mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Ut sem viverra aliquet eget sit. Adipiscing elit pellentesque habitant morbi tristique senectus et. Malesuada fames ac turpis egestas maecenas pharetra. Tincidunt lobortis feugiat vivamus at augue. Eu turpis egestas pretium aenean pharetra magna ac placerat vestibulum.

Eget est lorem ipsum dolor sit amet consectetur. Scelerisque in dictum non consectetur a erat nam at. Tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Et netus et malesuada fames. Rutrum quisque non tellus orci ac auctor augue mauris. Aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod. Vel pharetra vel turpis nunc eget lorem. Ultricies lacus sed turpis tincidunt id aliquet risus. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Proin fermentum leo vel orci porta non pulvinar neque. Velit aliquet sagittis id consectetur purus ut faucibus pulvinar.

Lacus vel facilisis volutpat est velit egestas dui. Nunc aliquet bibendum enim facilisis gravida neque convallis a cras. Venenatis a condimentum vitae sapien pellentesque. Id neque aliquam vestibulum morbi blandit cursus. Scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Vitae ultricies leo integer malesuada nunc vel. Ut sem nulla pharetra diam sit. Non blandit massa enim nec dui. Sit amet risus nullam eget felis eget nunc. Sed sed risus pretium quam.

Ullamcorper dignissim cras tincidunt lobortis feugiat. Libero volutpat sed cras ornare arcu dui vivamus arcu felis. Vel facilisis volutpat est velit egestas dui id. Et tortor at risus viverra. Nisl nisi scelerisque eu ultrices vitae. Quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum. Lobortis feugiat vivamus at augue. Est placerat in egestas erat imperdiet sed. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Ultricies mi quis hendrerit dolor magna eget est lorem ipsum. Nunc non blandit massa enim nec. Et malesuada fames ac turpis egestas. Quis vel eros donec ac odio tempor orci. Ac auctor augue mauris augue neque gravida in. Faucibus et molestie ac feugiat sed lectus vestibulum. Ornare suspendisse sed nisi lacus sed viverra tellus in hac. Faucibus pulvinar elementum integer enim neque.

Varius sit amet mattis vulputate enim nulla aliquet porttitor lacus. Et odio pellentesque diam volutpat commodo sed. Urna neque viverra justo nec ultrices dui. Gravida quis blandit turpis cursus in hac habitasse platea dictumst. Scelerisque in dictum non consectetur. Fames ac turpis egestas sed tempus urna et pharetra. Id leo in vitae turpis. Quam lacus suspendisse faucibus interdum posuere. Congue quisque egestas diam in arcu cursus euismod quis viverra. Diam sollicitudin tempor id eu. Hac habitasse platea dictumst vestibulum rhoncus est. Ac orci phasellus egestas tellus. Ut consequat semper viverra nam libero justo laoreet. Ultrices vitae auctor eu augue. Blandit turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget duis at tellus at urna condimentum mattis pellentesque id.

Ornare lectus sit amet est placerat in egestas. Diam quis enim lobortis scelerisque fermentum dui faucibus. Sed elementum tempus egestas sed sed risus pretium quam. Ac odio tempor orci dapibus ultrices in iaculis nunc. Mattis ullamcorper velit sed ullamcorper morbi tincidunt. Sed viverra tellus in hac habitasse platea dictumst vestibulum. Tincidunt arcu non sodales neque sodales ut etiam sit. Mauris pharetra et ultrices neque ornare aenean. Lacus viverra vitae congue eu. Gravida quis blandit turpis cursus in hac habitasse platea. Etiam erat velit scelerisque in dictum non consectetur. Morbi non arcu risus quis. Nisi quis eleifend quam adipiscing vitae proin.

Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Duis at consectetur lorem donec massa sapien faucibus et molestie. In ornare quam viverra orci sagittis eu. Morbi tempus iaculis urna id volutpat lacus. Orci a scelerisque purus semper. Vulputate sapien nec sagittis aliquam malesuada bibendum arcu vitae elementum. Sed ullamcorper morbi tincidunt ornare massa eget. Nisi quis eleifend quam adipiscing vitae. Elit eget gravida cum sociis. Nunc pulvinar sapien et ligula ullamcorper malesuada proin. Dignissim cras tincidunt lobortis feugiat vivamus at augue. Sit amet est placerat in egestas erat imperdiet sed euismod. Porttitor leo a diam sollicitudin tempor. Sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit. Lorem ipsum dolor sit amet consectetur adipiscing elit ut aliquam. Sem nulla pharetra diam sit. Elit pellentesque habitant morbi tristique senectus et netus. Platea dictumst quisque sagittis purus sit amet. Venenatis lectus magna fringilla urna. Non arcu risus quis varius quam.

Mauris cursus mattis molestie a iaculis. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Porta non pulvinar neque laoreet suspendisse. Magna etiam tempor orci eu. Sollicitudin ac orci phasellus egestas tellus rutrum. Vivamus at augue eget arcu dictum. Et malesuada fames ac turpis egestas sed tempus urna. Eros donec ac odio tempor orci dapibus ultrices in. Ut porttitor leo a diam sollicitudin. Mollis nunc sed id semper risus in. Etiam erat velit scelerisque in dictum non. Malesuada fames ac turpis egestas sed tempus urna. Felis bibendum ut tristique et. Tempor orci dapibus ultrices in iaculis. Tincidunt eget nullam non nisi est sit amet. Felis eget velit aliquet sagittis.

Rhoncus aenean vel elit scelerisque. Turpis egestas maecenas pharetra convallis posuere morbi leo urna molestie. Tempus egestas sed sed risus. Adipiscing at in tellus integer. Erat imperdiet sed euismod nisi porta. Aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus. Mollis nunc sed id semper risus in. Posuere morbi leo urna molestie at. Leo vel orci porta non pulvinar neque. A scelerisque purus semper eget duis at tellus at. Eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis. Morbi blandit cursus risus at ultrices. Vitae nunc sed velit dignissim sodales ut eu sem integer. Id nibh tortor id aliquet lectus proin. Mattis nunc sed blandit libero volutpat sed cras ornare. Ultrices eros in cursus turpis massa tincidunt dui ut ornare. Adipiscing commodo elit at imperdiet dui accumsan sit amet. Pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et.

Nisl rhoncus mattis rhoncus urna neque viverra justo. Interdum consectetur libero id faucibus nisl. Nunc non blandit massa enim nec dui. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit amet. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu vitae. Risus nec feugiat in fermentum posuere. Consequat mauris nunc congue nisi. Lorem mollis aliquam ut porttitor leo a diam sollicitudin. Et tortor at risus viverra adipiscing. Ultrices dui sapien eget mi proin sed libero enim. Egestas erat imperdiet sed euismod nisi porta lorem. Phasellus faucibus scelerisque eleifend donec pretium. Magna etiam tempor orci eu lobortis elementum nibh tellus molestie.

Fermentum odio eu feugiat pretium nibh. Etiam tempor orci eu lobortis elementum nibh tellus molestie nunc. In ornare quam viverra orci sagittis eu volutpat odio. Interdum velit laoreet id donec ultrices tincidunt arcu. Id venenatis a condimentum vitae sapien. Libero id faucibus nisl tincidunt eget nullam. Adipiscing commodo elit at imperdiet dui accumsan sit. Ac turpis egestas sed tempus urna. Nisl nunc mi ipsum faucibus vitae aliquet nec. Justo nec ultrices dui sapien eget mi. Ut lectus arcu bibendum at. Volutpat sed cras ornare arcu dui vivamus. Ut pharetra sit amet aliquam id. Vel orci porta non pulvinar neque. Tincidunt eget nullam non nisi est sit amet facilisis magna. Porttitor eget dolor morbi non arcu risus quis varius. Fames ac turpis egestas integer. Sapien pellentesque habitant morbi tristique senectus et netus. Dictum non consectetur a erat nam at. Eget aliquet nibh praesent tristique magna sit amet purus.
"""

    /* ################################################################## */
    /**
     */
    override func setUp() {
    }

    /* ################################################################## */
    /**
     */
    func testBasics() {
        let string = Self._testString00
        
        let detected = string.detectedURIs
        
        print(String(describing: detected))
    }
}
