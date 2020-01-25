//
//  Product.swift
//  Parth_C0766346_FinalLA
//
//  Created by Parth Dalwadi on 2020-01-24.
//  Copyright © 2020 Parth Dalwadi. All rights reserved.
//

import Foundation

class Product{
    
    internal init(pId: Int, pName: String, pDescription: String, price: Double) {
        self.pId = pId
        self.pName = pName
        self.pDescription = pDescription
        self.price = price
    }
    
    
    
    var pId: Int
    var pName, pDescription: String
    var price: Double
    

    static var allProducts = [Product]()
    
    
}
