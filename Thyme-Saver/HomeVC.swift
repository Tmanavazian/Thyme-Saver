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
    
}
