import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - Public Properties
    weak var delegate: AuthViewControllerDelegate?
    
    // MARK: - Private Properties
    private let showWebViewSegueIdentifier = "ShowWebView"
    private let oAuthSerive = OAuth2Service.shared
    
    // MARK: - Override Methods viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackButton()
    }
    
    // MARK: - Override Methods prepare(for segue:)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showWebViewSegueIdentifier {
            guard
                let webViewViewController = segue.destination as? WebViewViewController
            else { preconditionFailure("Invalid segue destination or sender type") }
            webViewViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}

// MARK: - Extension WebViewViewControllerDelegate
extension AuthViewController: WebViewViewControllerDelegate {
    
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        print("CODE: \(code)")
        dismiss(animated: true)
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        dismiss(animated: true)
    }
}

// MARK: - Extension Private Methods
private extension AuthViewController {
    
    func configureBackButton() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "nav_back_button_black")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav_back_button_black")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1333333333, alpha: 1)
    }
    
    func makeOAuthTokenRequest(code: String) -> URLRequest? {
        guard var urlComponents = URLComponents(string: WebViewConstants.unsplashTokenURLString) else { return nil }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKey),
            URLQueryItem(name: "client_secret", value: Constants.secretKey),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
        ]
        
        guard let url = urlComponents.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
}
