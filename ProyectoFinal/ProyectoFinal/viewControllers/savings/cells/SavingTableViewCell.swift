//
//  SavingTableViewCell.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 29/5/22.
//

import UIKit

class SavingTableViewCell: UITableViewCell {
    
    //MARK: - Outlet
    @IBOutlet weak var stackLabel: UIStackView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbMoney: UILabel!
    @IBOutlet weak var btnSubtract: UIButton!
    
    //MARK: - Variable
    weak var delegate: SavingTableViewCellDelegate?
    let savingTable = SavingsViewController()
    var category = CategoryManager.shared
    var index: Int = 0
    
    
    //MARK: - lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        loadStyle()
    }
    
    //MARK: - Action
    @IBAction func subtractMoney(_ sender: Any) {
        delegate?.didTapBtnSubtract(index)
    }
    
    //MARK: - Function
    func loadStyle() {
        self.backgroundColor = .PurpleMountainMajesty
        self.selectionStyle = .none
        
        //stackLabel
        stackLabel.axis = .horizontal
        stackLabel.spacing = 10
        
        //btnSubtract
        btnSubtract.loadBtnImageSystem(nameImage: "minus")

        //lbName
        lbName.loadStyleText("\(category.categories[index].name):")
    }
    
    func loadCell(categorie: CategoryModel, indexPath: Int) {
        self.lbName.loadStyleText(categorie.name)
        self.lbMoney.loadStyleText(String(categorie.money))
        self.index = indexPath
        
        if categorie.money < 0 {
            lbMoney.textColor = .redError
        }
    }
    

}
//MARK: - Protocol
protocol SavingTableViewCellDelegate: AnyObject {
    func didTapBtnSubtract(_ index: Int)
}
