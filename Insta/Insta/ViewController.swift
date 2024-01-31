//
//  ViewController.swift
//  Insta
//
//  Created by support on 29/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailAddressField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var logInBtn: UIButton!
    
    var networkHandler = NetworkHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logInBtn(_ sender: Any) {
        emailAddressField.text = "Anjali@gmail.com"
        passwordField.text = "Qwerty@123"
        
        if emailAddressField.text?.isEmpty == true || passwordField.text?.isEmpty == true{
            logInBtn.isUserInteractionEnabled = false
            let alertMessageForEmptyCredential = UIAlertController(title: "Please fill the credential", message: "Something went wrong", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default)
            
            alertMessageForEmptyCredential.addAction(okButton);
            self.present(alertMessageForEmptyCredential, animated: true)
            return
            
        }else{
            logInBtn.isUserInteractionEnabled = true
            let email = emailAddressField.text!
            let password = passwordField.text!

            networkHandler.loginAPICall(email: email, password: password) { val in
                if val {
                    DispatchQueue.main.async {
                        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "newsFeed")
                        self.navigationController?.pushViewController(nextVC!, animated: true)
                        print("Navigate")
                    }
                }else{
                    let alertMessageForWrongCredential = UIAlertController(title: "Wrong Password", message: "Something went wrong", preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Ok", style: .default)
                    
                    alertMessageForWrongCredential.addAction(okButton);
                    self.present(alertMessageForWrongCredential, animated: true)
                }
            }
        }
    }
    
}

