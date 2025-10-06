import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var loginNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var logoutButton: UIButton!
    
    // MARK: - IB Actions
    @IBAction private func didTapLogoutButton() { }

}
