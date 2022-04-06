import Foundation

protocol InputSearchRepositoryKeywordPresenter {
    func didFinishPrepare()
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
}
