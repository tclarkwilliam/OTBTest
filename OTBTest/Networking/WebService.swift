import Foundation

final class WebService {

  func load<T>(_ resource: Resource<T>, completion: @escaping (T) -> (Void)) {
    URLSession.shared.dataTask(with: resource.url) {
      (data, response, error) in
      guard let result = data.flatMap(resource.parse) else { return }
      DispatchQueue.main.async {
        completion(result)
      }
    }.resume()
  }

}
