//
//  SignInVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 2/7/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error == nil && user != nil{
                self.performSegue(withIdentifier: "goToWelcome", sender: self)
            }else {
                print("error signing in \(error! .localizedDescription) ")
                self.displayLabel.text = "\(error! .localizedDescription)"
            }
            
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
}
