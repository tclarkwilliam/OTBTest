import Foundation

struct Resource<T> {
  let url: URL
  let parse: (Data) -> T?

  init(url: URL, parseJSON: @escaping (Any) -> T?) {
    self.url = url
    self.parse = {
      data in
      let json = try? JSONSerialization.jsonObject(with: data, options: [])
      return json.flatMap(parseJSON)
    }
  }
}
