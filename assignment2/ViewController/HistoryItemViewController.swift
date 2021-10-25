//
//  HistoryItemViewController.swift
//  assignment2
//
//  Created by Тимур Бакланов on 25.10.2021.
//

import UIKit

class HistoryItemViewController: UIViewController {
    
    //outlets
    
    var historyManager: HistoryManager?
    
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = historyManager?.selectedProduct!.product.name
        itemNameLbl.text = historyManager?.selectedProduct!.product.name
        quantityLbl.text = "\(historyManager?.selectedProduct!.product.quantity ?? 0)"
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy, HH:mm"
        dateLbl.text = "\(formatter.string(from: historyManager?.selectedProduct!.date ?? Date()))"
        amountLbl.text = "Total amount: $\(historyManager?.selectedProduct!.total ?? 0)"
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
