![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.12-orange.svg)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift)
[![Github actions badge](https://badgen.net/github/checks/eonist/ResourceHelper?icon=github&label=Builds)](https://github.com/eonist/ResourceHelper/actions)
[![codebeat badge](https://codebeat.co/badges/6704b945-11ad-43ad-b290-ebe32edd04f0)](https://codebeat.co/projects/github-com-eonist-resourcehelper-master)

# Features
- Enables you to use .bundle and other resources with SPM Unit-tests. (Perfect for Github action CI)
- Enables you to also use the same code in XCode unit tests

### Example code: 
```swift
// The temp.bundle folder can be in the root of your project (same directory as your `Package.swift`)
// iOS can only add resources inside .bundle folders
let path: String = ResourceHelper.projectRootURL(projectRef: #file, fileName: "temp.bundle/payload.json").path
Swift.print("path:  \(path)") // Users/John/Documents/AwesomeApp/temp.bundle/payload.json
```

**Note:** [Swift 5.3](https://github.com/apple/swift-evolution/blob/master/proposals/0271-package-manager-resources.md) has support for adding assets with SPM, although a bit cumbersome. here is a tutorial 😅:  [https://medium.com/better-programming/how-to-add-resources-in-swift-package-manager-c437d44ec593](https://medium.com/better-programming/how-to-add-resources-in-swift-package-manager-c437d44ec593) 

## Installation

`ResourceHelper` is available using the [Swift Package Manager](https://swift.org/package-manager/):

Using Xcode 11, go to `File -> Swift Packages -> Add Package Dependency` and search for ResourceHelper or enter: https://github.com/eonist/ResourceHelper

If you are using `Package.swift`, you can also add `ResourceHelper` as a dependency easily.

```swift

let package = Package(
  name: "TestProject",
  dependencies: [
    .package(url: "https://github.com/eonist/ResourceHelper.git", .branch("master"))
  ],
  targets: [
    .target(name: "TestProject", dependencies: ["ResourceHelper"])
  ]
)

```
