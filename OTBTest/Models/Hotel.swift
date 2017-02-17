import Foundation

struct Hotel {

  let description: String
  let images: [String]

  init?(_ dictionary: JSONDictionary?) {
    self.init(description: dictionary?[Key.description.rawValue] as? String,
              images: dictionary?[Key.images.rawValue] as? [String])
  }

  init?(description: String?,
        images: [String]?) {
    guard let description = description,
          let images = images else { return nil }
    self.init(description: description,
              images: images)
  }

  init(description: String,
       images: [String]) {
    self.description = description
    self.images = images
  }

}

extension Hotel {
  enum Key: String {
    case description
    case images
  }
}
