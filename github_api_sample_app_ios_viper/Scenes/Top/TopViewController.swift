import Foundation
import UIKit

protocol TopView {}

class TopViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: TopPresenter!

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("Top画面起動")

        presenter.didFinishPrepare()
    }
}

// MARK: - Actions

extension TopViewController {}

// MARK: - Private Methods

extension TopViewController {}

// MARK: - Public Methods

extension TopViewController {}

// MARK: - Delegate Methods

extension TopViewController: TopView {}
