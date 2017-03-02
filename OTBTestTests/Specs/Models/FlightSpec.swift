import Quick
import Nimble

@testable import OTBTest

class FlightSpec: QuickSpec {
  override func spec() {

    describe("flight") {

      var subject: Flight!
      var flight: JSONDictionary!
      var date: Date!

      beforeEach {
        flight = ResultLoader.loadFlight(forClass: FlightSpec.self)
        subject = Flight(flight)
      }

      context("valid") {

        it("should not be nil") {
          expect(subject).toNot(beNil())
        }

        it("sets the departure date") {
          date = Date(fromString: "2016-10-20T10:00:00Z", withFormat: dateFormat)
          expect(subject.departureDate).to(equal(date))
        }

        it("sets the arrival date") {
          date = Date(fromString: "2016-10-20T11:00:00Z", withFormat: dateFormat)
          expect(subject.arrivalDate).to(equal(date))
        }

        it("sets the departure airport") {
          expect(subject.departureAirport).to(equal("London Gatwick"))
        }

        it("sets the arrival airport") {
          expect(subject.arrivalAirport).to(equal("Barcelona"))
        }

        it("set the price") {
          expect(subject.price).to(equal(12300))
        }

        it("set the airline") {
          expect(subject.airline).to(equal("FastJet"))
        }

      }

      context("no departure date") {

        beforeEach {
          flight["departure_date"] = nil
          subject = Flight(flight)
        }

        it("does not create the flight") {
          expect(subject).to(beNil())
        }
        
      }

      context("no arrival date") {

        beforeEach {
          flight["arrival_date"] = nil
          subject = Flight(flight)
        }

        it("does not create the flight") {
          expect(subject).to(beNil())
        }

      }

      context("no departure airport") {

        beforeEach {
          flight["departure_airport"] = nil
          subject = Flight(flight)
        }

        it("does not create the flight") {
          expect(subject).to(beNil())
        }
        
      }

      context("no arrival airport") {

        beforeEach {
          flight["arrival_airport"] = nil
          subject = Flight(flight)
        }

        it("does not create the flight") {
          expect(subject).to(beNil())
        }

      }

      context("no price") {

        beforeEach {
          flight["price"] = nil
          subject = Flight(flight)
        }

        it("does not create the flight") {
          expect(subject).to(beNil())
        }
        
      }

      context("no airline") {

        beforeEach {
          flight["airline"] = nil
          subject = Flight(flight)
        }

        it("does not create the flight") {
          expect(subject).to(beNil())
        }

      }

    }
  }
}
