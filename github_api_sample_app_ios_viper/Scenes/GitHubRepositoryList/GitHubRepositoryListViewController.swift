import Foundation
import SafariServices
import UIKit

protocol GitHubRepositoryListView {
    func initView()
    func updateGitHubRepository(repository: [GitHubUserRepositry])
    func openSafariView(url: String)
}

class GitHubRepositoryListViewController: UIViewController {
    // MARK: - Constants

    private let tableView = UITableView()

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: GitHubRepositoryListPresenter!

    var searchKeyword: String = ""

    var githubRepository: [GitHubUserRepositry] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("GitHubRepositoryList画面起動")
        log.debug("検索キーワード:\(searchKeyword)")

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

extension GitHubRepositoryListViewController: GitHubRepositoryListView {
    func initView() {
        navigationItem.title = "GitHubRepository"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GitHubUserRepositoryCell.self, forCellReuseIdentifier: "githubUserCell")
    }

    func updateGitHubRepository(repository: [GitHubUserRepositry]) {
        githubRepository = repository
    }

    func openSafariView(url: String) {
        guard let url = URL(string: url) else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
}

// MARK: - UITableViewController Methods

extension GitHubRepositoryListViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        githubRepository.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "githubUserCell", for: indexPath) as? GitHubUserRepositoryCell
        cell?.createCell(githubUserRepository: githubRepository[indexPath.row])
        return cell ?? GitHubUserRepositoryCell()
    }
}

// MARK: - UITableViewDelegate Methods

extension GitHubRepositoryListViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let githubRepository = githubRepository[indexPath.row]
        presenter.tappedRepositoryCell(repository: githubRepository)
    }
}
