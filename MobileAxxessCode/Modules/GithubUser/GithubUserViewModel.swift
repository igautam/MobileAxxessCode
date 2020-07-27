//
//  GithubUserViewModel.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Foundation
import PromiseKit
import RealmSwift

protocol UpdateGithubViewController {
    func updategithubUserList()
}
class GithubUserViewModel {
    var router: BaseGithubUserRouter
    let realm = try! Realm()
    lazy var githubUsers: Results<GithubUserModel> = {
        self.realm.objects(GithubUserModel.self).sorted(byKeyPath: "userType")
    }()
    var delegate: UpdateGithubViewController?
    
    init(router: BaseGithubUserRouter) {
        self.router = router
    }
    
    func fetchGithubUser() {
        router.getGithubUser().done { [weak self] results in
            print("results: ***************  ", results)
            self?.saveUserToDB(results)
            self?.delegate?.updategithubUserList()
        }.catch { (error) in
             print(error)
        }
    }
    
    func saveUserToDB(_ users: [GithubUserModel]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
                for user in users {
                    realm.add(user)
                }
            }
        } catch {
            print("Error in accessing realm db")
        }
    }
}

