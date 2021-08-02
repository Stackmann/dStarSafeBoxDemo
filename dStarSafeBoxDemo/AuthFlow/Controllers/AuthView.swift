//
//  AuthView.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//

protocol AuthView: BaseView {
  var onCompleteAuth: (() -> Void)? { get set }
  var onRestorePasswordButtonTap: (() -> Void)? { get set }
}

