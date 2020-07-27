//
//  GithubUserDetailViewController.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 27/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import UIKit
import SnapKit

class GithubUserDetailViewController: UIViewController {

    var user: GithubUserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupUser()
        setUpDismissButton()
        
    }
    
    func setUpDismissButton() {
        let button = UIButton(type: .custom)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("X", for: .normal)
        button.addTarget(self, action: #selector(self.dismissView(sender:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
    
    @objc func dismissView(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupUser() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        let userIdLabel = UILabel()
        scrollView.addSubview(userIdLabel)
        userIdLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(60)
        }
        userIdLabel.text = "User id: \(user?.userId ?? "")"
        
        let userTypeLabel = UILabel()
        scrollView.addSubview(userTypeLabel)
        userTypeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(userIdLabel.snp.bottom).offset(10)
        }
        userTypeLabel.text = "User type: \(user?.userType ?? "")"
        
        let dateLabel = UILabel()
        scrollView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(userTypeLabel.snp.bottom).offset(10)
        }
        dateLabel.text = "Date: \(user?.date ?? "")"
        
        if let userType = user?.userType {
            if ( userType == "text") {
                let userDataText = UILabel()
                userDataText.text = user?.userData
                userDataText.numberOfLines = 0
                scrollView.addSubview(userDataText)
                userDataText.snp.makeConstraints { make in
                    make.left.equalToSuperview().offset(20)
                    make.right.equalToSuperview().offset(-20)
                    make.top.equalTo(dateLabel.snp.bottom).offset(10)
                    make.bottom.equalToSuperview().offset(-20)
                    make.width.equalToSuperview().offset(-40)
                }
            } else {
                let userDataImage = UIImageView()
                scrollView.addSubview(userDataImage)
                if let urlStr = user?.userData,
                    let url = URL(string: urlStr) {
                    let placeHolder = UIImage(named: "noPhoto")
                    userDataImage.af.setImage(withURL: url, placeholderImage: placeHolder)
                } else {
                    userDataImage.image = UIImage(named: "defaultVideo")
                }
                userDataImage.snp.makeConstraints { make in
                    make.left.equalToSuperview().offset(20)
                    make.right.equalToSuperview().offset(-20)
                    make.top.equalTo(dateLabel.snp.bottom).offset(20)
                    make.bottom.equalToSuperview().offset(-20)
                    make.height.equalTo(150)
                }
            }
        }
    }
    
}

extension GithubUserDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.x>0 {
//            scrollView.contentOffset.x = 0
//        }
    }
}
