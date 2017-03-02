import UIKit

class FlightsViewControllerDataSource: NSObject,
                                       UICollectionViewDataSource,
                                       UICollectionViewDelegate,
                                       UICollectionViewDelegateFlowLayout {

  private let flights: [Flight]

  init(flights: [Flight]) {
    self.flights = flights
  }

  // MARK: UICollectionViewDataSource

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return self.flights.count
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = self.dequeueCellFor(collectionView: collectionView, indexPath: indexPath)
    cell.configure(flight: self.flights[indexPath.item])
    return cell
  }

  private func dequeueCellFor(collectionView: UICollectionView,
                              indexPath: IndexPath) -> FlightCell {
    let cellName = String(describing: FlightCell.self)
    // swiftlint:disable force_cast
    return collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! FlightCell
  }

  // MARK: UICollectionViewDelegateFlowLayout

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width - 32, height: 138)
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
  }
}
