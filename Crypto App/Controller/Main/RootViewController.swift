//
//  RootViewController.swift
//  Crypto App
//
//  Created by Yusuf Çon on 24.07.2024.
//

import UIKit

class RootViewController: UIViewController {

    private var didShowInitialController: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard didShowInitialController == false else { return }
        didShowInitialController = true
        
        let menuViewController: MenuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        self.navigationController?.setViewControllers([menuViewController], animated: false)
    }

}
