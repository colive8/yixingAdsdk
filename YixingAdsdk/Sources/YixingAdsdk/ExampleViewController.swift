import UIKit

/// 示例视图控制器，展示如何使用YixingAdsdk
public class ExampleViewController: UIViewController {
    
    private let showAdButton = UIButton(type: .system)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // 配置显示广告按钮
        showAdButton.setTitle("显示插屏广告", for: .normal)
        showAdButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        showAdButton.backgroundColor = UIColor.systemBlue
        showAdButton.setTitleColor(.white, for: .normal)
        showAdButton.layer.cornerRadius = 10
        showAdButton.translatesAutoresizingMaskIntoConstraints = false
        
        showAdButton.addTarget(self, action: #selector(showAdButtonTapped), for: .touchUpInside)
        
        view.addSubview(showAdButton)
        
        // 设置按钮约束
        NSLayoutConstraint.activate([
            showAdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showAdButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showAdButton.widthAnchor.constraint(equalToConstant: 200),
            showAdButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func showAdButtonTapped() {
        // 获取默认广告图片
        if let adImage = YixingAdsdk.shared.defaultAdImage() {
            // 显示插屏广告
            YixingAdsdk.shared.showInterstitialAd(in: self, adImage: adImage) {
                print("广告已关闭")
            }
        }
    }
}