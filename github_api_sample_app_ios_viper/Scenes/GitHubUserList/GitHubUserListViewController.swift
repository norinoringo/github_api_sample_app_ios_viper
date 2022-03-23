import Foundation
import UIKit

protocol GitHubUserListView {
    func initView()
    func reloadView(githubUserList: [GitHubUser])
}

class GitHubUserListViewController: UIViewController {
    // MARK: - Constants

    private let tableView = UITableView()

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: GitHubUserListPresenter!

    var accessToken: String = ""
    var githubUserList: [GitHubUser] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("GitHubUserList画面起動")
        log.debug("accessToken:\(accessToken)")

        presenter.didFinishPrepare(accessToken: accessToken)
    }
}

// MARK: - Actions

extension GitHubUserListViewController {}

// MARK: - Private Methods

extension GitHubUserListViewController {}

// MARK: - Public Methods

extension GitHubUserListViewController {}

// MARK: - Delegate Methods

extension GitHubUserListViewController: GitHubUserListView {
    func initView() {
        title = "GitHubUser一覧"
        // テーブルビュー初期化、関連付け
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GitHubUserCell.self, forCellReuseIdentifier: "githubUserCell")
        view.addSubview(tableView)
    }

    func reloadView(githubUserList: [GitHubUser]) {
        self.githubUserList = githubUserList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            // reloadData時にdelayをかけないとスクロールインジケーターが表示されなかった
            self.tableView.flashScrollIndicators()
        }
    }
}

// MARK: - UITableViewController Methods

extension GitHubUserListViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        githubUserList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "githubUserCell", for: indexPath) as? GitHubUserCell
        cell?.createCell(githubUser: githubUserList[indexPath.row])
        return cell!
    }
}

// MARK: - UITableViewDelegate Methods

extension GitHubUserListViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let githubUser = githubUserList[indexPath.row]
        presenter.tappedCell(accessToken: accessToken, githubUser: githubUser)
    }
}
