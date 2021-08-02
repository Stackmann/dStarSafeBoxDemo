//
//  Presentable.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 01.08.2021.
//
import UIKit

protocol Presentable {
  func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
  
  func toPresent() -> UIViewController? {
    return self
  }
}
