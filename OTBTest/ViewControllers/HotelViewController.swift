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
    self.title = "Hotel"
    self.fetchHotel()
  }

  private func fetchHotel() {
    self.viewModel.fetchHotel {
      [weak self]
      hotel in
      self?.configureLabels(hotel: hotel)
      self?.loadingView.isHidden = true
    }
  }

  private func configureLabels(hotel: Hotel) {
    let presenter = HotelViewControllerPresenter(hotel: hotel)
    self.nameLabel.text = hotel.name
    self.locationLabel.text = hotel.location
    self.ratingLabel.text = presenter.renderRating()
    self.descriptionLabel.text = hotel.description
    self.facilitiesLabel.text = presenter.renderFacilities()
    self.imageView.image = presenter.renderImage()
  }

}
