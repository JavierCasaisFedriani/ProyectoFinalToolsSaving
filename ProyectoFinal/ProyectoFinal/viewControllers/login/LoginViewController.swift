//
//  LoginViewController.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 18/5/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - OUtlets
    @IBOutlet weak var viewMain: UIView!
    
    //Stacks
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackTextFields: UIStackView!
    @IBOutlet weak var stackButtons: UIStackView!
    
    //labels
    @IBOutlet weak var lbTitleLogin: UILabel!
    
    //textfields
    @IBOutlet weak var txfNameUser: UITextField!
    @IBOutlet weak var txfPassword: UITextField!
    
    //buttons
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnLogin: UIButton!

    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStyle()
        loadNaigationBar()
    }
    
    //MARK: - Action
    @IBAction func goRegister(_ sender: Any) {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    @IBAction func goApp(_ sender: Any) {
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    //MARK: - Function
    func loadStyle(){
        
        viewMain.backgroundColor = .DarkBlueGray
        
        //lbTitleLogin
        lbTitleLogin.loadStyleTitle("login")
        
        //stackView
        stackView.axis = .vertical
        stackView.spacing = 36
        
        //stackTextFields
        stackTextFields.spacingStackTextfieldH()
        
        //stackButtons
        stackButtons.axis = .horizontal
        stackButtons.spacing = 10
        
        //btnLogin
        btnLogin.loadStyle(text: "login")
        
        //btnRegister
        btnRegister.loadStyle(text: "register")
        
        //txfNameUser
        txfNameUser.loadStylePlaceHolder(text: "userEmail")
        txfNameUser.keyboardType = .emailAddress
        
        //txfPassword
        txfPassword.loadStylePlaceHolder(text: "password")
        txfPassword.isSecureTextEntry = true
    }
    
    func loadNaigationBar() {
        guard let barNavigation = navigationController?.navigationBar else { return }

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .DarkBlueGray
        navBarAppearance.shadowColor = .clear

        barNavigation.standardAppearance = navBarAppearance
        barNavigation.scrollEdgeAppearance = navBarAppearance
    }
}
