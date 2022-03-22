import Foundation

protocol TopPresenter {
    func didFinishPrepare()
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

    func didFinishPrepare() {}
}
