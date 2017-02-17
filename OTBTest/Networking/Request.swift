import Foundation

struct Request {

  static func url(_ url: URL) -> URLRequest {
    let jsonData = try? JSONSerialization.data(withJSONObject: JSONDictionary())
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = jsonData
    return request
  }

}
