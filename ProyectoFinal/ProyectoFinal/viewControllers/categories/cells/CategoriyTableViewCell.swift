//
//  CategoriyTableViewCell.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 31/5/22.
//

import UIKit

class CategoriyTableViewCell: UITableViewCell {
    
    //MARK: - Outlet
    //Lable
    @IBOutlet weak var lbNameCategory: UILabel!
    @IBOutlet weak var lbPercentageCategory: UILabel!
    
    //Button
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    //Stacks
    @IBOutlet weak var stackLabel: UIStackView!
    @IBOutlet weak var stackButtons: UIStackView!
    
    //MARK: - Varieble
    weak var delegate: CategoriyTableViewCellDelegate?
    var category = CategoryManager.shared
    var indexPath: Int = 0
    
    //MARK: - lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        loadStyle()
    }
    
    //MARK: - Action
    @IBAction func editCategory(_ sender: Any) {
        delegate?.didTabBtnEdit(indexPath)
    }
    @IBAction func deleteCategory(_ sender: Any) {
        delegate?.didTabBtnDelete(indexPath)
    }
    
    //MARK: - Function
    
    func loadStyle() {
        self.backgroundColor = .PurpleMountainMajesty
        self.selectionStyle = .none
        //btnEdit
        btnEdit.loadBtnImageSystem(nameImage: "pencil")
        btnEdit.isHidden = false
        //btnDelete
        btnDelete.loadBtnImageSystem(nameImage: "trash.fill")
        btnDelete.isHidden = false
        //stackLabel
        stackLabel.axis = .horizontal
        stackLabel.spacing = 10
        //stackButtons
        stackButtons.axis = .horizontal
        stackButtons.spacing = 10
    }
    
    func loadCell(categorie: CategoryModel, indexPath: Int) {
        self.lbNameCategory.loadStyleText(categorie.name)
        self.lbPercentageCategory.loadStyleDataText(String(categorie.percentage))
        self.indexPath = indexPath
        self.btnDelete.isEnabled = false
        
        if self.indexPath == 0 {
            btnDelete.isHidden = true
            btnEdit.isHidden = true
        } else {
            btnDelete.isHidden = false
            btnEdit.isHidden = false
        }
    }
}

//MARK: Protocol
protocol CategoriyTableViewCellDelegate: AnyObject {
    func didTabBtnEdit(_ indexPath: Int)
    func didTabBtnDelete(_ indexPath: Int)
}
