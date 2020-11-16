//
//  ResetViewController.swift
//  LoginApp
//
//  Created by 胡秉诚 on 11/16/20.
//

//
//  SignupViewController.swift
//  LoginApp
//
//  Created by 胡秉诚 on 11/16/20.
//

import UIKit
import Firebase

class ResetViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func reset(_ sender: Any) {
        let email = txtEmail.text
        
        if email == "" {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid e mail"
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email!) { error in
//            guard let strongSelf = self else { return }
            
            if error != nil {
                self.lblStatus.text = error?.localizedDescription
                return
            } else {
                self.lblStatus.text = "Email Sent Successfully"
            }
        }
    }
    
}
