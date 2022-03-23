import Foundation
import SafariServices
import UIKit

protocol GitHubUserRepositoryView {
    func initView()
    func updateUserDetailView(userDetail: GitHubUserDetail)
    func updateUserRepository(userRepository: [GitHubUserRepositry])
    func openSafariView(url: String)
}

class GitHubUserRepositoryViewController: UIViewController {
    // MARK: - Constants

    private let sectionTitle = ["ユーザーリポジトリ"]

    // MARK: - Outlets

    @IBOutlet var userDetailView: GitHubUserDetailView!
    @IBOutlet var userRepositoryTableView: UITableView!

    // MARK: - Variables

    var presenter: GitHubUserRepositoryPresenter!

    var accessToken: String = ""
    var githubUser: GitHubUser!

    var githubUserRepository: [GitHubUserRepositry] = [] {
        didSet {
            userRepositoryTableView.reloadData()
        }
    }

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("GitHubUserRepository画面起動")
        log.debug("accessToken:\(accessToken)")
        log.debug("githubUser:\(githubUser)")

        presenter.didFinishPrepare(accessToken: accessToken, githubUser: githubUser)
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
        navigationItem.title = "GitHubUserRepository"
        userRepositoryTableView.delegate = self
        userRepositoryTableView.dataSource = self
        userRepositoryTableView.register(GitHubUserRepositoryCell.self, forCellReuseIdentifier: "githubUserCell")
    }

    func updateUserDetailView(userDetail: GitHubUserDetail) {
        userDetailView.createCell(githubUserDetail: userDetail)
    }

    func updateUserRepository(userRepository: [GitHubUserRepositry]) {
        githubUserRepository = userRepository
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
        return cell ?? GitHubUserRepositoryCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
}

// MARK: - UITableViewDelegate Methods

extension GitHubUserRepositoryViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let githubUserRepository = githubUserRepository[indexPath.row]
        presenter.tappedRepositoryCell(userRepository: githubUserRepository)
    }
}
