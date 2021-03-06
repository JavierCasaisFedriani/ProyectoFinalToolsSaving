//
//  SavingsViewController.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 29/5/22.
//

import UIKit

class SavingsViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var tableSaving: UITableView!
    @IBOutlet var viewMain: UIView!
    
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
    
    //Recarga la tabla al ir a la ventana
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableSaving.reloadData()
    }
    
    //MARK: - Function
    func loadNaigationBar() {
        guard let barNavigation = navigationController?.navigationBar else { return }
        
        title = NSLocalizedString("saving", comment: "")
        
        barNavigation.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addSalary))
        barNavigation.topItem?.rightBarButtonItem?.tintColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navBarAppearance.backgroundColor = .DarkBlueGray

        barNavigation.standardAppearance = navBarAppearance
        barNavigation.scrollEdgeAppearance = navBarAppearance
    }
    
    func tableDelegate() {
        tableSaving.delegate = self
        tableSaving.dataSource = self
        
        let nibName = UINib(nibName: "\(SavingTableViewCell.self)", bundle: nil)
        tableSaving.register(nibName, forCellReuseIdentifier: "\(SavingTableViewCell.self)")
    }
    
    func loadStyle() {
        viewMain.backgroundColor = .foundApp
        tableSaving.backgroundColor = .foundApp
        tableSaving.showsVerticalScrollIndicator = false
    }
    
    func subtractMoney() {
        let alert = UIAlertController(title: NSLocalizedString("usedMoney", comment: ""), message: NSLocalizedString("msgUsedMoney", comment: ""), preferredStyle: .alert)

        let actionAccept = UIAlertAction(title: NSLocalizedString("accept", comment: ""), style: .default, handler: {
            (alert: UIAlertAction) -> Void in
          print("hola")
        })

        let actionCancel = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .destructive)

        alert.addAction(actionAccept)
        alert.addAction(actionCancel)

        present(alert, animated: true)
    }
    
    @objc func addSalary() {
        
        let alert = UIAlertController(title: NSLocalizedString("addSalary", comment: ""), message: NSLocalizedString("msgAddSalary", comment: ""), preferredStyle: .alert)
        
        //add textfield to alert
        alert.addTextField { txfNameCategory in
            txfNameCategory.placeholder = NSLocalizedString("addSalary", comment: "")
        }
        
        let actionCancel = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .destructive, handler: {
            (alert: UIAlertAction) -> Void in
            print("Cancelar")
        })
        
        let actionAdd = UIAlertAction(title: NSLocalizedString("add", comment: ""), style: .default, handler: {_ in
            #warning("A??adir salario, dividirlo por el porcentaje de cada categoria y sumarlo")
            
            guard let fields = alert.textFields else { return }
            
            let salaryField = fields[0]
            
            guard let salary = salaryField.text, !salary.isEmpty else {
                print("Has dejado el campo vacio")
                return
            }
            print("Salario \(salary)")
            
            //save money by percentage
            guard let salary = Int(salary) else { return }
            
            if salary > 0 {
                for number in 0..<self.categories.count {
                    let valueMoney = salary * (self.categories[number].percentage) / 100
                    
                    self.categories[number].money += valueMoney
                    self.saveCategories()
                    self.tableSaving.reloadData()
                }
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

//MARK: - Extencion
extension SavingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavingTableViewCell", for: indexPath) as? SavingTableViewCell else { return UITableViewCell() }
        
        cell.loadCell(categorie: self.categories[indexPath.item], indexPath: indexPath.item)
        cell.delegate = self
        
        return cell
    }
}

extension SavingsViewController: SavingTableViewCellDelegate {
    
    func didTapBtnSubtract(_ index: Int) {
        let category = CategoryManager.shared
        
        print("Celda \(index)")
        let alert = UIAlertController(title: NSLocalizedString("usedMoney", comment: ""), message: NSLocalizedString("msgUsedMoney", comment: ""), preferredStyle: .alert)
        
        //add textfield to alert
        alert.addTextField { txfNameCategory in
            txfNameCategory.placeholder = NSLocalizedString("usedMoney", comment: "")
            txfNameCategory.keyboardType = .numberPad
        }
        
        let actionCancel = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .destructive, handler: {
            (alert: UIAlertAction) -> Void in
            print("Cancelar")
        })
        
        //create actions to alert
        let actionAdd = UIAlertAction(title: NSLocalizedString("accept", comment: ""), style: .default, handler: {_ in
            
            guard let fields = alert.textFields else { return }
            
            let moneyField = fields[0]
            
            guard let money = moneyField.text, !money.isEmpty else {
                print("Has dejado el campo vacio")
                return
            }
            
            guard let money = Int(money) else {
                print("Has introducido un valor que no es un Int")
                return
            }

            #warning("Aqui restamos el dinero que introduduzcamo a lo que llevemos ahorrado")
            self.categories[index].money -= money
            self.saveCategories()
            self.tableSaving.reloadData()
        })
        
        //Add action to alert
        alert.addAction(actionCancel)
        alert.addAction(actionAdd)
        
        //show the alert
        present(alert, animated: true)
    }
}
