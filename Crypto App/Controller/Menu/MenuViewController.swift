import UIKit


class MenuViewController: UIViewController {
    @IBOutlet weak var bitcoinLogoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
    }
    
    private func setupUI() {
        title = "CRYPTO APP"
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(rightBarButtonTouched))]
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "sun.max"), style: .plain, target: self, action: #selector(leftBarButtonTouched))]
        
        // Bitcoin logo setup
        if let bitcoinImage = UIImage(systemName: "bitcoinsign.circle.fill") {
            bitcoinLogoImageView.image = bitcoinImage
            bitcoinLogoImageView.tintColor = .systemOrange
        }
    }
    
   @IBAction func tapLoginButton(_ sender: UIButton) {
       let vc: LoginViewController = LoginViewController()
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapSignUpButton(_ sender: UIButton) {
        let vc: SignupViewController = SignupViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func leftBarButtonTouched() {
        let keyWindow = view.window ?? UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }

        guard let window = keyWindow else { return }

        let isCurrentlyDark = (window.overrideUserInterfaceStyle == .dark) ||
                               (window.overrideUserInterfaceStyle == .unspecified && traitCollection.userInterfaceStyle == .dark)

        window.overrideUserInterfaceStyle = isCurrentlyDark ? .light : .dark
    }
    
    @objc private func rightBarButtonTouched() {
        let notificationsVC = UIViewController()
        notificationsVC.view.backgroundColor = UIColor.systemBackground
        notificationsVC.title = "Notifications"

        let messageLabel = UILabel()
        messageLabel.text = "No notifications yet"
        messageLabel.textColor = .secondaryLabel
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationsVC.view.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: notificationsVC.view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: notificationsVC.view.centerYAnchor)
        ])

        self.navigationController?.pushViewController(notificationsVC, animated: true)
    }
}
