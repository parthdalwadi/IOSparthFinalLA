//
//  DetailViewController.swift
//  Parth_C0766346_FinalLA
//
//  Created by Parth Dalwadi on 2020-01-24.
//  Copyright © 2020 Parth Dalwadi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var idL: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var priceL: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
     
            if let label = detailDescriptionLabel{
                detailDescriptionLabel.text = "Description:" + detail.pDescription
            nameL.text = "Name: " + detail.pName
            idL.text = "ID: \(detail.pId)"
            priceL.text = "Price: \(detail.pId)"
            }
            
        
            
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Product.allProducts = [ Product(pId: 1, pName: "Product1", pDescription: "abcd", price: 1.2),
        Product(pId: 2, pName: "Product2", pDescription: "efgh", price: 2.3),
        Product(pId: 3, pName: "Product3", pDescription: "ijkl", price: 3.4),
        Product(pId: 4, pName: "Product4", pDescription: "mnop", price: 4.5),
        Product(pId: 5, pName: "Product5", pDescription: "qrst", price: 5.6),
        Product(pId: 6, pName: "Product6", pDescription: "abcd", price: 6.7)]
        // Do any additional setup after loading the view.
        if detailItem == nil { detailItem = Product.allProducts[0]} 
        configureView()
    }

    var detailItem: Product? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

