import Foundation

protocol SplashPresenter {
	func didFinishPrepare()
}

class SplashPresenterImpl: SplashPresenter {
	let view: SplashView
	let router: SplashRouter

	init(view: SplashViewController,
	     router: SplashRouter)
	{
		self.view = view
		self.router = router
	}

	func didFinishPrepare() {
		router.gotoTop()
	}
}
