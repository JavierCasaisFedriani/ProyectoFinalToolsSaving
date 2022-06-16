//
//  functions.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 7/6/22.
//

import Foundation

class Function {
    
    //MARK: - Variable
    static var validityName: Bool = true
    static var categories: [CategoryModel] = []
    
    //MARK: - Functions
    //If it returns true (name does not exist), if it returns false (the name exists)
    static func validityName(name: String) -> Bool {
        for item in CategoryManager.shared.categories {
            if name.uppercased() == item.name.uppercased() {
                validityName = false
            }else{
                validityName = true
            }
        }
        return validityName
    }
}
