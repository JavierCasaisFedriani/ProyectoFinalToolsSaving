//
//  button.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 28/5/22.
//

import Foundation
import UIKit

extension UIButton {
    func loadStyle(text: String) {
        self.setTitle(NSLocalizedString("\(text)", comment: ""), for: .normal)
        //btnRegister.backgroundColor = .SkyMagenta
        self.backgroundColor = .SkyMagentaDark
        self.layer.cornerRadius = 4
        self.tintColor = .BubbleGum
    }
    
    func loadBtnImageSystem(nameImage: String) {
        self.setTitle("", for: .normal)
        self.setImage(UIImage(systemName: "\(nameImage)"), for: .normal)
        self.tintColor = .BubbleGum
        self.layer.borderColor = UIColor.BubbleGum.cgColor
        self.layer.borderWidth = 1
    }
}
