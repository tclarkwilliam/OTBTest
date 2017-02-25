import Foundation

class FlightsViewModel {

  private let webService: WebService

  init(webService: WebService = WebService()) {
    self.webService = webService
  }

  func fetchFlights(completion: @escaping ResponseCompletion<[Flight]>) {
    self.webService.load(Flight.resource) {
      result, error in
      completion(result, error)
    }
  }

}
