import Foundation
/**
 * Enables you to use .bundle and other resources with SPM Unit-tests
 * - Abstract: Searces for the locatio of package.swift to find root URL
 */
public class ResourceHelper {
   /**
    * We only need to generate this one time
    */
   private static let rootURL: URL = {
      guard let rootURL: URL = rootDir(file: #file) else { fatalError("\(#file) must be contained in a Swift Package Manager project.") }
      return rootURL
   }()
   /**
    * Finds project root url
    * ## Examples
    * ResourceUtil.projectRootURL(fileName: "payload.json").path // /Users/John/Documents/AwesomeApp/payload.json
    */
   public static func projectRootURL(fileName: String) -> URL {
      return rootURL.appendingPathComponent("\(fileName)", isDirectory: false)
   }
}
/**
 * Private helper methods
 */
extension ResourceHelper {
   /**
    * Get package root (project root)
    */
   private static func rootDir(file: String) -> URL? {
      var url = URL(fileURLWithPath: file, isDirectory: false)
      repeat {
         url = url.deletingLastPathComponent()
         if url.pathComponents.count <= 1 { return nil } // - Fixme: ⚠️️ use guard here instead ?
      } while !isRootDir(url: url)
      return url
   }
   /**
    * Root asserter
    */
   private static func isRootDir(url: URL) -> Bool {
      let filename = url.appendingPathComponent("Package.swift", isDirectory: false)
      return FileManager.default.fileExists(atPath: filename.path)
   }
}
