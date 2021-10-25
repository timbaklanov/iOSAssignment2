//
//  Product.swift
//  assignment2
//
//  Created by Тимур Бакланов on 25.10.2021.
//

import Foundation

class Product {
    
    //properties
    var name: String
    var quantity: Int
    var price: Float
    
    //init
    init(name: String, quantity: Int, price:Float) {
        self.name = name
        self.quantity = quantity
        self.price = price
    }
    
}
