import Foundation

protocol TopPresenter {
    func didFinishPrepare()
    func tappedCell(apiType: GithubAPITypeCell)
}

class TopPresenterImpl: TopPresenter {
    let view: TopView
    let router: TopRouter

    init(view: TopViewController,
         router: TopRouter)
    {
        self.view = view
        self.router = router
    }

    func didFinishPrepare() {
        view.initView()
    }

    func tappedCell(apiType: GithubAPITypeCell) {
        switch apiType {
        case .searchGitHubUser:
            router.gotoGitHubUserList()
        case .searchGitHubRepository:
            router.gotoGitHubRepositoryList()
        }
    }
}
