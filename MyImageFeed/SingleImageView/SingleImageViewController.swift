import UIKit

final class SingleImageViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!
    
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
    
    // MARK: - IB Actions
    @IBAction func didSelectBackButton() {
        dismiss(animated: true, completion: nil)
    }
}
