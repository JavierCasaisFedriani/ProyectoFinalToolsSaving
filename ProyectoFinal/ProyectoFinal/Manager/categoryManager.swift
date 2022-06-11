//
//  categoryManager.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 8/6/22.
//

import Foundation

class CategoryManager {
    static let shared = CategoryManager()
    
    var categories: [CategoryModel] = [
        CategoryModel(name: "Coche", percentage: 50, money: 0),
        CategoryModel(name: "Casa", percentage: 25, money: 0),
        CategoryModel(name: "Vital", percentage: 25, money: 0)
    ]
}
