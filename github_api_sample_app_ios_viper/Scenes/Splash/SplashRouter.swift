import Foundation
import UIKit

protocol SplashRouter {
	func gotoTop()
}

class SplashRouterImpl: SplashRouter {
	let viewController: SplashViewController

	init(view: SplashViewController) {
		viewController = view
	}

	func gotoTop() {
//		guard let nextView = R.storyboard.top.topViewController() else { return }
//		let configurator = TopConfiguratorImpl()
//		configurator.configure(dependency: nextView)
//		viewController.navigationController?.pushViewController(nextView, animated: true)
	}
}
