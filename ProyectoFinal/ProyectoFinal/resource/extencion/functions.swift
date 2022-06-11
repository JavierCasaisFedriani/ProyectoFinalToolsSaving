//
//  functions.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 7/6/22.
//

import Foundation

class Function {
    
    //MARK: - Variable
    static var percentageTotal: Int = 0
    static var validityName: Bool = true
    
   
    
    //MARK: - Functions
    static func percentageAllowed(percentage: Int) -> Int {
        
        percentageTotal = 0
        
        for item in CategoryManager.shared.categories {
            percentageTotal += item.percentage
        }
        
        print("Datos porcentaje total: \(percentageTotal)")
        print("Datos porcentaje que quita: \(percentage)")
        percentageTotal -= percentage
        print("Datos porcentaje en uso: \(percentageTotal)")
        print("Datos porcentaje permitido: \(100-percentageTotal)")
        
        return 100-percentageTotal
    }
    
    static func percentageAllowed() -> Int {

        percentageTotal = 0
        
        for item in CategoryManager.shared.categories {
            percentageTotal += item.percentage
        }
        return 100-percentageTotal
    }
    
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
    
    //get total percentage used
    static func totalPercentage() -> Int {
        percentageTotal = 0
        
        for item in CategoryManager.shared.categories {
            percentageTotal += item.percentage
        }
        
        return percentageTotal
    }
}
