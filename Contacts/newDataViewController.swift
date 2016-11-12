//
//  newDataViewController.swift
//  Contacts
//
//  Created by Developer on 11/10/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit
import CloudKit

class newDataViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtNotes: UITextView!

    @IBOutlet weak var txtHobby1: UITextField!
    
    @IBOutlet weak var txtHobby2: UITextField!
    
    @IBOutlet weak var txtHobby3: UITextField!
    
    var recordInfo = String()
    var Alert: UIAlertController!
    
    let publicDataBase = CKContainer.default().publicCloudDatabase
    
    
    
    
    
    @IBAction func Save(_ sender: UIButton) {
        let store = CKRecord(recordType: "Contacts")
        store.setObject(txtName.text as CKRecordValue?, forKey: "Name")
        store.setObject(txtAddress.text as CKRecordValue?, forKey: "Address")
        store.setObject(txtPhoneNumber.text as CKRecordValue?, forKey: "Phone_Number")
        store.setObject(txtNotes.text as CKRecordValue?, forKey: "Notes")
        publicDataBase.save(store, completionHandler:  { (record: CKRecord?, error: Error?) -> Void in
            if error != nil {
                print("Error saving Data" + (error?.localizedDescription)!)
            } else {
                print("Data Saved")
            }
            
        })
        let storeRef = CKRecord(recordType: "Hobbies")
        storeRef.setObject(txtHobby1.text as CKRecordValue?, forKey: "Hobby1")
        storeRef.setObject(txtHobby2.text as CKRecordValue?, forKey: "Hobby2")
        storeRef.setObject(txtHobby3.text as CKRecordValue?, forKey: "Hobby3")
                publicDataBase.save(storeRef, completionHandler:  { (record: CKRecord?, error: Error?) -> Void in
            if error != nil {
                print("Error saving Data" + (error?.localizedDescription)!)
            } else {
                print("Data Saved")
            }
            
        })
        
        self.present(self.Alert, animated: true, completion: nil)
        
        self.txtName.text = " "
        self.txtAddress.text = " "
        self.txtPhoneNumber.text = " "
        self.txtNotes.text = "  "
        self.txtHobby1.text = "  "
        self.txtHobby2.text = "  "
        self.txtHobby3.text = "  "
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Alert = UIAlertController(title: "New Record", message: "Contact Saved", preferredStyle: UIAlertControllerStyle.alert)
        let actionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { Void in
            print("Save Data")
        }
        Alert.addAction(actionOk)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
