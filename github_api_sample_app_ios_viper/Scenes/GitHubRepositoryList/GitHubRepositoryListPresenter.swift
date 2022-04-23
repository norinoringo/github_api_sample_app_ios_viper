import Foundation

protocol GitHubRepositoryListPresenter {
    func didFinishPrepare(searchKeyword: String?)
    func tappedRepositoryCell(repository: GitHubUserRepositry)
}

class GitHubRepositoryListPresenterImpl: GitHubRepositoryListPresenter {
    let view: GitHubRepositoryListView
    let router: GitHubRepositoryListRouter
    let fetchGitHubRepositoryUseCase: FetchGitHubRepositoryListUseCase

    init(view: GitHubRepositoryListViewController,
         router: GitHubRepositoryListRouter,
         fetchGitHubRepositoryUseCase: FetchGitHubRepositoryListUseCase)
    {
        self.view = view
        self.router = router
        self.fetchGitHubRepositoryUseCase = fetchGitHubRepositoryUseCase
    }

    func didFinishPrepare(searchKeyword: String?) {
        view.initView()
        fetchGitHubRepository(searchKeyword: searchKeyword)
    }

    func tappedRepositoryCell(repository: GitHubUserRepositry) {
        view.openSafariView(url: repository.url)
    }

    private func fetchGitHubRepository(searchKeyword: String?) {
        let input = FetchGitHubRepositoryListUseCaseInput(searchKeyword: searchKeyword)
        fetchGitHubRepositoryUseCase.fetchGitHubRepository(input: input)
            .then { [weak self] result in
                log.debug("\(result)")
                let githubRepository: [GitHubUserRepositry] = result.githubRepository.items
                self?.view.updateGitHubRepository(repository: githubRepository)
            }.catch { [weak self] _ in
                self?.view.showErrorDialog()
            }
    }
}
