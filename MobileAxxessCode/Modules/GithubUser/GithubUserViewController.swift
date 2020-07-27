//
//  GithubUserViewController.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import UIKit
import SnapKit
import RealmSwift

class GithubUserViewController: UIViewController {
    var githubUserTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var viewModel = GithubUserViewModel(router: GithubUserRouter())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addTableView()
        fetchUserData()
    }
    
    func addTableView() {
        githubUserTableView.estimatedRowHeight = 200
        githubUserTableView.rowHeight = UITableView.automaticDimension
        githubUserTableView.delegate = self
        githubUserTableView.dataSource = self
        githubUserTableView.register(GithubUserTableViewCell.self,
                                     forCellReuseIdentifier: "cell")
        view.addSubview(githubUserTableView)
        githubUserTableView.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func fetchUserData() {
        viewModel.delegate = self
        if viewModel.githubUsers.count == 0 {
            viewModel.fetchGithubUser()
        }
    }

}

extension GithubUserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.githubUsers.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath) as! GithubUserTableViewCell
        let user = viewModel.githubUsers[indexPath.row]
        cell.setValue(user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.githubUsers[indexPath.row]
        let detailVC = GithubUserDetailViewController()
        //detailVC.view.frame = view.bounds
        detailVC.user = user
        present(detailVC, animated: true, completion: nil)
    }
}

extension GithubUserViewController: UpdateGithubViewController {
    func updategithubUserList() {
        githubUserTableView.reloadData()
    }
}
