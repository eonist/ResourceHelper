![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.12-orange.svg)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift)
[![Github actions badge](https://badgen.net/github/checks/eonist/ResourceHelper?icon=github&label=Builds)](https://github.com/eonist/ResourceHelper/actions)
[![codebeat badge](https://codebeat.co/badges/6704b945-11ad-43ad-b290-ebe32edd04f0)](https://codebeat.co/projects/github-com-eonist-resourcehelper-master)

# ResourceHelper
Enables you to use .bundle and other resources with SPM Unit-tests

### Installation:
- SPM: `.url("https://github.com/eonist/ResourceHelper.git"), branch("master")`

### Examples:

```swift
ResourceHelper.projectRootURL(projectRef: #file, fileName: "payload.json").path // /Users/John/Documents/AwesomeApp/payload.json
```
