import Foundation

class HotelViewModel {

  private(set) var webService: WebService

  init(webService: WebService = WebService()) {
    self.webService = webService
  }

  func fetchHotel(completion: @escaping ResponseCompletion<Hotel>) {
    self.webService.load(Hotel.resource) {
      result, error in
      completion(result, error)
    }
  }

}
