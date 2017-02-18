import Foundation

typealias FlightResponse = ([Flight]) -> Void

class FlightViewModel {

  func fetchFlights(completion: @escaping FlightResponse) {
    WebService().load(Flight.resource) {
      result in
      completion(result)
    }
  }

}
