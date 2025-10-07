import UIKit

final class SingleImageViewController: UIViewController {
    
    // MARK: - Public Properties
    var image: UIImage? {
        didSet {
            guard isViewLoaded else { return }
            imageView.image = image
        }
    }
    
    // MARK: - IB Outlets
    @IBOutlet private var imageView: UIImageView!
    
    // MARK: - Overrides Method viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
}
