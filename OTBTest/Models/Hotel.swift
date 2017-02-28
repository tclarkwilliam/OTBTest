import Foundation

typealias JSONDictionary = [String: AnyObject]

struct Hotel {

  let name: String
  let location: String
  let rating: Int
  let description: String
  let images: [String]
  let facilities: [String]

  init?(_ dictionary: JSONDictionary?) {
    self.init(name: dictionary?[Key.name.rawValue] as? String,
              location: dictionary?[Key.location.rawValue] as? String,
              rating: dictionary?[Key.rating.rawValue] as? Int,
              description: dictionary?[Key.description.rawValue] as? String,
              images: dictionary?[Key.images.rawValue] as? [String],
              facilities: dictionary?[Key.facilities.rawValue] as? [String])
  }

  init?(name: String?,
        location: String?,
        rating: Int?,
        description: String?,
        images: [String]?,
        facilities: [String]?) {
    guard let name =  name,
          let location = location,
          let rating = rating,
          let description = description,
          let images = images,
          let facilities = facilities else { return nil }
    self.name = name
    self.location = location
    self.rating = rating
    self.description = description
    self.images = images
    self.facilities = facilities
  }

  enum Key: String {
    case name
    case location = "hotel_location"
    case rating
    case description
    case images
    case facilities
  }

}

extension Hotel {

  static var url: URL {
    return URL(string: "http://pastebin.com/raw/f0Tm6bfy")!
  }

  static let resource = Resource<Hotel>(url: url) {
    json in
    guard let hotel = json as? JSONDictionary else { return nil }
    return Hotel(hotel)
  }

}
