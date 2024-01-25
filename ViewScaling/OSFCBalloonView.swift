//
//  OSFCBalloonView.swift
//  SmiralCamera
//
//  Created by Kentaro Kawai on 2024/01/12.
//

import UIKit

class OSFCBalloonView: UIView {
  let balloon: UIView!
  let message: UILabel!
  
  override init(frame: CGRect) {
    balloon = UIView()
    message = UILabel()
    
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    /*
    guard let balloon = self.balloon else {
      return
    }
    guard let message = self.balloon else {
      return
    }
     */
    
    balloon.isHidden = true
    balloon.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    balloon.backgroundColor = .white
    addSubview(balloon)
   
    message.textAlignment = .left
    message.textColor = OSFCUtil.osfDeepblueColor
    
    message.numberOfLines = 3
    balloon.addSubview(message)
  }
  
  override func layoutSubviews() {
    let balloonSize = min(self.bounds.width, self.bounds.height) * 0.62
    //var center = CGRect(x: 0, y: self.bounds.height, width: size, height: size)
    balloon.frame.size = CGSize(width: balloonSize, height: balloonSize)
    balloon.center = CGPoint(x: balloonSize * 0.23,
                             y: self.bounds.height - balloonSize * 0.23)
    balloon.layer.cornerRadius = balloonSize * 0.5
    
    var messageFrame = balloon.bounds
    messageFrame.size.width = balloon.bounds.size.width * 0.62
    messageFrame.size.height = balloon.bounds.size.width * 0.76
    messageFrame.origin.x = balloon.bounds.size.width * 0.38
    message.frame = messageFrame
    
    let fontSize = balloonSize * 0.09
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = fontSize * 0.62
    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont(name: "HiraKakuProN-W6", size: fontSize) ??
            UIFont.systemFont(ofSize: fontSize),
      .paragraphStyle: paragraphStyle
    ]
    let attributedString =
      NSAttributedString(string: "笑顔で\n選手に\n投票しよう！",
                         attributes: attributes)
    message.attributedText = attributedString
  }
  
  // アニメーションの実行中に他のアニメーションを実行すると予期しない動作になるのでフラグで管理
  // isAppearing 表示アニメーションの最初から非表示アニメーションの終了まで
  // isDisappearing 非表示アニメーションの開始から表示アニメーションの終了まで
  // 表示・非表示それぞれのアニメーション中はどちらのフラグも真
  
  var isAppearable: Bool = true
  var isDisappearable: Bool = false
  
  func appear() {
    self.isAppearable = false
    balloon.isHidden = false
    
    self.disappear()
    /*
    balloon.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
      self.balloon.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }, completion: {_ in
      self.isDisappearable = true
      self.disappear()
    })
     */
  }
  
  func disappear() {
    self.isDisappearable = false
    
    balloon.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    //balloon.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
      print(self.balloon.transform)
      self.balloon.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
      //self.balloon.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }, completion: {_ in
      self.isAppearable = true
      self.balloon.isHidden = true
    })
  }
}
