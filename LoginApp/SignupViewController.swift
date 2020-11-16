//
//  SignupViewController.swift
//  LoginApp
//
//  Created by 胡秉诚 on 11/16/20.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBAction func signup(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid e mail"
            return
        }
        
        Auth.auth().createUser(withEmail: email!, password: password!) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            
            self?.txtPassword.text = ""
            
            // I have successfully logged in  go to Dashboard
            self!.performSegue(withIdentifier: "signupSegue", sender: strongSelf)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
