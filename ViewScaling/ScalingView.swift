//
//  ScalingView.swift
//  ViewScaling
//
//  Created by Kentaro Kawai on 2024/01/19.
//

import UIKit

class ScalingView: UIView {
  let subview: UIView!
  
  override init(frame: CGRect) {
    subview = UIView()
    super.init(frame: frame)
    
    subview.backgroundColor = .white
    let subviewSize = 100
    subview.frame.size = CGSize(width: subviewSize, height: subviewSize)
    subview.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
    
    addSubview(subview)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    scaleSubview()
  }
  
  func scaleSubview() {
    subview.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
  }
}
