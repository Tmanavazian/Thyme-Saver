//
//  HomeVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 2/25/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeVC: UIViewController {
    
    
    
    var myString = String()
    
    // reference to Database and Database handler
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // sets reference
        ref = Database.database().reference()

    }
    
    // sends the users full name to the next viewcontroller


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func next(_ sender: UIButton) {
        // goes to the profile page
        self.performSegue(withIdentifier: "segueToProfile", sender: self)
    }
    

    
    
    
    
}
