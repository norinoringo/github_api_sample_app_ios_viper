import Foundation

protocol GitHubRepositoryListPresenter {
    func didFinishPrepare()
    func tappedRepositoryCell(repository: GitHubUserRepositry)
}

class GitHubRepositoryListPresenterImpl: GitHubRepositoryListPresenter {
    let view: GitHubRepositoryListView
    let router: GitHubRepositoryListRouter

    init(view: GitHubRepositoryListViewController,
         router: GitHubRepositoryListRouter)
    {
        self.view = view
        self.router = router
    }

    func didFinishPrepare() {}

    func tappedRepositoryCell(repository: GitHubUserRepositry) {
        view.openSafariView(url: repository.url)
    }
}
