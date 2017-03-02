import Foundation

class MockSession: URLSession {

  var dataTask: MockDataTask
  init(dataTask: MockDataTask) {
    self.dataTask = dataTask
  }

  var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
  override func dataTask(with url: URL,
                         completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    self.dataTask.url = url
    self.completionHandler = completionHandler
    return self.dataTask
  }
  
}
