import Foundation
import UIKit

protocol TopView {
    func initView()
}

enum GithubAPITypeCell {
    case searchGitHubUser
    case searchGitHubRepository
}

class TopViewController: UIViewController {
    // MARK: - Constants

    private let tableView = UITableView()

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: TopPresenter!

    private var githubAPICellList: [GithubAPITypeCell] = []

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("Top画面起動")

        presenter.didFinishPrepare()
    }
}

// MARK: - Actions

extension TopViewController {}

// MARK: - Private Methods

extension TopViewController {
    private func initNavigationController() {
        navigationItem.hidesBackButton = true
    }

    private func initGitHubAPICellList() {
        githubAPICellList.append(GithubAPITypeCell.searchGitHubUser)
        githubAPICellList.append(GithubAPITypeCell.searchGitHubRepository)
    }
}

// MARK: - Public Methods

extension TopViewController {}

// MARK: - Delegate Methods

extension TopViewController: TopView {
    func initView() {
        title = "GitHub検索アプリ"
        // テーブルビュー初期化、関連付け
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GitHubAPICell.self, forCellReuseIdentifier: "githubAPICell")
        view.addSubview(tableView)

        initNavigationController()
        initGitHubAPICellList()
    }
}

// MARK: - UITableViewController Methods

extension TopViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        githubAPICellList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "githubAPICell", for: indexPath) as? GitHubAPICell
        cell?.createCell(cellType: githubAPICellList[indexPath.row])
        return cell ?? GitHubAPICell()
    }
}

// MARK: - UITableViewDelegate Methods

extension TopViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let apiType = githubAPICellList[indexPath.row]
        presenter.tappedCell(apiType: apiType)
    }
}
