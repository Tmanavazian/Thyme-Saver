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
    @IBOutlet weak var segueLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeViewController = segue.destination as! HomeVC
        homeViewController.myString = segueLabel.text!
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        
        var email = emailTextField.text
        
        // gets child for Realtime database
        
        let beforeAt = email?.substring(to: (email?.characters.index(of: "@"))!)
        let provider = email?.substring(from:(email?.characters.index(after: (email?.characters.index(of: "@"))!))!)
        let provider2 = provider?.substring(to:(provider?.characters.index(after: (provider?.characters.index(of: "."))!))!)
        let childSupport = String(beforeAt!) + String(provider2!)
        let profile = childSupport.substring(to: childSupport.index(before: childSupport.endIndex))

        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error == nil && user != nil{
                print(profile)
                self.segueLabel.text = profile
                self.performSegue(withIdentifier: "signInToHome", sender: self)

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
