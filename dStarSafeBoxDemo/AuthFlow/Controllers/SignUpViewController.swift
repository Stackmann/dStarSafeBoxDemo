//
//  SignUpViewController.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//

import UIKit

class SignUpViewController: UIViewController, SignUpView {
    
    var onSignUpComplete: (() -> Void)?

    @IBOutlet weak var firstPwdTextField: UITextField!
    @IBOutlet weak var SecondPwdTextField: UITextField!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.systemGray5
        navigationController?.navigationBar.isTranslucent = false
        super.viewDidLoad()
    }

}
