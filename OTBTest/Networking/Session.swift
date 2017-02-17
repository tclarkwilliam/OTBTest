import Foundation

typealias JSONDictionary = [String: Any]
typealias JSONResponse = (JSONDictionary) -> Void

struct Session {

  func send(request: URLRequest,
            completion: @escaping JSONResponse) {
    URLSession.shared.dataTask(with: request) {
      (data, response, error) in
      guard let data = data, error == nil else { return }
      let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
      guard let json = responseJSON as? JSONDictionary else { return }
      DispatchQueue.main.async {
        completion(json)
      }
    }.resume()
  }

}
