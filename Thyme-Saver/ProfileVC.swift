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
    
    
    
    // reference to Database
    var myString = String()
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    
    override func viewWillAppear(_ animated: Bool) {
        databaseHandle = ref?.child((Auth.auth().currentUser?.uid)!).child("FullName").observe(.childAdded, with: { (snapshot) in
            self.nameLabel.text = snapshot.value as? String
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // sets the reference to the Database
        ref = Database.database().reference()
        
        segueLabel.text = myString
        //nameLabel.text = self.firstName + self.lastName
        

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func toProfileEdit(_ sender: UIButton) {
        
        // goes to the profile edit page
        self.performSegue(withIdentifier: "segueToProfileEdit", sender: self)

    }
    

}
