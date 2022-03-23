import Foundation

protocol GitHubUserListPresenter {
    func didFinishPrepare(accessToken: String)
}

class GitHubUserListPresenterImpl: GitHubUserListPresenter {
    let view: GitHubUserListView
    let router: GitHubUserListRouter
    let fetchGitHubUserListUseCase: FetchGitHubUserListUseCase

    init(view: GitHubUserListViewController,
         router: GitHubUserListRouter,
         fetchGitHubUserListUseCase: FetchGitHubUserListUseCase)
    {
        self.view = view
        self.router = router
        self.fetchGitHubUserListUseCase = fetchGitHubUserListUseCase
    }

    func didFinishPrepare(accessToken: String) {
        let input = FetchGitHubUserListUseCaseInput(accessToken: accessToken)
        fetchGitHubUserListUseCase.fetchGitHubUserList(input: input)
            .then { result in
                log.debug("\(result)")
            }.catch { _ in
            }
    }
}
