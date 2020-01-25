//
//  MasterViewController.swift
//  Parth_C0766346_FinalLA
//
//  Created by Parth Dalwadi on 2020-01-24.
//  Copyright © 2020 Parth Dalwadi. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
     
    var context: NSManagedObjectContext?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let appD = UIApplication.shared.delegate as! AppDelegate
        context = appD.persistentContainer.viewContext
        
        let data = loadDatafromDatabase()
        
        if data.isEmpty{
            
            saveDataIntoCore()
            
        }else{
            
            Product.allProducts = []
            
            for O in data{
                
                Product.allProducts.append(Product(pId: O.value(forKey: "id") as! Int, pName: O.value(forKey: "name") as! String, pDescription: "datail", price: O.value(forKey: "price") as! Double))
                
            }
             
            
        }
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        //let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject))
        //navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

   

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = Product.allProducts[indexPath.row]
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Product.allProducts.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = Product.allProducts[indexPath.row].pName
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Product.allProducts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
    func saveDataIntoCore(){
        
        // delete old core data
                
        
        for p in Product.allProducts{
            
            let newP = NSEntityDescription.insertNewObject(forEntityName: "Eproduct", into: context!)
            
            newP.setValue(p.pName, forKey: "name")
            
        }
        
        
        do{
            try context!.save()
        }catch{
            print("error")
        }
        
        
        
    }

    
    func loadDatafromDatabase()->[NSManagedObject]{
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Eproduct")
        
        do{
            let results = try context!.fetch(request)
            
            return results as! [NSManagedObject]
            
        }catch{
            print(error)
        }
        
        return [NSManagedObject]()
    }

}

