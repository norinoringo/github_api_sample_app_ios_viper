import Foundation

protocol InputSearchRepositoryKeywordPresenter {
    func didFinishPrepare()
    func searchButtonTapped(keyword: String)
}

class InputSearchRepositoryKeywordPresenterImpl: InputSearchRepositoryKeywordPresenter {
    let view: InputSearchRepositoryKeywordView
    let router: InputSearchRepositoryKeywordRouter

    init(view: InputSearchRepositoryKeywordViewController,
         router: InputSearchRepositoryKeywordRouter)
    {
        self.view = view
        self.router = router
    }

    func didFinishPrepare() {
        view.initView()
    }

    func searchButtonTapped(keyword: String) {
        router.gotoGitHubRepositoryList(keyword: keyword)
    }
}
