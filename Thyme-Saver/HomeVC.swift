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
    
    
    @IBOutlet weak var segueLabel: UILabel!
    
    var myString = String()

    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        segueLabel.text = myString

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let homeViewController = segue.destination as! ProfileVC
        homeViewController.myString = segueLabel.text!
        
        databaseHandle = ref?.child(myString).child("FullName").observe(.childAdded, with: { (snapshot) in
            homeViewController.nameLabel.text = snapshot.value as? String
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: UIButton) {

        self.performSegue(withIdentifier: "segueToProfile", sender: self)
        
    }
    

    
    
    
    
}
