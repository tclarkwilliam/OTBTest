import UIKit

class FlightCell: UICollectionViewCell {

  @IBOutlet weak var airlineLabel: UILabel!
  @IBOutlet weak var departureDateLabel: UILabel!
  @IBOutlet weak var arrivalDateLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var departureAirportLabel: UILabel!
  @IBOutlet weak var arrivalAirportLabel: UILabel!
  @IBOutlet weak var departureDayLabel: UILabel!
  @IBOutlet weak var arrivalDayLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.lightGray.cgColor
  }

  func configure(flight: Flight) {
    self.airlineLabel.text = flight.airline
    self.priceLabel.text = CurrencyFormatter.shared.string(from: flight.price as NSNumber)
    self.departureDateLabel.text = Date.string(flight.departureDate)
    self.arrivalDateLabel.text = Date.string(flight.arrivalDate)
    self.departureAirportLabel.text = flight.departureAirport
    self.arrivalAirportLabel.text = flight.arrivalAirport
    self.departureDayLabel.text = "\(Date.day(flight.departureDate)) \(Date.time(flight.departureDate))"
    self.arrivalDayLabel.text = "\(Date.day(flight.arrivalDate)) \(Date.time(flight.arrivalDate))"
  }
}
