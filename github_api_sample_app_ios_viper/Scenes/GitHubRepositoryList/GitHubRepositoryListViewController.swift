import Foundation
import UIKit

protocol GitHubRepositoryListView {}

class GitHubRepositoryListViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: GitHubRepositoryListPresenter!

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("GitHubRepositoryList画面起動")

        presenter.didFinishPrepare()
    }
}

// MARK: - Actions

extension GitHubRepositoryListViewController {}

// MARK: - Private Methods

extension GitHubRepositoryListViewController {}

// MARK: - Public Methods

extension GitHubRepositoryListViewController {}

// MARK: - Delegate Methods

extension GitHubRepositoryListViewController: GitHubRepositoryListView {}
