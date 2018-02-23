//
//  SignUpVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 2/7/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpVC: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        if(passwordField.text! == confirmPasswordField.text!){
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error ) in
                if let u = user{
                    self.performSegue(withIdentifier: "goToWelcome", sender: self)
                } else{
                    print("error signing in \(error! .localizedDescription) ")
                    self.displayLabel.text = "\(error! .localizedDescription)"
                }
            }
        }else{
            self.displayLabel.text = "Passwords do not match!"
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        confirmPasswordField.resignFirstResponder()
    }
}
