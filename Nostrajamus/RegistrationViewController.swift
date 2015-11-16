//
//  RegistrationViewController.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 11/15/15.
//  Copyright © 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorTextField: UITextView!
    
    @IBAction func registerButton(sender: UIButton) {
        RestApiManager.sharedInstance.register(emailTextField.text!, username: usernameTextField.text!, password: passwordTextField.text!) { isRegistered in
            print(isRegistered)
            self.usernameTextField.text = ""
            self.passwordTextField.text = ""
            self.emailTextField.text = ""
            if isRegistered {
                self.performSegueWithIdentifier("register", sender: self)
            }
            else {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
