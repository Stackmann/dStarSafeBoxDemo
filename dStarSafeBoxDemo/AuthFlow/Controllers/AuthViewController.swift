//
//  AuthViewController.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//

import UIKit

class AuthViewController: UIViewController, AuthView {
    
    var onCompleteAuth: (() -> Void)?
    var onRestorePasswordButtonTap: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func acceptButtonTaped(_ sender: UIButton) { onCompleteAuth?() }
}
