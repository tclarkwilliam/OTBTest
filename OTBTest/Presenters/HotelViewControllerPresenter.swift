import UIKit

class HotelViewControllerPresenter {

  private let hotel: Hotel

  init(hotel: Hotel) {
    self.hotel = hotel
  }

  func renderImage() -> UIImage? {
    guard let imageString = hotel.images.first,
      let url = URL(string: imageString),
      let data = try? Data.init(contentsOf: url) else { return nil }
    return UIImage(data: data)
  }

  func renderFacilities() -> String {
    return self.hotel.facilities.joined(separator: "\n")
  }

  func renderRating() -> String {
    let ratingString = NSMutableString()
    for _ in 1...self.hotel.rating {
      ratingString.append("★")
    }
    return ratingString as String
  }
}
