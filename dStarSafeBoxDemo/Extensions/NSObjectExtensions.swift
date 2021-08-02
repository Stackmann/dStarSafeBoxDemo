//
//  NSObjectExtensions.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//
import UIKit

extension NSObject {
  
  class var nameOfClass: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}
