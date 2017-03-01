import UIKit

class StoryboardLoader {

  static func load<T: UIViewController>(_ controller: T.Type) -> T {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
  }
  
}
