//
//  GithubUserTableViewCell.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage

class GithubUserTableViewCell: UITableViewCell {
    
    var userIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var userTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var userDataText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var userDataImage: UIImageView = {
        let imageView = UIImageView()
       // imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(userIdLabel)
        userIdLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(10)
        }
        contentView.addSubview(userTypeLabel)
        userTypeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(userIdLabel.snp.bottom).offset(10)
        }
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(userTypeLabel.snp.bottom).offset(10)
        }
    }
    
    func setValue(_ value: GithubUserModel) {
        userIdLabel.text = "User id: \(value.userId ?? "")"
        userTypeLabel.text = "User type: \(value.userType ?? "")"
        dateLabel.text = "Date: \(value.date ?? "")"
        userDataText.removeFromSuperview()
        userDataImage.removeFromSuperview()
        
        if let userType = value.userType {
            if ( userType == "text") {
                userDataText.text = value.userData
                userDataText.numberOfLines = 0
                contentView.addSubview(userDataText)
                userDataText.snp.makeConstraints { make in
                    make.left.equalToSuperview().offset(20)
                    make.right.equalToSuperview().offset(-20)
                    make.top.equalTo(dateLabel.snp.bottom).offset(10)
                    make.bottom.equalToSuperview().offset(-20)
                }
            } else {
                contentView.addSubview(userDataImage)
                if let urlStr = value.userData,
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
        contentView.layoutIfNeeded()
    }
    
//    override func layoutSubviews() {
//        if userDataText != nil {
//            userDataText?.snp.makeConstraints { make in
//                make.left.equalToSuperview().offset(10)
//                make.right.equalToSuperview().offset(10)
//                make.top.equalTo(userTypeLabel.snp.bottom).offset(10)
//                make.bottom.equalToSuperview().offset(-20)
//            }
//        }
//    }
}
