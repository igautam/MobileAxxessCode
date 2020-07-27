//
//  ViewController.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        label = UILabel()
        label.text = "Without Storyboard"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        view.addSubview(label)
        contraintsInit()
    }

    func contraintsInit() {
        label.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.topMargin.equalToSuperview()
            make.leftMargin.equalToSuperview()
            make.rightMargin.equalToSuperview()
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
        }
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
    }

}

