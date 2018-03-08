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
    @IBOutlet weak var editButton: UIButton!
    
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    override func viewWillAppear(_ animated: Bool) {
        
        databaseHandle = ref?.child((Auth.auth().currentUser?.uid)!).child("FirstName").observe(.childAdded, with: { (snapshot) in
            self.firstName.text = snapshot.value as? String
        })
        databaseHandle = ref?.child((Auth.auth().currentUser?.uid)!).child("LastName").observe(.childAdded, with: { (snapshot) in
            self.lastName.text = snapshot.value as? String
        })
        databaseHandle = ref?.child((Auth.auth().currentUser?.uid)!).child("PhoneNumber").observe(.childAdded, with: { (snapshot) in
            self.phoneNumber.text = snapshot.value as? String
        })
        databaseHandle = ref?.child((Auth.auth().currentUser?.uid)!).child("StreetAddress").observe(.childAdded, with: { (snapshot) in
            self.address.text = snapshot.value as? String
        })
        databaseHandle = ref?.child((Auth.auth().currentUser?.uid)!).child("City").observe(.childAdded, with: { (snapshot) in
            self.city.text = snapshot.value as? String
        })
        databaseHandle = ref?.child((Auth.auth().currentUser?.uid)!).child("State").observe(.childAdded, with: { (snapshot) in
            self.state.text = snapshot.value as? String
        })
        databaseHandle = ref?.child((Auth.auth().currentUser?.uid)!).child("ZipCode").observe(.childAdded, with: { (snapshot) in
            self.zip.text = snapshot.value as? String
        })
        
        firstName.isEnabled = false;
        lastName.isEnabled = false;
        phoneNumber.isEnabled = false;
        address.isEnabled = false;
        city.isEnabled = false;
        state.isEnabled = false;
        zip.isEnabled = false;
        
        firstName.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lastName.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        phoneNumber.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        address.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        city.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        state.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        zip.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Save(_ sender: UIButton){
        
        
        // If all the text fields are filled then the Database is updated with the users new information
        
        if(firstName.text != ""){
            if(lastName.text != ""){
                if(phoneNumber.text != ""){
                    if(address.text != ""){
                        if(city.text != ""){
                            if(state.text != ""){
                                if(zip.text != ""){
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("FirstName").updateChildValues(["firstname" : firstName.text!])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("LastName").updateChildValues(["lastname" : lastName.text!])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("PhoneNumber").updateChildValues(["phonenumber" : phoneNumber.text!])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("StreetAddress").updateChildValues(["streetaddress" : address.text!])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("City").updateChildValues(["city" : city.text!])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("ZipCode").updateChildValues(["zipcode" : zip.text!])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("State").updateChildValues(["state" : state.text!])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("FullName").updateChildValues(["fullname" : firstName.text! + " " + lastName.text!])
                                    
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
    @IBAction func editButton(_ sender: UIButton) {
        if(editButton.currentTitle == "Edit"){
            editButton.setTitle("Done", for: UIControlState.normal)
            
            firstName.isEnabled = true;
            lastName.isEnabled = true;
            phoneNumber.isEnabled = true;
            address.isEnabled = true;
            city.isEnabled = true;
            state.isEnabled = true;
            zip.isEnabled = true;
            
            firstName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            lastName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            phoneNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            address.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            city.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            state.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            zip.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            firstName.isEnabled = false;
            lastName.isEnabled = false;
            phoneNumber.isEnabled = false;
            address.isEnabled = false;
            city.isEnabled = false;
            state.isEnabled = false;
            zip.isEnabled = false;
            
            firstName.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            lastName.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            phoneNumber.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            address.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            city.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            state.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            zip.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            
        }
        
        
    }
}


