//
//  ViewController.swift
//  ViewScaling
//
//  Created by Kentaro Kawai on 2024/01/19.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view.backgroundColor = .gray
  }

  override func viewWillAppear(_ animated: Bool) {
    let scalingView = ScalingView(frame: self.view.bounds)
    self.view.addSubview(scalingView)
  }
}

