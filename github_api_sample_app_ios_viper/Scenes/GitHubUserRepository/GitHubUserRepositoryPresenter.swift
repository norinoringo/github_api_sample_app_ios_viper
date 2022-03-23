import Foundation

protocol GitHubUserRepositoryPresenter {
    func didFinishPrepare()
    func tappedRepositoryCell(userRepository: GitHubUserRepositry)
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

    func tappedRepositoryCell(userRepository: GitHubUserRepositry) {
        let url = userRepository.url
        view.openSafariView(url: url)
    }
}
