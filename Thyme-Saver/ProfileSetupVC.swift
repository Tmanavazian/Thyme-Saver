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
    
    
    var ref: DatabaseReference!
    
    var myString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        segueLabelVC2.text = myString
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeViewController = segue.destination as! HomeVC
        homeViewController.myString = segueLabelVC2.text!
    }
    

    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        let goToHomePage = self.storyboard?.instantiateViewController(withIdentifier: "HomePage")

        
        if(firstName.text != ""){
            if(lastName.text != ""){
                if(phoneNumber.text != ""){
                    if(streetAddress.text != ""){
                        if(cityField.text != ""){
                            if(stateField.text != ""){
                                if(zipCode.text != ""){
                                    
                                    self.ref.child(segueLabelVC2.text!).childByAutoId().setValue(["phonenumber": phoneNumber.text ])
                                    self.ref.child(segueLabelVC2.text!).childByAutoId().setValue(["firstname": firstName.text ])
                                    self.ref.child(segueLabelVC2.text!).childByAutoId().setValue(["lastname": lastName.text ])
                                    self.ref.child(segueLabelVC2.text!).childByAutoId().setValue(["streetaddress": streetAddress.text ])
                                    self.ref.child(segueLabelVC2.text!).childByAutoId().setValue(["zipcode": zipCode.text ])
                                    self.ref.child(segueLabelVC2.text!).childByAutoId().setValue(["state": stateField.text ])
                                    self.ref.child(segueLabelVC2.text!).childByAutoId().setValue(["city": cityField.text ])
                                    
                                    self.present(goToHomePage!,animated: false, completion: nil)

                                    
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
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstName.resignFirstResponder()
    }
    

}
