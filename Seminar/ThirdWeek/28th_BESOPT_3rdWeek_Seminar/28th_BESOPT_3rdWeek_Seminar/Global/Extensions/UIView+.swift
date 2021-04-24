//
//  UIView+.swift
//  28th_BESOPT_3rdWeek_Seminar
//
//  Created by 노한솔 on 2021/04/13.
//

import UIKit

extension UIView {
  
  @discardableResult
  func add<T: UIView>(_ subview: T, then closure: ((T) -> Void)? = nil) -> T {
    addSubview(subview)
    closure?(subview)
    return subview
  }
  
  @discardableResult
  func adds<T: UIView>(_ subviews: [T], then closure: (([T]) -> Void)? = nil) -> [T] {
    subviews.forEach { addSubview($0) }
    closure?(subviews)
    return subviews
  }
}

