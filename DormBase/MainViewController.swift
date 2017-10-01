//
//  ViewController.swift
//  DormBase
//
//  Created by Nick Pappas on 9/29/17.
//  Copyright © 2017 Nick Pappas. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        emailField.delegate = self;
        passwordField.delegate = self;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func onButtonPress(_ sender: Any)
    {
        if(emailField.text != nil && passwordField != nil)
        {
            self.goToView(withID: "HallViewController", handler:
                {   (vc) in
                    if let nextVC = vc as? HallViewController
                    {
                        nextVC.authEmail = self.emailField.text!
                        nextVC.authPass = self.passwordField.text!
                }
            })
        }
    }
}

extension UIViewController
{
    func goToView(withID identifier: String, handler: ((UIViewController) -> Void)?)
    {
        if let vc = storyboard?.instantiateViewController(withIdentifier: identifier)
        {
            if handler != nil {handler!(vc)}
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

