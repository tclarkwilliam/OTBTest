import Foundation

typealias HotelResponse = (Hotel) -> Void

class HotelViewModel {

  func fetchHotel(completion: @escaping HotelResponse) {
    WebService().load(Hotel.resource) {
      result in
      completion(result)
    }
  }

}
