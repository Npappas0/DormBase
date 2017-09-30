//
//  ViewController.swift
//  DormBase
//
//  Created by Nick Pappas on 9/29/17.
//  Copyright © 2017 Nick Pappas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
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
 
}

