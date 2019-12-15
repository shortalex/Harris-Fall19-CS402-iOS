//
//  RegisterViewController.swift
//  The Board Game For Me
//
//  Created by Alex Harris on 12/9/19.
//  Copyright © 2019 Crap Apps. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var firstNameTestField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
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
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    //check fields
    func validateFields() -> String? {
        
        //fields filled
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            firstNameTestField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields"
        }
        
        let passwordCheck = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(passwordCheck) == false{
            return "Please make sure your password is at least 8 characters long and contains a number and a special character."
        }
        
        return nil
    }

    @IBAction func registerTapped(_ sender: Any) {
        
        //Validate fields
        let error = validateFields()
        
        if error != nil {
            showError(message : error!)
        }
        else{
            let checkedUsername = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let checkedEmail = emailTextField.text!.trimmingCharacters(in: .whitespaces)
            let checkedFirstName = firstNameTestField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let checkedLastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let checkedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespaces)
            
            Auth.auth().createUser(withEmail: checkedEmail, password: checkedPassword) { (result, err) in
                if err != nil {
                    self.showError(message: "Error creating user.")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "firstname": checkedFirstName,
                        "last": checkedLastName,
                        "username": checkedUsername,
                        "uid": result!.user.uid
                    ]) { (error) in
                        if error != nil {
                            self.showError(message: "Saving user data")
                        }
                    }
                }
            }
            self.goHome()
        }
        
        //Create user
        
        //Go to home
        
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showError(  message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func goHome() {
        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeViewController)
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
    
}
