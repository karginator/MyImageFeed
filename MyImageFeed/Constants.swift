import UIKit

enum Constants {
    static let accessKey = "qnCthhA4b0SBzVWg-W7SnjhVgzV_DqX8oFfPN8FUeK8"
    static let secretKey = "YUO-J1QcPA8m8Yfo90i7j6zR6GAiqpljEafRKF7DwFQ"
    
//    static let accessKey = "xspj-RkMgfcSFAr5-jA8-RsUnfdlyiELN5WrhfDYDnk"
//    static let secretKey = "Ci-Vh5QZPqlEO0IgLbCvcXEB8JqNfQjYOAr81yxaSiY"
    
    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    static let defaultBaseURL = URL(string: "https://api.unsplash.com")!
}

enum WebViewConstants {
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
}
