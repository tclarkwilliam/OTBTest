import Quick
import Nimble

@testable import OTBTest

class HotelSpec: QuickSpec {
  override func spec() {

    describe("Hotel") {

      var subject: Hotel!
      var dictionary: JSONDictionary!

      beforeEach {
        dictionary = ResultLoader.loadHotel(forClass: HotelSpec.self)
        subject = Hotel(dictionary)
      }

      context("valid") {

        it("should not be nil") {
          expect(subject).toNot(beNil())
        }

        it("sets the name") {
          expect(subject.name).to(equal("Labranda Isla Bonita Hotel"))
        }

        it("sets the location") {
          expect(subject.location).to(equal("Costa Adeje, Tenerife, Canaries"))
        }

        it("sets the rating") {
          expect(subject.rating).to(equal(4))
        }

        it("sets the description") {
          expect(subject.description).toNot(beNil())
        }

        it("sets the images") {
          expect(subject.images.count).to(equal(3))
        }

        it("sets the facilities") {
          expect(subject.facilities.count).to(equal(3))
        }

      }

      context("no name") {

        beforeEach {
          dictionary["name"] = nil
          subject = Hotel(dictionary)
        }

        it("does not create the hotel") {
          expect(subject).to(beNil())
        }

      }

      context("no location") {

        beforeEach {
          dictionary["hotel_location"] = nil
          subject = Hotel(dictionary)
        }

        it("does not create the hotel") {
          expect(subject).to(beNil())
        }

      }

      context("no rating") {

        beforeEach {
          dictionary["rating"] = nil
          subject = Hotel(dictionary)
        }

        it("does not create the hotel") {
          expect(subject).to(beNil())
        }

      }

      context("no description") {

        beforeEach {
          dictionary["description"] = nil
          subject = Hotel(dictionary)
        }

        it("does not create the hotel") {
          expect(subject).to(beNil())
        }

      }

      context("no images") {

        beforeEach {
          dictionary["images"] = nil
          subject = Hotel(dictionary)
        }

        it("does not create the hotel") {
          expect(subject).to(beNil())
        }

      }

      context("no facilities") {

        beforeEach {
          dictionary["facilities"] = nil
          subject = Hotel(dictionary)
        }

        it("does not create the hotel") {
          expect(subject).to(beNil())
        }

      }

    }

  }
}
