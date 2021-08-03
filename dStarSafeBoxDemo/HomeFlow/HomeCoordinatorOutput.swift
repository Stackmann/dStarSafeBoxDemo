//
//  HomeCoordinatorOutput.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//

protocol HomeCoordinatorOutput: class {
  var openActivityFlow: (() -> Void)? { get set }
}
