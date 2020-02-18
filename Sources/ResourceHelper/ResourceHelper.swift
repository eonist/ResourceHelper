import Foundation
/**
 * Enables you to use .bundle and other resources with SPM Unit-tests
 * - Abstract: Searces for the location of package.swift to find root URL
 */
public class ResourceHelper {
   private static var projectRef: String?
   /**
    * We only need to generate this one time
    */
   private static let rootURL: URL = {
      guard let projectRef = projectRef, let rootURL: URL = rootDir(file: projectRef) else { fatalError("\(ResourceHelper.projectRef ?? "") must be contained in a Swift Package Manager project.") }
      return rootURL
   }()
   /**
    * Finds project root url
    * - Fixme: ⚠️️ Maybe add optional resource subfolder parameter: "/Assets/Bundles/" etc
    * ## Examples
    * ResourceHelper.projectRootURL(projectRef: #file, fileName: "payload.json").path // /Users/John/Documents/AwesomeApp/payload.json
    * - Parameters:
    *    - projectRef: the #file must be declared from the calller, or else you get the location of this repo
    *    - fileName: name of the file to get url for
    */
   public static func projectRootURL(projectRef: String, fileName: String) -> URL {
      ResourceHelper.projectRef = projectRef
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
