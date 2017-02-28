import Quick
import Nimble

@testable import OTBTest

class HotelViewModelSpec: QuickSpec {
  override func spec() {

    var subject: HotelViewModel!
    var mockWebService: MockWebService!

    describe("fetchHotel") {

      beforeEach {
        mockWebService = MockWebService()
        subject = HotelViewModel(webService: mockWebService)
        subject.fetchHotel { _ in }
      }

      it("returns hotel") {
        expect(mockWebService.hotelReturned).to(beTrue())
      }

    }

  }
}

extension HotelViewModelSpec {

  class MockWebService: WebService {

    var hotelReturned = false
    override func load<T>(_ resource: Resource<T>,
                          completion: @escaping (T, Error) -> Void) {
      self.hotelReturned = true
    }
    
  }
  
}
