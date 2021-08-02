//
//  SignUpView.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//

protocol SignUpView: BaseView {
  var onSignUpComplete: (() -> Void)? { get set }
}
