import Foundation

protocol GitHubUserRepositoryPresenter {
    func didFinishPrepare(accessToken: String, githubUser: GitHubUser)
    func tappedRepositoryCell(userRepository: GitHubUserRepositry)
}

class GitHubUserRepositoryPresenterImpl: GitHubUserRepositoryPresenter {
    let view: GitHubUserRepositoryView
    let router: GitHubUserRepositoryRouter
    let fetchGitHubUserDetailUseCase: FetchGitHubUserDetailUseCase
    let fetchGitHubUserRepositoryUseCase: FetchGitHubUserRepositoryListUseCase

    init(view: GitHubUserRepositoryViewController,
         router: GitHubUserRepositoryRouter,
         fetchGitHubUserDetailUseCase: FetchGitHubUserDetailUseCase,
         fetchGitHubUserRepositoryUseCase: FetchGitHubUserRepositoryListUseCase)
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
        fetchGitHubUserDetailUseCase.fetchGitHubUserDetail(input: input)
            .then { result in
                log.debug("\(result)")
                self.view.updateUserDetailView(userDetail: result.gitHubUerDetail)
                let repositoryInput = FetchGitHubUserRepositoryListUseCaseInput(accessToken: accessToken, githubUser: githubUser)
                self.fetchGitHubUserRepositoryUseCase.fetchGitHubUserRepositoryList(input: repositoryInput)
                    .then { [weak self] result in
                        log.debug("\(result)")
                        // fork = true をフィルターしている
                        let userRepositoryWithNonForked = result.gitHubUserRepository.filter { repo in !(repo.fork) }
                        self?.view.updateUserRepository(userRepository: userRepositoryWithNonForked)
                    }.catch { [weak self] _ in
                        self?.view.showErrorDialog()
                    }
            }
    }
}
