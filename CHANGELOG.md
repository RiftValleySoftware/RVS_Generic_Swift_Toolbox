*Version 1.15.4* **January 15, 2025**
- Did some internal optimizations and fixes.

*Version 1.15.3* **January 15, 2025**
- Added the `isEven` computed property, and moved the `maskedValue` function to an overall type extension; making it all much simpler.

*Version 1.15.2* **November 26, 2024**
- Added an array casting extension, allowing easy casting of an array of weak references to an array of the referenced objects.

*Version 1.15.1* **November 25, 2024**
- Removed the Date extension for Strideable, as it has been in the various OSes, for a while.
- Upped the base OS version for iOS, TVOS, and WatchOS, slightly.

*Version 1.15.0* **November 20, 2024**
- Added the `RVS_WeakObjectReference` struct.
- Tweaked the tests to work properly on all platforms.
- Updated to latest tools.

*Version 1.14.0* **October 5, 2024**
- Made the "localizedVariant" the only one necessary, as it tries the other two specialised ones.

*Version 1.13.3* **July 29, 2024**
- Adjusted the build to use the platform-independent methodology for testing.

*Version 1.13.2* **July 28, 2024**
- Updated to latest tools.
- Upped the minimum supported OS versions (slightly).

*Version 1.13.1* **January 6, 2024**
- Added privacy declarations.
- Had to remove SwiftLint, as it no longer works. :(

*Version 1.13.0* **November 28, 2023**
- Added a ContiguousBytes extension, to help cast Data into Arrays.

*Version 1.12.4* **April 2, 2023**
- Moved some of the string stuff into the Foundation file.

*Version 1.12.3* **February 13, 2023**
- Added a test for the new primary URL scheme bundle accessor.

*Version 1.12.2* **February 8, 2023**
- Documentation fixes. No API changes.

*Version 1.12.1* **February 8, 2023**
- Tweaked the style a bit on the new property.
- Updated the README.

*Version 1.12.0* **February 8, 2023**
- Added the `primaryURLScheme` computed bundle property.

*Version 1.11.0* **October 6, 2022**
- Added the `errorsLocalizedVariant` StringProtocol extension computed property. No other API changes.
- Changed the testing to "Any Platform," and removed the various platform-specific variants.

*Version 1.10.2* **September 16, 2022**
- Updated to latest tools. No API changes.

*Version 1.10.1* **July 9, 2022**
- Added some more Date and CG extensions.

*Version 1.9.1* **July 8, 2022**
- iOS requires a separate import of CG (It is not included in iOS Foundation, apparently).

*Version 1.9.0* **July 8, 2022**
- Added some more "Foundation" stuff -Strideable Date, and Some degree/Radian conversions.

*Version 1.8.1* **May 31, 2022**
- Dropped the min Mac version to 10.14

*Version 1.8.1* **May 31, 2022**
- Renamed, so the vestigial "dash" notation has been replaced (vestigial from when it was a dylib).

*Version 1.7.3* **May 31, 2022**
- Updated to the latest tool versions.

*Version 1.7.2* **May 12, 2022**
- Some efforts to improve the DocC support (not much luck, so far. It seems that DocC doesn't like standard type extensions).
- Efforts to improve the Swift Package Index support (adding targets for all operating systems).

*Version 1.7.1* **May 11, 2022**
- Got the tests working (case-sensitivity issue).
- The DocC is still having issues. It is only documenting the first source directory.

*Version 1.7.0* **May 11, 2022**
- Added the `accessibilityLocalizedVariant` computed property to the `StringProtocol` extension.
- Cleaned up the testing. It's an old project, and the testing was kind of a mess. The command-line testing (`swift test`) is still having issues, but the main testing (Xcode) is working fine.
- I removed the localized string tests, because I had to do too much weird stuff, to test. It's a very simple feature, however, and it will be immediately obvious, if there's an issue.
- Bumped the minimum MacOS version to 11 (This one goes to 11).

*Version 1.6.7* **April 2, 2022**
- No change, but I had to update the version number to stop my project from complaining.

*Version 1.6.6* **March 15, 2022**
- Updated the tool. No functional or API changes.

*Version 1.6.5* **January 28, 2022**
- Added DocC support. No functional or API changes.

*Version 1.6.4* **December 14, 2021**
- Updated for the latest toolchains.

*Version 1.6.3* **September 23, 2021**
- Updated for the latest toolchains.

*Version 1.6.2* **July 10, 2021**
- Enabled code coverage for tests.
- Fixed a couple of bugs, exposed by increased code coverage. Code coverage is *gooood*.
- Upped the min versions a bit.

*Version 1.6.1* **July 7, 2021**
- Added the Roman Numeral calculator to the Int extension.

*Version 1.6.0* **June 19, 2021**
- Added the `isAValidEmailAddress` computed property.

*Version 1.5.3* **June 18, 2021**
- The bundle extension needed to be public.

*Version 1.5.2* **September 25, 2020**
- Removed the Foundation import from the OleB tool. No need for it.
- Added a simple set of Bundle extensions.
- Fixed some code comments.

*Version 1.5.0* **July 31, 2020**
- Needed to rearrange the directory structure, because command-line Swift test requires the standard structure.
- Added support for the GitHub action.

*Version 1.4.0* **July 9, 2020**
- Added the "setSplit()" methods.

*Version 1.3.0* **July 5, 2020**
- Nope. SPM library should be static.

*Version 1.2.1* **June 23, 2020**
- Changing SPM Library Type to Dynamic

*Version 1.2.0* **June 21, 2020**
- Adding support for SPM

*Version 1.1.0* **June 13, 2020**
- Renamed the test directory.
- Renamed the meta dir to match my regular naming.
- Removed the podfile.
- Added excutable SwiftLint.

*Version 1.0.6* **May 22, 2020**
- My "cutTheLine(_:)" method was wrong. Fixed.
- Updated to latest Xcode.

*Version 1.0.5* **April 21, 2020**
- Removed the Data extension, because it's sort of unsafe, and probably not something that should be in a public utility.

*Version 1.0.4* **April 21, 2020**
- Added the Data extension, and the casting function.

*Version 1.0.3* **April 20, 2020**
- Some basic refactoring to improve "swiftiness."

*Version 1.0.2* **April 19, 2020**
- Added the uuidFormat computed property.

*Version 1.0.1* **January 31, 2020**
- Very minor tweak to the MD5/SHA routines, to make them a tiny bit more efficient.
- Removed the Pods project from the workspace (I don't like to ship with pods -I only use them for the SwiftLint).

*Version 1.0.0* **January 29, 2020**
- Initial Release.
