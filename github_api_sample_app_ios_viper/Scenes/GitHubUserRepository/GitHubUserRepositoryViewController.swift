import Foundation
import UIKit

protocol GitHubUserRepositoryView {}

class GitHubUserRepositoryViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Outlets

    @IBOutlet var userDetailView: UIView!
    @IBOutlet var userRepositoryTableView: UITableView!

    // MARK: - Variables

    var presenter: GitHubUserRepositoryPresenter!

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("GitHubUserRepository画面起動")

        presenter.didFinishPrepare()
    }
}

// MARK: - Actions

extension GitHubUserRepositoryViewController {}

// MARK: - Private Methods

extension GitHubUserRepositoryViewController {}

// MARK: - Public Methods

extension GitHubUserRepositoryViewController {}

// MARK: - Delegate Methods

extension GitHubUserRepositoryViewController: GitHubUserRepositoryView {}
