import Foundation

struct Flight {

  let arrivalDate: String
  let departureAirport: String
  let arrivalAirport: String
  let price: Int
  let airline: String
  let departureDate: String

  init?(_ dictionary: JSONDictionary?) {
    self.init(arrivalDate: dictionary?[Key.arrivalDate.rawValue] as? String,
              departureAirport: dictionary?[Key.departureAirport.rawValue] as? String,
              arrivalAirport: dictionary?[Key.arrivalAirport.rawValue] as? String,
              price: dictionary?[Key.price.rawValue] as? Int,
              airline: dictionary?[Key.airline.rawValue] as? String,
              departureDate: dictionary?[Key.departureDate.rawValue] as? String)
  }

  init?(arrivalDate: String?,
        departureAirport: String?,
        arrivalAirport: String?,
        price: Int?,
        airline: String?,
        departureDate: String?) {
    guard let arrivalDate = arrivalDate,
          let departureAirport = departureAirport,
          let arrivalAirport = arrivalAirport,
          let price = price,
          let airline = airline,
          let departureDate = departureDate else { return nil }
    self.arrivalDate = arrivalDate
    self.departureAirport = departureAirport
    self.arrivalAirport = arrivalAirport
    self.price = price
    self.airline = airline
    self.departureDate = departureDate
  }

  enum Key: String {
    case arrivalDate = "arrival_date"
    case departureAirport = "departure_airport"
    case arrivalAirport = "arrival_airport"
    case price
    case airline
    case departureDate = "departure_date"
  }
}

extension Flight {

  static var url: URL {
    return URL(string: "http://pastebin.com/raw/bFnZQEx0")!
  }

  static let resource = Resource<[Flight]>(url: url,
                                           parseJSON: {
    json in
    guard let dictionary = json as? JSONDictionary,
          let flights = dictionary["flights"] as? [JSONDictionary] else { return nil }
    return flights.flatMap(Flight.init)
  })

}
