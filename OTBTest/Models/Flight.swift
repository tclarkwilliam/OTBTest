import Foundation

let dateFormat = "YYYY-MM-dd'T'HH:mm:ssZ"

struct Flight {

  let departureDate: Date
  let arrivalDate: Date
  let departureAirport: String
  let arrivalAirport: String
  let price: Int
  let airline: String

  init?(_ dictionary: JSONDictionary?) {
    self.init(departureDate: dictionary?[Key.departureDate.rawValue] as? String,
              arrivalDate: dictionary?[Key.arrivalDate.rawValue] as? String,
              departureAirport: dictionary?[Key.departureAirport.rawValue] as? String,
              arrivalAirport: dictionary?[Key.arrivalAirport.rawValue] as? String,
              price: dictionary?[Key.price.rawValue] as? Int,
              airline: dictionary?[Key.airline.rawValue] as? String)
  }

  init?(departureDate: String?,
        arrivalDate: String?,
        departureAirport: String?,
        arrivalAirport: String?,
        price: Int?,
        airline: String?) {
    guard let departureDate = Date(fromString: departureDate, withFormat: dateFormat),
          let arrivalDate = Date(fromString: arrivalDate, withFormat: dateFormat),
          let departureAirport = departureAirport,
          let arrivalAirport = arrivalAirport,
          let price = price,
          let airline = airline else { return nil }
    self.departureDate = departureDate
    self.arrivalDate = arrivalDate
    self.departureAirport = departureAirport
    self.arrivalAirport = arrivalAirport
    self.price = price
    self.airline = airline
  }

  enum Key: String {
    case departureDate = "departure_date"
    case arrivalDate = "arrival_date"
    case departureAirport = "departure_airport"
    case arrivalAirport = "arrival_airport"
    case price
    case airline
  }
}

extension Flight {

  static var url: URL {
    return URL(string: "http://pastebin.com/raw/bFnZQEx0")!
  }

  static let resource = Resource<[Flight]>(url: url) {
    json in
    guard let dictionary = json as? JSONDictionary,
          let flights = dictionary["flights"] as? [JSONDictionary] else { return nil }
    return flights.flatMap(Flight.init)
  }

}
