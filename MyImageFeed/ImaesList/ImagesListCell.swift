import UIKit

final class ImagesListCell: UITableViewCell {
    
    // MARK: - IB Outlets
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    
    
    // MARK: - Public Properties
    static let reuseIdentifier = "ImagesListCell"
    
    // MARK: - Private Properties
//    private var blurEffectView: UIVisualEffectView?
//    private var maskLayer: CAGradientLayer?
//    
    // MARK: - Override layoutSubviews
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        updateBlurFrame()
//    }
//    
    // MARK: - Public Methods
//    func addGradientBlurToImage() {
//        // Удаляем предыдущее размытие, если оно есть
//        blurEffectView?.removeFromSuperview()
//        maskLayer?.removeFromSuperlayer()
//        
//        // Высота размытой области 30 points
//        let blurHeight: CGFloat = 30
//        
//        // Создаем эффект размытия
//        let blurEffect = UIBlurEffect(style: .regular)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        
//        // Устанавливаем frame - ширина как у cellImage, высота 30 points
//        // Размещаем внизу изображения
//        blurView.frame = CGRect(
//            x: 0,
//            y: cellImage.bounds.height - blurHeight,
//            width: cellImage.bounds.width,
//            height: blurHeight
//        )
//        
//        // Создаем градиентную маску для размытия
//        let maskLayer = CAGradientLayer()
//        maskLayer.frame = blurView.bounds
//        
//        // Градиент прозрачности: сверху полностью прозрачно, снизу полностью непрозрачно
//        maskLayer.colors = [
//            UIColor.clear.cgColor,      // Верх - прозрачный
//            UIColor.black.cgColor       // Низ - непрозрачный
//        ]
//        
//        maskLayer.locations = [0.0, 1.0]
//        maskLayer.startPoint = CGPoint(x: 0.5, y: 0.0)  // Сверху
//        maskLayer.endPoint = CGPoint(x: 0.5, y: 1.0)    // Снизу
//        
//        // Применяем маску к размытию
//        blurView.layer.mask = maskLayer
//        self.maskLayer = maskLayer
//        
//        // Добавляем размытие к cellImage
//        cellImage.addSubview(blurView)
//        self.blurEffectView = blurView
//    }
//    
    // MARK: - Private Methods
//    private func updateBlurFrame() {
//        let blurHeight: CGFloat = 30
//        
//        // Обновляем frame размытия
//        blurEffectView?.frame = CGRect(
//            x: 0,
//            y: cellImage.frame.height - blurHeight,
//            width: cellImage.frame.width,
//            height: blurHeight
//        )
//        
//        // Обновляем frame маски
//        maskLayer?.frame = blurEffectView?.bounds ?? .zero
//    }
}
