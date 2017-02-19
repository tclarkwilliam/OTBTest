import Foundation

typealias FlightsResponse = ([Flight]) -> Void

class FlightsViewModel {

  func fetchFlights(completion: @escaping FlightsResponse) {
    WebService().load(Flight.resource) {
      result in
      completion(result)
    }
  }

}
