import Foundation

protocol GitHubUserListPresenter {
    func didFinishPrepare()
}

class GitHubUserListPresenterImpl: GitHubUserListPresenter {
    let view: GitHubUserListView
    let router: GitHubUserListRouter

    init(view: GitHubUserListViewController,
         router: GitHubUserListRouter)
    {
        self.view = view
        self.router = router
    }

    func didFinishPrepare() {}
}
