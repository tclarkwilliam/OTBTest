import Quick
import Nimble

@testable import OTBTest

class FlightsViewModelSpec: QuickSpec {
  override func spec() {

    var subject: FlightsViewModel!
    var mockWebService: MockWebService!

    describe("fetchFlights") {

      beforeEach {
        mockWebService = MockWebService()
        subject = FlightsViewModel(webService: mockWebService)
        subject.fetchFlights { _ in }
      }

      it("returns flights") {
        expect(mockWebService.flightsReturned).to(beTrue())
      }

    }

  }
}

extension FlightsViewModelSpec {

  class MockWebService: WebService {

    var flightsReturned = false
    override func load<T>(_ resource: Resource<T>,
                          completion: @escaping (T, Error) -> Void) {
      self.flightsReturned = true
    }
    
  }
  
}
