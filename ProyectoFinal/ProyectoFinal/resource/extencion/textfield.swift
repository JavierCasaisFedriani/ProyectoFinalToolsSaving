//
//  textfield.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 28/5/22.
//

import Foundation
import UIKit

extension UITextField {
    func loadStylePlaceHolder(text: String) {
        self.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("\(text)", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.backgroundColor = .White50
    }
}
