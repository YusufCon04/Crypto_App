import UIKit


class NotificationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmptyState()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    private func setupUI() {
        title = "Notifications"
        navigationController?.navigationBar.isHidden = false
    }

    private func setupEmptyState() {
        view.backgroundColor = .systemBackground
        let label = UILabel()
        label.text = "No notifications yet"
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}



