import Foundation
import SafariServices
import UIKit

protocol GitHubUserRepositoryView {
    func initView()
    func openSafariView(url: String)
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

    var githubUserRepository: [GitHubUserRepositry] = []

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
    func initView() {
        userRepositoryTableView.delegate = self
        userRepositoryTableView.dataSource = self
        userRepositoryTableView.register(GitHubUserCell.self, forCellReuseIdentifier: "githubUserCell")
    }

    func openSafariView(url: String) {
        guard let url = URL(string: url) else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
}

// MARK: - UITableViewController Methods

extension GitHubUserRepositoryViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        githubUserRepository.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "githubUserCell", for: indexPath) as? GitHubUserRepositoryCell
        cell?.createCell(githubUserRepository: githubUserRepository[indexPath.row])
        return cell!
    }
}

// MARK: - UITableViewDelegate Methods

extension GitHubUserRepositoryViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let githubUserRepository = githubUserRepository[indexPath.row]
        presenter.tappedRepositoryCell(userRepository: githubUserRepository)
    }
}
