import Foundation

protocol AcessTokenInputPresenter {
    func didFinishPrepare()
    func searchButtonTapped(accessToken: String)
}

class AccessTokenInputPresenterImpl: AcessTokenInputPresenter {
    let view: AccessTokenInputView
    let router: AccessTokenInputRouter

    init(view: AccessTokenInputViewController,
         router: AccessTokenInputRouter)
    {
        self.view = view
        self.router = router
    }

    func didFinishPrepare() {
        view.initView()
    }

    func searchButtonTapped(accessToken: String) {
        router.gotoGitHubUserList(accessToken: accessToken)
    }
}
