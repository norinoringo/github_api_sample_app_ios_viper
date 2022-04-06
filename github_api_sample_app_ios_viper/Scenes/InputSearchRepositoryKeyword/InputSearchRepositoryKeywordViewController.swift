import Foundation
import UIKit

protocol InputSearchRepositoryKeywordView {}

class InputSearchRepositoryKeywordViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: InputSearchRepositoryKeywordPresenter!

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("InputSearchRepositoryKeyword画面起動")

        presenter.didFinishPrepare()
    }
}

// MARK: - Actions

extension InputSearchRepositoryKeywordViewController {}

// MARK: - Private Methods

extension InputSearchRepositoryKeywordViewController {}

// MARK: - Public Methods

extension InputSearchRepositoryKeywordViewController {}

// MARK: - Delegate Methods

extension InputSearchRepositoryKeywordViewController: InputSearchRepositoryKeywordView {}
