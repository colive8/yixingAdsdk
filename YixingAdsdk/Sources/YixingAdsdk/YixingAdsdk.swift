import UIKit

public class YixingAdsdk {
    // 单例模式
    public static let shared = YixingAdsdk()
    
    // 私有初始化方法，确保只能通过shared访问
    private init() {}
    
    // 广告视图
    private var adView: UIView?
    private var closeButton: UIButton?
    private var imageView: UIImageView?
    
    // 配置参数
    private var closeButtonDelay: TimeInterval = 1.0
    
    /// 显示插屏广告
    /// - Parameters:
    ///   - viewController: 用于展示广告的视图控制器
    ///   - adImage: 广告图片
    ///   - completion: 广告关闭后的回调
    public func showInterstitialAd(in viewController: UIViewController, adImage: UIImage, completion: (() -> Void)? = nil) {
        // 如果已经有广告在显示，先移除
        removeAdView()
        
        // 创建广告容器视图
        let adView = UIView(frame: viewController.view.bounds)
        adView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        // 创建广告图片视图 - 竖图
        let imageWidth = viewController.view.bounds.width * 0.8
        let imageHeight = imageWidth * 1.5 // 竖图比例，高度是宽度的1.5倍
        
        let imageView = UIImageView(frame: CGRect(
            x: (viewController.view.bounds.width - imageWidth) / 2,
            y: (viewController.view.bounds.height - imageHeight) / 2,
            width: imageWidth,
            height: imageHeight
        ))
        imageView.image = adImage
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        // 创建关闭按钮
        let buttonSize: CGFloat = 30
        let closeButton = UIButton(frame: CGRect(
            x: imageView.frame.maxX - buttonSize / 2,
            y: imageView.frame.minY - buttonSize / 2,
            width: buttonSize,
            height: buttonSize
        ))
        
        // 设置关闭按钮样式
        closeButton.backgroundColor = UIColor.white
        closeButton.layer.cornerRadius = buttonSize / 2
        closeButton.setTitle("✕", for: .normal)
        closeButton.setTitleColor(UIColor.black, for: .normal)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        // 初始状态下禁用关闭按钮
        closeButton.isEnabled = false
        closeButton.alpha = 0.5
        
        // 添加关闭按钮点击事件
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        // 将视图添加到层次结构中
        adView.addSubview(imageView)
        adView.addSubview(closeButton)
        viewController.view.addSubview(adView)
        
        // 保存引用
        self.adView = adView
        self.closeButton = closeButton
        self.imageView = imageView
        
        // 设置完成回调
        self.completionHandler = completion
        
        // 延迟启用关闭按钮
        DispatchQueue.main.asyncAfter(deadline: .now() + closeButtonDelay) { [weak self] in
            self?.closeButton?.isEnabled = true
            self?.closeButton?.alpha = 1.0
        }
    }
    
    // 完成回调
    private var completionHandler: (() -> Void)?
    
    // 关闭按钮点击事件
    @objc private func closeButtonTapped() {
        removeAdView()
        completionHandler?()
    }
    
    // 移除广告视图
    private func removeAdView() {
        adView?.removeFromSuperview()
        adView = nil
        closeButton = nil
        imageView = nil
    }
    
    // 提供一个默认的测试广告图片
    public func defaultAdImage() -> UIImage? {
        // 创建一个简单的渐变图片作为默认广告
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 450))
        let image = renderer.image { ctx in
            let colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let colorLocations: [CGFloat] = [0.0, 1.0]
            
            if let gradient = CGGradient(
                colorsSpace: colorSpace,
                colors: colors as CFArray,
                locations: colorLocations
            ) {
                ctx.cgContext.drawLinearGradient(
                    gradient,
                    start: CGPoint(x: 0, y: 0),
                    end: CGPoint(x: 0, y: 450),
                    options: []
                )
            }
            
            // 添加一些文本
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 24, weight: .bold),
                .foregroundColor: UIColor.white,
                .paragraphStyle: paragraphStyle
            ]
            
            let text = "测试广告\n点击右上角关闭"
            let textRect = CGRect(x: 0, y: 180, width: 300, height: 100)
            text.draw(with: textRect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        }
        
        return image
    }
}
