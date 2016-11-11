//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Developer on 11/10/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit
import CloudKit

class ContactsTableViewController: UITableViewController {

    var DataArray: Array<CKRecord> = []
    
    
    var refresh: UIRefreshControl!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh = UIRefreshControl()
        refresh.attributedTitle = NSAttributedString(string: "Pull Down To Load Data")
        refresh.addTarget(self, action: #selector(DataTableViewController.LoadData), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresh)
        refresh.beginRefreshing()
        
        LoadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func LoadData() {
        DataArray = Array<CKRecord>()
        let DataPublicDataBase = CKContainer.default().publicCloudDatabase
        let DataPredicate = NSPredicate(value: true)
        
        let DataQuery = CKQuery(recordType: "Contacts", predicate: DataPredicate)
        DataQuery.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        DataPublicDataBase.perform(DataQuery, inZoneWith: nil)  { (results: [CKRecord]?, error: Error?) -> Void in
            if error != nil {
                print("Error" + error.debugDescription)
            } else {
                for results2 in results! {
                    self.DataArray.append(results2)
                }
                OperationQueue.main.addOperation ( { () -> Void in
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    self.refresh.endRefreshing()
                })
            }
        }
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        // Configure the cell...
        let dataRecord: CKRecord = DataArray[(indexPath as IndexPath).row]
        cell.textLabel?.text = dataRecord.value(forKey: "Name") as? String
        cell.detailTextLabel?.text = dataRecord.value(forKey: "Phone_Number") as? String
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
