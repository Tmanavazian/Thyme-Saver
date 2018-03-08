//
//  SignUpVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 2/7/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class SignUpVC: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var segueLabel: UILabel!
    
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
    
    // sets the label on the next VC = to the database child
    @IBAction func signUp(_ sender: UIButton) {

        
        // checks to see if passwords match and then creates an account for the user
        if(passwordField.text! == confirmPasswordField.text!){
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error ) in
                if let u = user{
                    // Writes data to the Database and goes to the next VC
                    self.performSegue(withIdentifier: "segueToProfileSetup", sender: self)
                    
                } else{
                    // if the user isnt signed up then an error is displayed
                    print("error signing in \(error! .localizedDescription) ")
                    self.displayLabel.text = "\(error! .localizedDescription)"
                }
            }
        } else{
            // if the passwords dont match an error is displayed
            self.displayLabel.text = "Passwords do not match!"
        }
    }
    
    // overrides the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        confirmPasswordField.resignFirstResponder()
    }
}
