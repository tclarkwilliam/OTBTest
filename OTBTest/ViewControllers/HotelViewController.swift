import UIKit

class HotelViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var loadingView: UIView!

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
      self?.navigationItem.title = "Hotel Details"
    }
  }

  private func configureLabels(hotel: Hotel) {
    self.descriptionLabel.text = hotel.description
    let imageString = hotel.images[0]
    if let url = URL(string: imageString) {
      guard let data = try? Data.init(contentsOf: url) else { return }
      self.imageView.image = UIImage(data: data)
    }
  }

}
