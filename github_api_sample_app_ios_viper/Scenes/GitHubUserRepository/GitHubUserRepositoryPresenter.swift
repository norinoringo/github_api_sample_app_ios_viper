import Foundation

protocol GitHubUserRepositoryPresenter {
    func didFinishPrepare()
}

class GitHubUserRepositoryPresenterImpl: GitHubUserRepositoryPresenter {
    let view: GitHubUserRepositoryView
    let router: GitHubUserRepositoryRouter

    init(view: GitHubUserRepositoryViewController,
         router: GitHubUserRepositoryRouter)
    {
        self.view = view
        self.router = router
    }

    func didFinishPrepare() {
        view.initView()
    }
}
