//
//  ProductManager.swift
//  assignment2
//
//  Created by Тимур Бакланов on 25.10.2021.
//

import Foundation

class ProductManager {
    
    //store products
    var products = [Product]()
    
    //methods
    func addNewProduct(newProduct: Product) {
        products.append(newProduct)
    }
    
    func getAllProducts() -> [Product] {
        return products
    }
}
