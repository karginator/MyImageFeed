import UIKit
import WebKit

final class WebViewViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Public Properties
    weak var delegate: WebViewViewControllerDelegate?
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        loadWebView()
    }
}

// MARK: - Extension Private Methods
private extension WebViewViewController {
    
    func loadWebView() {
        guard var urlComponents = URLComponents(string: WebViewConstants.unsplashAuthorizeURLString) else { return }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKey),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: Constants.accessScope)
        ]
        
        guard let url = urlComponents.url else { return }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func fetchCode(from navigationAction: WKNavigationAction) -> String? {
        guard let url = navigationAction.request.url,
              let urlComponents = URLComponents(string: url.absoluteString),
              urlComponents.path == "/oauth/authorize/native",
              let codeItem = urlComponents.queryItems?.first(where: { $0.name == "code"})
        else { return nil }
        return codeItem.value
    }
}

// MARK: - Extension WKNavigationDelegate
extension WebViewViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let code = fetchCode(from: navigationAction) {
            decisionHandler(.cancel)
            delegate?.webViewViewController(self, didAuthenticateWithCode: code)
        } else {
            decisionHandler(.allow)
        }
    }
}
