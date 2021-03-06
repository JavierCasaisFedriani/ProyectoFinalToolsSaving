//
//  CategoryViewController.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 1/6/22.
//

import UIKit

class CategoryViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet var viewMain: UIView!
    @IBOutlet weak var tableCategory: UITableView!
    
    //MARK: - Variable
    var categories: [CategoryModel] = []
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = readCategories()
        tableDelegate()
        loadNaigationBar()
        loadStyle()
    }
    
    //MARK: - Function
    func loadNaigationBar() {
        
        //MARK: Variebale
        //var percentageTotal = Function.totalPercentage()
        
        //MARK: Alert
        guard let barNavigation = navigationController?.navigationBar else { return }
        
        title = NSLocalizedString("category", comment: "")
        
        //Button add category
        barNavigation.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addCategory))
        barNavigation.topItem?.rightBarButtonItem?.tintColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navBarAppearance.backgroundColor = .DarkBlueGray
        
        barNavigation.standardAppearance = navBarAppearance
        barNavigation.scrollEdgeAppearance = navBarAppearance
    }
    
    func tableDelegate() {
        tableCategory.delegate = self
        tableCategory.dataSource = self
        
        let nibName = UINib(nibName: "\(CategoriyTableViewCell.self)", bundle: nil)
        tableCategory.register(nibName, forCellReuseIdentifier: "\(CategoriyTableViewCell.self)")
    }
    
    func loadStyle() {
        viewMain.backgroundColor = .foundApp
        tableCategory.backgroundColor = .foundApp
        tableCategory.showsVerticalScrollIndicator = false
    }
    
    @objc func addCategory() {
        let alert = UIAlertController(title: NSLocalizedString("createCategory", comment: ""), message: "", preferredStyle: .alert)
        
        //add textfield to alert
        alert.addTextField { txfNameCategory in
            txfNameCategory.placeholder = NSLocalizedString("addNameCategorya", comment: "")
        }
        
        alert.addTextField { txfPercentageCategory in
            txfPercentageCategory.placeholder = NSLocalizedString("addPercentageCategory", comment: "")
            txfPercentageCategory.keyboardType = .numberPad
        }
        
        //create actions to alert
        let actionCancel = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .destructive, handler: {
            (alert: UIAlertAction) -> Void in
            print("Cancelar")
        })
        
        //Action add categories
        let actionAdd = UIAlertAction(title: NSLocalizedString("add", comment: ""), style: .default, handler: {_ in
            #warning("A??adir categoria")
            
            guard let fields = alert.textFields, fields.count == 2 else { return }
            
            let nameField = fields[0]
            let percentageField = fields[1]
            
            guard let name = nameField.text, !name.isEmpty, let percentage = percentageField.text, !percentage.isEmpty, let percentage = Int(percentage) else {
                print("Tienes espacios en blanco")
                return
            }
            
            if Function.validityName(name: name) == true && self.categories[0].percentage >= percentage {
                self.categories[0].percentage -= percentage
                let newCategorie = CategoryModel(name: name, percentage: percentage, money: 0)
                self.categories.append(newCategorie)
                self.saveCategories()
                self.tableCategory.reloadData()
            }
        })
        
        //Add action to alert
        alert.addAction(actionCancel)
        alert.addAction(actionAdd)
        
        //show the alert
        present(alert, animated: true)
    }
    
    private func saveCategories() {
        // A??ado la categor??a al user defaults
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            
            // Encode Note
            let data = try encoder.encode(self.categories)
            
            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "categories")
            
        } catch {
            print("Unable to Encode Categories (\(error))")
        }
    }
    
    private func readCategories() -> [CategoryModel] {
        if let data = UserDefaults.standard.data(forKey: "categories") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                
                // Decode Note
                let categories = try decoder.decode([CategoryModel].self, from: data)
                
                return categories
            } catch {
                print("Unable to Decode Categories (\(error))")
            }
        }
        return []
    }
}

//MARK: - Extension
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriyTableViewCell", for: indexPath) as? CategoriyTableViewCell else { return UITableViewCell() }
        
        // cell.setDataCategory(indexPath.row)
        cell.loadCell(categorie: self.categories[indexPath.item], indexPath: indexPath.item)
        cell.delegate = self
        
        return cell
    }
}

extension CategoryViewController: CategoriyTableViewCellDelegate {
    
    func didTabBtnEdit(_ indexPath: Int) {
        
        //MARK: Variables
        let category = CategoryManager.shared
        
        //MARK: AlertProyectoFinal
        let alert = UIAlertController(title: NSLocalizedString("editCategory", comment: ""), message: "", preferredStyle: .alert)
        
        //add textfield to alert
        alert.addTextField { txfNameCategory in
            txfNameCategory.placeholder = NSLocalizedString("addNameCategorya", comment: "")
            txfNameCategory.text = "\(self.categories[indexPath].name)"
        }
        
        alert.addTextField { txfPercentageCategory in
            txfPercentageCategory.text = "\(self.categories[indexPath].percentage)"
            txfPercentageCategory.keyboardType = .numberPad
            txfPercentageCategory.placeholder = NSLocalizedString("addPercentageCategory", comment: "")
        }
        
        //create actions to alert
        let actionCancel = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .destructive, handler: {
            (alert: UIAlertAction) -> Void in
            print("Cancelar")
        })
        
        let actionSave = UIAlertAction(title: NSLocalizedString("edit", comment: ""), style: .default, handler: {_ in
            
            guard let fields = alert.textFields, fields.count == 2 else { return }
            
            let nameField = fields[0]
            let percentageField = fields[1]
            
            guard let name = nameField.text, !name.isEmpty, let percentage = percentageField.text, !percentage.isEmpty, let percentage = Int(percentage) else {
                print("Tienes espacios en blanco")
                return
            }
            print("Categoria \(category)")
            
            #warning("Modificar los datos del array segun lo introudcido en los textFields")
            
            let percentageSave = self.categories[0].percentage
            self.categories[0].percentage += self.categories[indexPath].percentage
            
            
            if (name == self.categories[indexPath].name || Function.validityName(name: name) == true) && self.categories[0].percentage >= percentage {
                
                self.categories[0].percentage -= percentage
                self.categories[indexPath].name = name
                self.categories[indexPath].percentage = percentage
                
                self.saveCategories()
            } else {
                self.categories[0].percentage = percentageSave
            }
            self.tableCategory.reloadData()
        })
        
        //Add action to alert
        alert.addAction(actionCancel)
        alert.addAction(actionSave)
        
        //show the alert
        present(alert, animated: true)
    }
    
    
    func didTabBtnDelete(_ indexPath: Int) {
        //MARK: Alert??
        let alert = UIAlertController(title: NSLocalizedString("deleteCategory", comment: ""), message: NSLocalizedString("msgDeleteCategory", comment: ""), preferredStyle: .alert)
        
        //create actions to alert
        let actionCancel = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .destructive, handler: {
            (alert: UIAlertAction) -> Void in
            print("Cancelar")
        })
        
        let actionAdd = UIAlertAction(title: NSLocalizedString("accept", comment: ""), style: .default, handler: {
            (alert: UIAlertAction) -> Void in
            
            #warning("Borrar la categoria")
            self.categories[0].percentage += self.categories[indexPath].percentage
            self.categories.remove(at: indexPath)
            self.saveCategories()
            self.tableCategory.reloadData()
        })
        
        //Add action to alert
        alert.addAction(actionCancel)
        alert.addAction(actionAdd)
        
        //show the alert
        present(alert, animated: true)
    }
}
