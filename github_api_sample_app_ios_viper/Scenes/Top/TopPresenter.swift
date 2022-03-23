import Foundation

protocol TopPresenter {
    func didFinishPrepare()
    func searchButtonTapped(accessToken: String)
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

    func searchButtonTapped(accessToken: String) {}
}