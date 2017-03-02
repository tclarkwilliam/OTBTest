import Quick
import Nimble

@testable import OTBTest

class FlightCellSpec: QuickSpec {
  override func spec() {

    var subject: FlightCell!
    var dictionary: JSONDictionary!
    var flight: Flight!
    let airlineLabel = UILabel()
    let departureDateLabel = UILabel()
    let arrivalDateLabel = UILabel()
    let priceLabel = UILabel()
    let departureAirportLabel = UILabel()
    let arrivalAirportLabel = UILabel()
    let departureDayLabel = UILabel()
    let arrivalDayLabel = UILabel()

    describe("configure") {

      beforeEach {
        subject = FlightCell()
        dictionary = ResultLoader.loadFlight(forClass: FlightCellSpec.self)
        flight = Flight(dictionary)
        subject.airlineLabel = airlineLabel
        subject.departureDateLabel = departureDateLabel
        subject.arrivalDateLabel = arrivalDateLabel
        subject.priceLabel = priceLabel
        subject.departureAirportLabel = departureAirportLabel
        subject.arrivalAirportLabel = arrivalAirportLabel
        subject.departureDayLabel = departureDayLabel
        subject.arrivalDayLabel = arrivalDayLabel
        subject.configure(flight: flight)
      }

      it("sets the airline label") {
        expect(airlineLabel.text).to(equal(flight.airline))
      }

      it("sets the departure date label") {
        let departureDate = Date.string(flight.departureDate)
        expect(departureDateLabel.text).to(equal(departureDate))
      }

      it("sets the arrival date label") {
        let arrivalDate = Date.string(flight.arrivalDate)
        expect(arrivalDateLabel.text).to(equal(arrivalDate))
      }

      it("sets the price label") {
        let price = CurrencyFormatter.shared.string(from: flight.price as NSNumber)
        expect(priceLabel.text).to(equal(price))
      }

      it("sets the departure airport label") {
        expect(departureAirportLabel.text).to(equal(flight.departureAirport))
      }

      it("sets the arrival airport label") {
        expect(arrivalAirportLabel.text).to(equal(flight.arrivalAirport))
      }

      it("sets the departure day label") {
        let departureDay = "\(Date.day(flight.departureDate)) \(Date.time(flight.departureDate))"
        expect(departureDayLabel.text).to(equal(departureDay))
      }

      it("sets the arrival day label") {
        let arrivalDay = "\(Date.day(flight.arrivalDate)) \(Date.time(flight.arrivalDate))"
        expect(arrivalDayLabel.text).to(equal(arrivalDay))
      }

    }

  }
}
