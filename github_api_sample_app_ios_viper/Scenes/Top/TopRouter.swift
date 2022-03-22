import Foundation
import UIKit

protocol TopRouter {
    func gotoTop()
}

class TopRouterImpl: TopRouter {
    let viewController: TopViewController

    init(view: TopViewController) {
        viewController = view
    }

    func gotoTop() {
        guard let nextView = R.storyboard.top.instantiateInitialViewController() else { return }
        let configurator = TopConfiguratorImpl()
        configurator.configure(dependency: nextView)
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }
}
