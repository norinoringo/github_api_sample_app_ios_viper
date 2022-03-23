import Foundation

protocol GitHubUserListPresenter {
    func didFinishPrepare(accessToken: String)
    func tappedCell(accessToken: String, githubUser: GitHubUser)
}

class GitHubUserListPresenterImpl: GitHubUserListPresenter {
    let view: GitHubUserListView
    let router: GitHubUserListRouter
    let fetchGitHubUserListUseCase: FetchGitHubUserListUseCase

    var accessToken: String = ""

    init(view: GitHubUserListViewController,
         router: GitHubUserListRouter,
         fetchGitHubUserListUseCase: FetchGitHubUserListUseCase)
    {
        self.view = view
        self.router = router
        self.fetchGitHubUserListUseCase = fetchGitHubUserListUseCase
    }

    func didFinishPrepare(accessToken: String) {
        self.accessToken = accessToken
        view.initView()
        fetchGitHubUserList()
    }

    func tappedCell(accessToken: String, githubUser: GitHubUser) {
        log.debug(githubUser)
        router.gotoGitHubUserRepository(accessToken: accessToken, githubUser: githubUser)
    }

    private func fetchGitHubUserList() {
        let input = FetchGitHubUserListUseCaseInput(accessToken: accessToken)
        fetchGitHubUserListUseCase.fetchGitHubUserList(input: input)
            .then { result in
                log.debug("\(result)")
                self.view.reloadView(githubUserList: result.gitHubUerList)
            }.catch { _ in
            }
    }
}
