import Foundation
import UIKit

protocol SplashView {}

class SplashViewController: UIViewController {
	// MARK: - Constants

	// MARK: - Outlets

	// MARK: - Variables

	var presenter: SplashPresenter!

	// MARK: - UIViewController Methods

	override func viewDidLoad() {
		super.viewDidLoad()
		log.debug("Splash画面起動")

		presenter.didFinishPrepare()
	}
}

// MARK: - Actions

extension SplashViewController {}

// MARK: - Private Methods

extension SplashViewController {}

// MARK: - Public Methods

extension SplashViewController {}

// MARK: - Delegate Methods

extension SplashViewController: SplashView {}
