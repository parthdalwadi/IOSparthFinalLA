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

