//
//  AuthModuleFactory.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//

protocol AuthModuleFactory {
  func makeAuthView() -> AuthView
  func makeSignUpView() -> SignUpView
  //func makeTermsOutput() -> TermsView
}
