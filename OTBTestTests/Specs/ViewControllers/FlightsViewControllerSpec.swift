import Quick
import Nimble

@testable import OTBTest

class FlightsViewControllerSpec: QuickSpec {
  override func spec() {

    var subject: FlightsViewController!
    var mockViewModel: MockFlightsViewModel!
    var flight: [Flight]!

    describe("fetchFlights") {

      beforeEach {
        let dictionary = JSONLoader.load("flight", forClass: FlightsViewControllerSpec.self)!
        let flights = dictionary["flights"] as! [JSONDictionary]
        flight = flights.flatMap(Flight.init)
        subject = StoryboardLoader.load(FlightsViewController.self)
        mockViewModel = MockFlightsViewModel()
        subject.viewModel = mockViewModel
        _ = subject.view
        subject.viewDidLoad()
        mockViewModel.completion?(flight, nil)
      }

      it("sets the heading label") {
        expect(subject.headingLabel.text).to(equal("18 flights available"))
      }
      
    }

  }
}

extension FlightsViewControllerSpec {

  class MockFlightsViewModel: FlightsViewModel {

    var completion: (([Flight]?, Error?) -> Void)?
    override func fetchFlights(completion: @escaping ([Flight]?, Error?) -> Void) {
      self.completion = completion
    }
  }

}
