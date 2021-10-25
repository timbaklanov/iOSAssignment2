//
//  HistoryManager.swift
//  assignment2
//
//  Created by Тимур Бакланов on 25.10.2021.
//

import Foundation

class HistoryManager {
    //store products
    var historyItems = [HistoryItem]()
    var selectedProduct: HistoryItem?
    
    //methods
    func addNewItem(historyItem: HistoryItem) {
        historyItems.append(historyItem)
    }
    
    func getAllHistoryItems() -> [HistoryItem] {
        return historyItems
    }
}
