//
//  TabBarController.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 2/6/22.
//

import UIKit

class TabBarController: UITabBarController {
    //MARK: - Variable
    let imageIcon = ["book.circle", "dollarsign.circle"]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
     }
    
    //MARK: Function
    func tabBar() {
        loadScreen()
        loadTabBar()
    }
    
    func loadScreen() {
        let categoryVC = UINavigationController(rootViewController: CategoryViewController())
        let savingVC = UINavigationController(rootViewController: SavingsViewController())

        categoryVC.title = NSLocalizedString("category", comment: "")
        savingVC.title = NSLocalizedString("saving", comment: "")

        self.setViewControllers([savingVC, categoryVC], animated: false)
    }
    
    func loadTabBar() {
        let tabBar = self.tabBar
        
        guard let item = tabBar.items else { return }
        
        //dollarsign.cicle
        for num in 0..<2 {
            item[num].image = UIImage(systemName: imageIcon[num])
        }
        
        tabBar.backgroundColor = .DarkBlueGray
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .BubbleGum
    }
}
