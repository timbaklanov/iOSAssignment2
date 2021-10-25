//
//  ManagerViewController.swift
//  assignment2
//
//  Created by Тимур Бакланов on 25.10.2021.
//

import UIKit

class ManagerViewController: UIViewController {
    
    var historyManager: HistoryManager?
    var productsManager: ProductManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let historyTVC = segue.destination as? HistoryTableViewController
        let restockVC = segue.destination as? RestockViewController
        historyTVC?.historyManager = historyManager
        restockVC?.productManager = productsManager
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
