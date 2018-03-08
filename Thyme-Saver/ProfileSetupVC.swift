//
//  ProfileSetupVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 2/22/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase


class ProfileSetupVC: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var segueLabelVC2: UILabel!
    
    // reference to Database
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func nextButton(_ sender: UIButton) {
        
        //var goToHomePage = self.storyboard?.instantiateViewController(withIdentifier: "HomePage")

        //Checks to see if all the fields are filled and then Writes that data to the Database
        if(firstName.text != ""){
            if(lastName.text != ""){
                if(phoneNumber.text != ""){
                    if(streetAddress.text != ""){
                        if(cityField.text != ""){
                            if(stateField.text != ""){
                                if(zipCode.text != ""){
                                    
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("PhoneNumber").setValue(["phonenumber": phoneNumber.text ])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("FirstName").setValue(["firstname": firstName.text ])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("LastName").setValue(["lastname": lastName.text ])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("StreetAddress").setValue(["streetaddress": streetAddress.text ])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("ZipCode").setValue(["zipcode": zipCode.text ])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("State").setValue(["state": stateField.text ])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("City").setValue(["city": cityField.text ])
                                    self.ref.child((Auth.auth().currentUser?.uid)!).child("FullName").setValue(["fullname": firstName.text! + " " + lastName.text!])
                                    
                                    //self.present(goToHomePage!,animated: false, completion: nil)

                                    self.performSegue(withIdentifier: "segueToHome", sender: self)
                                    
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
    
    // overrides the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstName.resignFirstResponder()
    }
    

}
