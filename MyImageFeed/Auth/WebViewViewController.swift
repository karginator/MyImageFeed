import UIKit
import WebKit

final class WebViewViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var prograssView: UIProgressView!
    
    // MARK: - Public Properties
    weak var delegate: WebViewViewControllerDelegate?
    
    // MARK: - Overrides Methods viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        loadWebView()
        
        updateProgress()
    }
    
    // MARK: - Overrides Methods viewWillAppear(_ animated:)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        webView.addObserver(
            self,
            forKeyPath: #keyPath(WKWebView.estimatedProgress),
            options: .new,
            context: nil)
        updateProgress()
    }
    
    // MARK: - Overrides Methods viewDidDisappear(_ animated:)
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        webView.removeObserver(
            self,
            forKeyPath: #keyPath(WKWebView.estimatedProgress),
            context: nil)
    }
    
    // MARK: - Overrides Methods observeValue(forKeyPath:of:change:context:)
    override func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey : Any]?,
        context: UnsafeMutableRawPointer?
    ) {
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            updateProgress()
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}

// MARK: - Extension WKNavigationDelegate
extension WebViewViewController: WKNavigationDelegate {
    
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        if let code = fetchCode(from: navigationAction) {
            decisionHandler(.cancel)
            delegate?.webViewViewController(self, didAuthenticateWithCode: code)
        } else {
            decisionHandler(.allow)
        }
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
    
    func updateProgress() {
        prograssView.progress = Float(webView.estimatedProgress)
        prograssView.isHidden = fabs(webView.estimatedProgress - 1.0) < 0.0001
    }
}
