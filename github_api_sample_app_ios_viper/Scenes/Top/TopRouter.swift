import Foundation
import UIKit

protocol TopRouter {}

class TopRouterImpl: TopRouter {
    let viewController: TopViewController

    init(view: TopViewController) {
        viewController = view
    }
}
