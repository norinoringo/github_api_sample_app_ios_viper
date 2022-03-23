import Foundation
import UIKit

protocol GitHubUserRepositoryView {
    func initView()
}

class GitHubUserRepositoryViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Outlets

    @IBOutlet var userDetailView: UIView!
    @IBOutlet var userRepositoryTableView: UITableView!

    // MARK: - Variables

    var presenter: GitHubUserRepositoryPresenter!

    var accessToken: String = ""
    var githubUser: GitHubUser!

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("GitHubUserRepository画面起動")
        log.debug("accessToken:\(accessToken)")
        log.debug("githubUser:\(githubUser)")

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

extension GitHubUserRepositoryViewController: GitHubUserRepositoryView {
    func initView() {}
}
