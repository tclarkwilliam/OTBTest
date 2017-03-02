import Quick
import Nimble

@testable import OTBTest

class HotelViewControllerSpec: QuickSpec {
  override func spec() {

    var subject: HotelViewController!
    var mockViewModel: MockHotelViewModel!
    var dictionary: JSONDictionary!
    var hotel: Hotel!

    describe("fetchHotel") {

      beforeEach {
        dictionary = ResultLoader.loadHotel(forClass: HotelViewControllerSpec.self)
        hotel = Hotel(dictionary)
        subject = StoryboardLoader.load(HotelViewController.self)
        mockViewModel = MockHotelViewModel()
        subject.viewModel = mockViewModel
        _ = subject.view
        subject.viewDidLoad()
        mockViewModel.completion?(hotel, nil)
      }

      it("hides the loading view") {
        expect(subject.loadingView.isHidden).to(beTrue())
      }

      it("sets the name label") {
        expect(subject.nameLabel.text).to(equal(hotel.name))
      }

      it("sets the location label") {
        expect(subject.locationLabel.text).to(equal(hotel.location))
      }

      it("sets the rating label") {
        expect(subject.ratingLabel.text).to(equal("★★★★"))
      }

      it("sets the description label") {
        expect(subject.descriptionLabel.text).to(equal(hotel.description))
      }

      it("sets the facilities label") {
        let facilities = ["24 Hour Reception",
                          "Aerobics",
                          "Air Conditioning"].joined(separator: "\n")
        expect(subject.facilitiesLabel.text).to(equal(facilities))
      }

    }

  }
}

extension HotelViewControllerSpec {

  class MockHotelViewModel: HotelViewModel {

    var completion: ((Hotel?, Error?) -> Void)?
    override func fetchHotel(completion: @escaping (Hotel?, Error?) -> Void) {
      self.completion = completion
    }
  }
  
}
