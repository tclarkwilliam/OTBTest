import UIKit

class HotelViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var loadingView: UIView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var facilitiesLabel: UILabel!

  let viewModel = HotelViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.fetchHotel()
  }

  private func fetchHotel() {
    self.viewModel.fetchHotel {
      [weak self]
      (hotel) in
      self?.configureLabels(hotel: hotel)
      self?.loadingView.isHidden = true
    }
  }

  private func configureLabels(hotel: Hotel) {
    self.nameLabel.text = hotel.name
    self.locationLabel.text = hotel.location
    self.ratingLabel.text = String(hotel.rating)
    self.descriptionLabel.text = hotel.description
    self.facilitiesLabel.text = hotel.facilities.joined(separator: "\n")
    self.configureImage(hotel: hotel)
  }

  private func configureImage(hotel: Hotel) {
    let imageString = hotel.images[0]
    if let url = URL(string: imageString) {
      guard let data = try? Data.init(contentsOf: url) else { return }
      self.imageView.image = UIImage(data: data)
    }
  }

}
