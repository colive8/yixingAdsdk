import UIKit
import YixingAdsdk

class ViewController: UIViewController {
    
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let showAdButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("显示广告", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Yixing Demo"
        
        // Add subviews
        view.addSubview(helloLabel)
        view.addSubview(showAdButton)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            showAdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showAdButton.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 40),
            showAdButton.widthAnchor.constraint(equalToConstant: 200),
            showAdButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Add button action
        showAdButton.addTarget(self, action: #selector(showAdButtonTapped), for: .touchUpInside)
    }
    
    @objc private func showAdButtonTapped() {
        // 使用YixingAdsdk显示广告
        if let adImage = YixingAdsdk.shared.defaultAdImage() {
            YixingAdsdk.shared.showInterstitialAd(in: self, adImage: adImage) {
                print("广告已关闭")
            }
        }
    }
    

}
