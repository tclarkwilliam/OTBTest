import Foundation

typealias HotelResponse = (Hotel) -> Void

class HotelViewModel {

  let session = Session()

  func fetchHotel(completion: @escaping HotelResponse) {
    guard let url = URL(string: "http://pastebin.com/raw/f0Tm6bfy") else { return }
    let request = Request.url(url)
    self.session.send(request: request) {
      (response) in
      guard let hotel = Hotel(response) else { return }
      completion(hotel)
    }
  }

}
