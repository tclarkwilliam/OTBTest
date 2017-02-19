import Foundation

extension Date {

  init?(fromString string: String?, withFormat: String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = withFormat
    guard let dateString = string,
      let date = dateFormatter.date(from: dateString) else { return nil }
    self.init(timeIntervalSince1970: date.timeIntervalSince1970)
  }

  static func date(_ dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ssZ"
    return dateFormatter.date(from: dateString)
  }

  static func string(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM yyyy"
    return dateFormatter.string(from: date)
  }

  static func day(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "eee"
    return dateFormatter.string(from: date)
  }

  static func time(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mm a"
    return dateFormatter.string(from: date)
  }

}
