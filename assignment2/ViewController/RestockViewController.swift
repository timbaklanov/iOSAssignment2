//
//  RestockViewController.swift
//  assignment2
//
//  Created by Тимур Бакланов on 25.10.2021.
//

import UIKit

class RestockViewController: UIViewController {
    
    var productManager: ProductManager?
    var selectedProduct: Product?
    @IBOutlet weak var restockBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func restockBtn(_ sender: Any) {
        if selectedProduct != nil {
            if let quan = Int(textField.text!) {
                if (quan != selectedProduct?.quantity) {
                    selectedProduct?.quantity = quan
                    myTable.reloadData()
                } else {
                    var dialogMessage = UIAlertController(title: "Error", message: "Please change quantinty", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    dialogMessage.addAction(ok)
                    self.present(dialogMessage, animated: true, completion: nil)
                }
            }
        } else {
            var dialogMessage = UIAlertController(title: "Error", message: "Please select item", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension RestockViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (productManager?.getAllProducts().count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = productManager?.getAllProducts()[indexPath.row].name
        cell.detailTextLabel?.text = "\(productManager?.getAllProducts()[indexPath.row].quantity ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textField.text = "\(productManager?.getAllProducts()[indexPath.row].quantity ?? 0)"
        selectedProduct = productManager?.getAllProducts()[indexPath.row]
    }
}
