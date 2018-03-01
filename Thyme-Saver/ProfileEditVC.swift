//
//  ProfileEditVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 3/1/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ProfileEditVC: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var segueLabel: UILabel!
    @IBOutlet weak var errorMessage: UILabel!
    
    var myString = String()

    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        segueLabel.text = myString
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileEditViewController = segue.destination as! ProfileVC
        profileEditViewController.myString = segueLabel.text!

        databaseHandle = ref?.child(myString).child("FullName").observe(.childAdded, with: { (snapshot) in
        profileEditViewController.nameLabel.text = snapshot.value as? String
        })
    }
    
    
    @IBAction func Save(_ sender: UIButton)
    {
        
        if(firstName.text != ""){
            if(lastName.text != ""){
                if(phoneNumber.text != ""){
                    if(address.text != ""){
                        if(city.text != ""){
                            if(state.text != ""){
                                if(zip.text != ""){
                                    
                                    self.ref.child(segueLabel.text!).child("FirstName").updateChildValues(["firstname" : firstName.text!])
                                    self.ref.child(segueLabel.text!).child("LastName").updateChildValues(["lastname" : lastName.text!])
                                    self.ref.child(segueLabel.text!).child("PhoneNumber").updateChildValues(["phonenumber" : phoneNumber.text!])
                                    self.ref.child(segueLabel.text!).child("StreetAddress").updateChildValues(["streetaddress" : address.text!])
                                    self.ref.child(segueLabel.text!).child("City").updateChildValues(["city" : city.text!])
                                    self.ref.child(segueLabel.text!).child("ZipCode").updateChildValues(["zipcode" : zip.text!])
                                    self.ref.child(segueLabel.text!).child("State").updateChildValues(["state" : state.text!])
                                    self.ref.child(segueLabel.text!).child("FullName").updateChildValues(["fullname" : firstName.text! + " " + lastName.text!])

                                    
                                    self.performSegue(withIdentifier: "profileEditToProfileVC", sender: self)
                                    
                                } else {
                                    errorMessage.text = "Enter Zip"
                                }
                            } else {
                                errorMessage.text = "Enter State"
                            }
                        } else {
                            errorMessage.text = "Enter City"
                        }
                    } else {
                        errorMessage.text = "Enter Street Address"
                    }
                } else {
                    errorMessage.text = "Enter Phone Number"
                }
            } else {
                errorMessage.text = "Enter Last Name"
            }
        } else {
            errorMessage.text = "Enter First Name"
        }
    }
    
}


