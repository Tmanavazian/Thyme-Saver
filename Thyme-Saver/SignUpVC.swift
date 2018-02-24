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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var profileSetupViewController = segue.destination as! ProfileSetupVC
        profileSetupViewController.myString = segueLabel.text!
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        var email = emailField.text
        
        var beforeAt = email?.substring(to: (email?.characters.index(of: "@"))!)
        var provider = email?.substring(from:(email?.characters.index(after: (email?.characters.index(of: "@"))!))!)
        var provider2 = provider?.substring(to:(provider?.characters.index(after: (provider?.characters.index(of: "."))!))!)
        var childSupport = String(beforeAt!) + String(provider2!)
        var profile = childSupport.substring(to: childSupport.index(before: childSupport.endIndex))
//        let goToProfile = self.storyboard?.instantiateViewController(withIdentifier: "goToProfileSetup")

        if(passwordField.text! == confirmPasswordField.text!){
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error ) in
                if let u = user{
                    self.ref.child(profile).childByAutoId().setValue(["email": self.emailField.text!])
//                    self.present(goToProfile!,animated: false, completion: nil)
                    self.performSegue(withIdentifier: "segueToProfileSetup", sender: self
                    )
                    self.segueLabel.text = profile
                    
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
