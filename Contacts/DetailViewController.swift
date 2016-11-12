//
//  DetailViewController.swift
//  Contacts
//
//  Created by Developer on 11/10/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var nameR = String()
    var addressR = String()
    var phoneNumberR = String()
    var notesR = String()
    

    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var addressTxtField: UITextField!
    
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    
    @IBOutlet weak var notesTxtField: UITextView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


    @IBAction func editSaveButton(_ sender: UIButton) {
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTxtField.text = nameR
        addressTxtField.text = addressR
        phoneNumberTxtField.text = phoneNumberR
        notesTxtField.text = notesR

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
