//
//  ViewController.swift
//  assignment2
//
//  Created by Тимур Бакланов on 22.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //variables
    var productManager: ProductManager = ProductManager()
    var historyManager: HistoryManager = HistoryManager()

    var selectedProduct: Product?
    var amount = ""
    var total: Float?
    
    //outlets
    @IBOutlet weak var selectedLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    
    @IBOutlet weak var buyBtn: CustomButton!
    @IBOutlet weak var productsTable: UITableView!
    
    
    //lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        productManager.addNewProduct(newProduct: Product(name: "Pants", quantity: 20, price: 5))
        productManager.addNewProduct(newProduct: Product(name: "Shoes", quantity: 50, price: 15))
        productManager.addNewProduct(newProduct: Product(name: "Hats", quantity: 10, price: 3.5))
        productManager.addNewProduct(newProduct: Product(name: "Tshirts", quantity: 10, price: 5.5))
        productManager.addNewProduct(newProduct: Product(name: "Dresses", quantity: 24, price: 8))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productsTable.reloadData()
    }

    //actions
    @IBAction func btnPressed(_ btn: UIButton) {
        
        if let number = btn.titleLabel?.text {
            amount += number
            quantityLbl.text = amount
        }
    }
    
    
    @IBAction func buyBtnClicked(_ sender: Any) {
        if let product = selectedProduct {
            if let amnt = Int(amount) {
                if (product.quantity >= amnt) {
                    total = Float(amnt) * product.price
                    product.quantity -= amnt
                    totalLbl.text = "\(total!)"
                    selectedLbl.text = "Type"
                    quantityLbl.text = "Quantity"
                    amount = ""
                    historyManager.addNewItem(historyItem: HistoryItem(p: product, t: total!, d: Date()))
                    productsTable.reloadData()
                } else {
                    var dialogMessage = UIAlertController(title: "Error", message: "You selected a quantity which is more that the available quantity in the stock", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    dialogMessage.addAction(ok)
                    self.present(dialogMessage, animated: true, completion: nil)
                    selectedLbl.text = "Type"
                    quantityLbl.text = "Quantity"
                    amount = ""
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let managerVC = segue.destination as? ManagerViewController
        managerVC!.historyManager = historyManager
        managerVC!.productsManager = productManager
    }
}

//extending view controller
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.getAllProducts().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        cell.nameLbl?.text = productManager.getAllProducts()[indexPath.row].name
        cell.quanLbl?.text = "\(productManager.getAllProducts()[indexPath.row].quantity)"
        cell.priceLbl?.text = "\(productManager.getAllProducts()[indexPath.row].price)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLbl.text = productManager.getAllProducts()[indexPath.row].name
        selectedProduct = productManager.getAllProducts()[indexPath.row]
    }
}

