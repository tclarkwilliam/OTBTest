import Foundation

class CurrencyFormatter {

  static let shared: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.multiplier = 0.01
    return formatter
  }()

}
