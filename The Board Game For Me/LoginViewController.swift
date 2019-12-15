//
//  LoginViewController.swift
//  The Board Game For Me
//
//  Created by Alex Harris on 12/9/19.
//  Copyright © 2019 Crap Apps. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signinButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func validateFields() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
               return "Please fill in all fields"
           }
        return nil
    }
    
    @IBAction func signinTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            showError(message : error!)
        }
        else{
            let email = emailTextField.text!.trimmingCharacters(in: .whitespaces)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespaces)
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil{
                    self.showError(message: "Could not sign in")
                }
                else{
                    self.goHome()
                }
            }
        }
        
    }
    func showError(  message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func goHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeViewController) 
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
