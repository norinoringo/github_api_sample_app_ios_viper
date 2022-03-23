import Foundation

protocol GitHubUserRepositoryPresenter {
    func didFinishPrepare(accessToken: String, githubUser: GitHubUser)
    func tappedRepositoryCell(userRepository: GitHubUserRepositry)
}

class GitHubUserRepositoryPresenterImpl: GitHubUserRepositoryPresenter {
    let view: GitHubUserRepositoryView
    let router: GitHubUserRepositoryRouter
    let fetchGitHubUserDetailUseCase: FetchGitHubUserDetailUseCase
    let fetchGitHubUserRepositoryUseCase: FetchGitHubUserRepositoryUseCase

    init(view: GitHubUserRepositoryViewController,
         router: GitHubUserRepositoryRouter,
         fetchGitHubUserDetailUseCase: FetchGitHubUserDetailUseCase,
         fetchGitHubUserRepositoryUseCase: FetchGitHubUserRepositoryUseCase)
    {
        self.view = view
        self.router = router
        self.fetchGitHubUserDetailUseCase = fetchGitHubUserDetailUseCase
        self.fetchGitHubUserRepositoryUseCase = fetchGitHubUserRepositoryUseCase
    }

    func didFinishPrepare(accessToken: String, githubUser: GitHubUser) {
        view.initView()
        fetchGitHubUserDetailUserRepository(accessToken: accessToken, githubUser: githubUser)
    }

    func tappedRepositoryCell(userRepository: GitHubUserRepositry) {
        let url = userRepository.url
        view.openSafariView(url: url)
    }

    private func fetchGitHubUserDetailUserRepository(accessToken: String, githubUser: GitHubUser) {
        let input = FetchGitHubUserDetailUseCaseInput(accessToken: accessToken, githubUser: githubUser)
        fetchGitHubUserDetailUseCase.fetchGitHubUserList(input: input)
            .then { result in
                log.debug("\(result)")
                self.view.updateUserDetailView(userDetail: result.gitHubUerDetail)
                let repositoryInput = FetchGitHubUserRepositoryUseCaseInput(accessToken: accessToken, githubUser: githubUser)
                self.fetchGitHubUserRepositoryUseCase.fetchGitHubUserList(input: repositoryInput)
                    .then { result in
                        log.debug("\(result)")
                        self.view.updateUserRepository(userRepository: result.gitHubUerRepository)
                    }.catch { _ in
                    }
            }
    }
}
