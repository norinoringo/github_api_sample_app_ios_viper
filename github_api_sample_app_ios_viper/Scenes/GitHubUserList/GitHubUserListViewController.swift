import Foundation
import UIKit

protocol GitHubUserListView {}

class GitHubUserListViewController: UIViewController {
    // MARK: - Constants

    let accessToken: String = ""

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: GitHubUserListPresenter!

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("GitHubUserList画面起動")

        presenter.didFinishPrepare()
    }
}

// MARK: - Actions

extension GitHubUserListViewController {}

// MARK: - Private Methods

extension GitHubUserListViewController {}

// MARK: - Public Methods

extension GitHubUserListViewController {}

// MARK: - Delegate Methods

extension GitHubUserListViewController: GitHubUserListView {}
