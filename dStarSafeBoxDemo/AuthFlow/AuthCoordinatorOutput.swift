//
//  AuthCoordinatorOutput.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//

protocol AuthCoordinatorOutput: class {
  var finishFlow: (() -> Void)? { get set }
}
