import Foundation

protocol SplashConfigurator {
	func configure(dependency: SplashViewController)
}

class SplashConfiguratorImpl: SplashConfigurator {
	func configure(dependency: SplashViewController) {
		let router = SplashRouterImpl(view: dependency)
		let presenter = SplashPresenterImpl(view: dependency, router: router)
		dependency.presenter = presenter
	}
}
