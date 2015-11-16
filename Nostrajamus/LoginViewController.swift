//
//  LoginViewController.swift
//  Nostrajamus
//
//  Created by Jun Sup Lee on 10/1/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorTextField: UITextView!
    
    @IBAction func loginButton(sender: UIButton) {
        
        /* Perform authentication of user */
        RestApiManager.sharedInstance.authenticate(usernameTextField.text!, password: passwordTextField.text!) { isAuthenticated in
            NSOperationQueue.mainQueue().addOperationWithBlock {
                if (isAuthenticated) {
                    self.usernameTextField.text = ""
                    self.passwordTextField.text = ""
                    RestApiManager.sharedInstance.baseURL = Constants.baseURL
                    self.performSegueWithIdentifier("login", sender: self)
                }
                else {
                    self.errorTextField.text = "Authentication failed"
                    self.usernameTextField.text = ""
                    self.passwordTextField.text = ""
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable keyboard when tapping outside text fields
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //Enter key on iOS keyboard presses Log In button
        passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        passwordTextField.resignFirstResponder()
        loginButton(UIButton())
        return true
    }

}