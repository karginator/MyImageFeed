import UIKit
import WebKit

enum WebViewConstants {
    static let unsplashAuthorizeURLString_test = "https://google.com"
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
}

final class WebViewViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAuthView()
    }

    // MARK: - Private Methods
    private func loadAuthView() {
        guard var urlComponents = URLComponents(string: WebViewConstants.unsplashAuthorizeURLString) else {
            print("1")
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKae),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: Constants.accessScope)
        ]
                
        guard let url = urlComponents.url else {
            print("2")
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    
}
