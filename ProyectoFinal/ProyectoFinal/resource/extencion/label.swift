//
//  label.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 28/5/22.
//

import Foundation
import UIKit

extension UILabel {
    func loadStyleTitle(_ title: String) {
        self.text = NSLocalizedString("\(title)", comment: "")
       // lbTitleLogin.font = UIFont(name: "System", size: 100)
        self.textColor = .BubbleGum
    }
    
    func loadStyleText(_ text: String) {
        //Texto en negrita
        self.text = text
        self.textColor = .BubbleGum
    }
    
    func loadStyleDataText(_ text: String) {
        //Texto en negrita
        self.text = text
        self.textColor = .BubbleGum
    }
    
    //Ocurtar y mostrar texto de error
    func loadStyleErrorMsg(_ text: String) {
        self.isHidden = false
        self.text = NSLocalizedString("\(text)", comment: "")
        sleep(5)
        self.isHidden = true
    }
}
