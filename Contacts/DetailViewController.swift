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
    var Hobby1 = String()
    var Hobby2 = String()
    var Hobby3 = String()


    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var addressTxtField: UITextField!
    
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    
    @IBOutlet weak var notesTxtField: UITextView!
    
    
    @IBOutlet weak var txtHobby1: UITextField!
    
    
    @IBOutlet weak var txtHobby2: UITextField!
    
    @IBOutlet weak var txtHobby3: UITextField!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTxtField.text = nameR
        addressTxtField.text = addressR
        phoneNumberTxtField.text = phoneNumberR
        notesTxtField.text = notesR
        txtHobby1.text = Hobby1
        txtHobby2.text = Hobby2
        txtHobby3.text = Hobby3


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreate
    }
    

  

}
