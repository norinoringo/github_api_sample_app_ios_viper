import Foundation
import UIKit

protocol GitHubUserListView {}

class GitHubUserListViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: GitHubUserListPresenter!

    var accessToken: String = ""

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("GitHubUserList画面起動")
        log.debug("accessToken:\(accessToken)")

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
