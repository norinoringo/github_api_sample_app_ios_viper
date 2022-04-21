import Foundation
import SafariServices
import UIKit

class BaseViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Variables

    var activityIndicatorView = UIActivityIndicatorView()

    // MARK: - ViewLifeCycle

    // MARK: - Private Methods

    // MARK: - Public Methods

    // MARK: - Delegate Methods
}

extension BaseViewController {
    // MARK: - SafariView

    func presentSafariView(url: String) {
        guard let url = URL(string: url) else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
}

extension BaseViewController {
    // MARK: - Indicator

    func initIndicator() {
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .large
        activityIndicatorView.color = .systemGray
        view.addSubview(activityIndicatorView)
    }

    func startIndicator() {
        DispatchQueue.main.async {
            self.activityIndicatorView.startAnimating()
        }
    }

    func stopIndicator() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
        }
    }
}

extension BaseViewController {
    // MARK: - Dialog

    func showErrorDialog(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
