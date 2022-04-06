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
    var activityIndicatorView = UIActivityIndicatorView()

    var githubRepository: [GitHubUserRepositry] = [] {
        didSet {
            tableView.reloadData()
            stopIndicator()
        }
    }

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("GitHubRepositoryList画面起動")
        log.debug("検索キーワード:\(searchKeyword)")
        presenter.didFinishPrepare(searchKeyword: searchKeyword)
    }
}

// MARK: - Actions

extension GitHubRepositoryListViewController {}

// MARK: - Private Methods

extension GitHubRepositoryListViewController {
    private func initIndicator() {
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .large
        activityIndicatorView.color = .systemGray
        view.addSubview(activityIndicatorView)
    }

    private func startIndicator() {
        DispatchQueue.main.async {
            self.activityIndicatorView.startAnimating()
        }
    }

    private func stopIndicator() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
        }
    }
}

// MARK: - Public Methods

extension GitHubRepositoryListViewController {}

// MARK: - Delegate Methods

extension GitHubRepositoryListViewController: GitHubRepositoryListView {
    func initView() {
        navigationItem.title = "GitHubRepository"
        // テーブルビュー初期化、関連付け
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GitHubUserRepositoryCell.self, forCellReuseIdentifier: "githubUserCell")
        view.addSubview(tableView)

        initIndicator()
        startIndicator()
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
        return githubRepository.count
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
