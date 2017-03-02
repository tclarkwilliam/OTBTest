@testable import OTBTest

struct ResultLoader {

  static func loadFlight<T>(forClass: T.Type) -> JSONDictionary {
    let dictionary = JSONLoader.load("flight", forClass: forClass)!
    let flights = dictionary["flights"] as! [JSONDictionary]
    return flights.first!
  }

  static func loadFlights<T>(forClass: T.Type) -> [JSONDictionary] {
    let dictionary = JSONLoader.load("flight", forClass: forClass)!
    return dictionary["flights"] as! [JSONDictionary]
  }

  static func loadHotel<T>(forClass: T.Type) -> JSONDictionary {
    return JSONLoader.load("hotel", forClass: forClass)!
  }
  
}
