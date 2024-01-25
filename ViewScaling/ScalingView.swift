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
    addSubview(subview)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    subview.backgroundColor = .white
    let subviewSize = 100
    subview.frame.size = CGSize(width: subviewSize, height: subviewSize)
    subview.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
    subview.transform = CGAffineTransform(scaleX: 2, y: 2)
  }
}
