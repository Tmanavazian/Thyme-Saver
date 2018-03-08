//
//  PasswordResetVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 3/6/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseDatabase

class PasswordResetVC: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func passwordReset(_ sender: UIButton) {
        
        
        if(emailField.text != ""){
            Auth.auth().sendPasswordReset(withEmail: emailField.text!) { (error) in
                if error == nil {
                    self.performSegue(withIdentifier: "passwordResetToSignIn", sender: self)
                } else {
                    self.displayLabel.text = "\(error! .localizedDescription)"
                }
            }
        } else {
            displayLabel.text = "Please enter and email"
        }
    }
    

}
