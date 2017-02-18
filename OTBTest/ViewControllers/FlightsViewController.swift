import UIKit

class FlightsViewController: UIViewController {

  @IBOutlet weak var airlineLabel: UILabel!
  @IBOutlet weak var departureDateLabel: UILabel!
  @IBOutlet weak var arrivalDateLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var departureAirportLabel: UILabel!
  @IBOutlet weak var arrivalAirportLabel: UILabel!

  let viewModel = FlightViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Flights"
    self.fetchFlights()
  }

  private func fetchFlights() {
    self.viewModel.fetchFlights {
      flights in
      self.configureLabels(flights: flights)
    }
  }

  private func configureLabels(flights: [Flight]) {
    self.airlineLabel.text = flights.first?.airline
    self.departureDateLabel.text = flights.first?.departureDate
    self.arrivalDateLabel.text = flights.first?.arrivalDate
    self.priceLabel.text = "\(flights.first?.price)"
    self.departureAirportLabel.text = flights.first?.departureAirport
    self.arrivalAirportLabel.text = flights.first?.arrivalAirport
  }
}
