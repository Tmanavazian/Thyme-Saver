//
//  ProfileVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 2/27/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ProfileVC: UIViewController {
    @IBOutlet weak var segueLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var myString = String()
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    var firstName = String();
    var lastName = String();
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let profileEditViewController = segue.destination as! ProfileEditVC
        profileEditViewController.myString = segueLabel.text!
        
        databaseHandle = ref?.child(myString).child("FirstName").observe(.childAdded, with: { (snapshot) in
            profileEditViewController.firstName.text = snapshot.value as? String
        })
        databaseHandle = ref?.child(myString).child("LastName").observe(.childAdded, with: { (snapshot) in
            profileEditViewController.lastName.text = snapshot.value as? String
        })
        databaseHandle = ref?.child(myString).child("PhoneNumber").observe(.childAdded, with: { (snapshot) in
            profileEditViewController.phoneNumber.text = snapshot.value as? String
        })
        databaseHandle = ref?.child(myString).child("StreetAddress").observe(.childAdded, with: { (snapshot) in
            profileEditViewController.address.text = snapshot.value as? String
        })
        databaseHandle = ref?.child(myString).child("City").observe(.childAdded, with: { (snapshot) in
            profileEditViewController.city.text = snapshot.value as? String
        })
        databaseHandle = ref?.child(myString).child("ZipCode").observe(.childAdded, with: { (snapshot) in
            profileEditViewController.zip.text = snapshot.value as? String
        })
        databaseHandle = ref?.child(myString).child("State").observe(.childAdded, with: { (snapshot) in
            profileEditViewController.state.text = snapshot.value as? String
        })
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        
        segueLabel.text = myString
        //nameLabel.text = self.firstName + self.lastName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func toProfileEdit(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "segueToProfileEdit", sender: self)

    }
    

}
