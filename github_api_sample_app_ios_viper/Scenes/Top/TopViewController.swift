import Foundation
import UIKit

protocol TopView {
    func initView()
}

class TopViewController: UIViewController {
    // MARK: - Constants

    let headerLabel = UILabel()
    let explainLabel = UILabel()
    let inputTokenTextField = UITextField()
    let searchButton = UIButton()

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: TopPresenter!

    var accessToken: String = ""

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("Top画面起動")

        presenter.didFinishPrepare()
    }
}

// MARK: - Actions

extension TopViewController {}

// MARK: - Private Methods

extension TopViewController {
    private func initHeaderLabel() {
        createHeaderLabel()
        activeConstaraintHeaderLabel()
    }

    private func createHeaderLabel() {
        headerLabel.text = "GitHubユーザー検索アプリ"
        headerLabel.textAlignment = .left
        headerLabel.font = UIFont.systemFont(ofSize: 20.0)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
    }

    private func activeConstaraintHeaderLabel() {
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }

    private func initExplainLabel() {
        createExplainLabel()
        activeConstaraintExplainLabel()
    }

    private func createExplainLabel() {
        explainLabel.text = "GitHubの personal access token \nを入力してください。"
        explainLabel.numberOfLines = 0
        explainLabel.textAlignment = .left
        explainLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(explainLabel)
    }

    private func activeConstaraintExplainLabel() {
        explainLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        explainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        explainLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }

    private func initInputTokenTextField() {
        createInputTokenTextField()
        activeConstaraintInputTokenTextField()
        setHideKeyboardTapped()
    }

    private func createInputTokenTextField() {
        inputTokenTextField.borderStyle = .roundedRect
        inputTokenTextField.placeholder = "personal access token"
        inputTokenTextField.textAlignment = .left
        inputTokenTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTokenTextField.delegate = self
        view.addSubview(inputTokenTextField)
    }

    private func activeConstaraintInputTokenTextField() {
        inputTokenTextField.topAnchor.constraint(equalTo: explainLabel.bottomAnchor, constant: 20).isActive = true
        inputTokenTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        inputTokenTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }

    private func initSearchButton() {
        createSearchButton()
        activeConstaraintSearchButton()
    }

    private func createSearchButton() {
        searchButton.setTitle("検索", for: UIControl.State.normal)
        searchButton.setTitleColor(UIColor.systemBlue, for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false

        searchButton.addTarget(self,
                               action: #selector(searchButtonTapped(_:)),
                               for: .touchUpInside)
        view.addSubview(searchButton)
    }

    private func activeConstaraintSearchButton() {
        searchButton.topAnchor.constraint(equalTo: inputTokenTextField.bottomAnchor, constant: 20).isActive = true
        searchButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }

    @objc private func searchButtonTapped(_ sender: UIButton) {
        presenter.searchButtonTapped(accessToken: accessToken)
    }
}

// MARK: - Public Methods

extension TopViewController {}

// MARK: - Delegate Methods

extension TopViewController: TopView {
    func initView() {
        initHeaderLabel()
        initExplainLabel()
        initInputTokenTextField()
        initSearchButton()
    }
}

extension TopViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        accessToken = inputTokenTextField.text ?? ""
    }
}

extension TopViewController {
    func setHideKeyboardTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}
