//
//  RegisterViewController.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 28/5/22.
//

import UIKit

class RegisterViewController: UIViewController {

    //MARK: - Outlet
    
    //Label
    @IBOutlet weak var lbTitleRegister: UILabel!
    //Stack
    @IBOutlet weak var stackTextField: UIStackView!
    //Textfield
    @IBOutlet weak var txfEmail: UITextField!
    @IBOutlet weak var txfUser: UITextField!
    @IBOutlet weak var txfPassword: UITextField!
    @IBOutlet weak var txfRepeatPassword: UITextField!
    //Button
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnGoLogin: UIButton!
    //View
    @IBOutlet weak var viewMain: UIView!
    
    //MARK: - Variable
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStyle()
        alertNoFunctionality()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
     }
    
    //MARK: - Actions
    @IBAction func goLogin(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goApp(_ sender: Any) {
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    private func alertNoFunctionality() {
        let alert = UIAlertController(title: NSLocalizedString("warning", comment: ""), message: NSLocalizedString("noFunctionality", comment: ""), preferredStyle: .alert)

        let actionAccept = UIAlertAction(title: NSLocalizedString("accept", comment: ""), style: .default, handler: {_ in
            self.navigationController?.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(actionAccept)
        
        present(alert, animated: true)
    }
    //MARK: - Functions
    
    func loadStyle() {
        viewMain.backgroundColor = .DarkBlueGray
        //lbTitleRegister
        lbTitleRegister.loadStyleTitle("register")
        //stackTextField
        stackTextField.spacingStackTextfieldH()
        //btnGoLogin
        btnGoLogin.setTitle(NSLocalizedString("haveAccount", comment: ""), for: .normal)
        btnGoLogin.backgroundColor = .clear
        btnGoLogin.tintColor = .BubbleGum
        //btnRegister
        btnRegister.loadStyle(text: "register")
        //txfEmail
        txfEmail.loadStylePlaceHolder(text: "email")
        //txfUser
        txfUser.loadStylePlaceHolder(text: "user")
        //txfPassword
        txfPassword.loadStylePlaceHolder(text: "password")
        //txfRepeatPassword
        txfRepeatPassword.loadStylePlaceHolder(text: "repeatPassword")
    }
    
        func loadNaigationBar() {
            guard let barNavigation = navigationController?.navigationBar else { return }
    
            let navBarAppearance = UINavigationBarAppearance()
            //navBarAppearance.titleTextAttributes = [NSAttributedString.Key.backgroundColor: UIColor.DarkBlueGray]
            navBarAppearance.backgroundColor = .DarkBlueGray
    
            barNavigation.standardAppearance = navBarAppearance
            barNavigation.scrollEdgeAppearance = navBarAppearance
        }
}
