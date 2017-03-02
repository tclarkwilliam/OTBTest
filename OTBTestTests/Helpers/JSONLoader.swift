import Foundation

@testable import OTBTest

struct JSONLoader {

  static func load<T>(_ fileName: String, forClass: T.Type) -> JSONDictionary? {
    let testBundle = Bundle(for: forClass as! AnyClass)
    guard let path = testBundle.path(forResource: fileName, ofType: "json"),
          let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
          let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return nil }
    return json as? JSONDictionary
  }

}
