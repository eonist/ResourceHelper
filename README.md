![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.12-orange.svg)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift)
[![Github actions badge](https://badgen.net/github/checks/eonist/ResourceHelper?icon=github&label=Builds)](https://github.com/eonist/ResourceHelper/actions)
[![codebeat badge](https://codebeat.co/badges/6704b945-11ad-43ad-b290-ebe32edd04f0)](https://codebeat.co/projects/github-com-eonist-resourcehelper-master)

# ResourceHelper
Enables you to use .bundle and other resources with SPM Unit-tests.

This will ONLY work for unit testing as the executable is loaded by then. As such, using this within your app's source code will NOT work. However, [Swift 5.3](https://github.com/apple/swift-evolution/blob/master/proposals/0271-package-manager-resources.md) will support adding assets along with packages.

If you want to add assets to your source code, you can do so by creating a directory called `Resources` in the root folder of your package. Inside `Resources`, add all the assets you need. After adding your package to your app's target, add the `Resources` folder to your `Copy Bundle Resources` build phase.


## Installation

`ResourceHelper` is available using the [Swift Package Manager](https://swift.org/package-manager/):

Using Xcode 11, go to `File -> Swift Packages -> Add Package Dependency` and enter https://github.com/eonist/ResourceHelper

If you are using `Package.swift`, you can also add `ResourceHelper` as a dependency easily.

```swift

let package = Package(
  name: "TestProject",
  dependencies: [
    .package(url: "https://github.com/eonist/ResourceHelper", from: "1.0.0")
  ],
  targets: [
    .target(name: "TestProject", dependencies: ["ResourceHelper"])
  ]
)

```

### Usage:

Make sure the assets you want to use are in the same directory as your `Package.swift`

```swift

ResourceHelper.projectRootURL(projectRef: #file, fileName: "payload.json").path // /Users/John/Documents/AwesomeApp/payload.json

```
