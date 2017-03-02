import Foundation

typealias ResponseCompletion<T> = (T?, Error?) -> Void

class WebService {

  private let session: URLSession

  init(session: URLSession = URLSession.shared) {
    self.session = session
  }

  func load<T>(_ resource: Resource<T>,
               completion: @escaping ResponseCompletion<T>) {
    self.session.dataTask(with: resource.url) {
      (data, response, error) in
      if let result = data.flatMap(resource.parse) {
        self.response(result, nil,
                      completion: completion)
      } else {
        self.response(nil, error,
                      completion: completion)

      }
    }.resume()
  }

  private func response<T>(_ result: T?, _ error: Error?,
                           completion: @escaping ResponseCompletion<T>) {
    DispatchQueue.main.async {
      completion(result, error)
    }
  }

}
