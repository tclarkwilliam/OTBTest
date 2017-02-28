import UIKit

class FlightsViewController: UIViewController {

  @IBOutlet weak var headingLabel: UILabel!
  @IBOutlet weak var collectionView: UICollectionView!

  private let viewModel = FlightsViewModel()
  private(set) var dataSource: FlightsViewControllerDataSource?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.registerCell()
    self.fetchFlights()
  }

  private func registerCell() {
    let cellName = String(describing: FlightCell.self)
    let nib = UINib(nibName: cellName, bundle: nil)
    self.collectionView.register(nib, forCellWithReuseIdentifier: cellName)
  }

  private func fetchFlights() {
    self.viewModel.fetchFlights {
      [weak self]
      flights, error in
      if let flights = flights {
        self?.headingLabel.text = "\(flights.count) flights available"
        self?.configureDataSource(flights: flights)
      }
    }
  }

  private func configureDataSource(flights: [Flight]) {
    self.dataSource = FlightsViewControllerDataSource(flights: flights)
    self.collectionView.dataSource = self.dataSource
    self.collectionView.delegate = self.dataSource
  }

}
