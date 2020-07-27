//
//  GenericBaseTableView.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Foundation
import UIKit

class ValueTableViewCell<T>: UITableViewCell {
    var value: T?
    var indexPath: IndexPath?
    
    init() {
        super.init(style: .default, reuseIdentifier: "")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
}

//Array Table view with template T, we can alos used Any in place of Template
class ArrayTableViewDelegateDataSource<T>: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var array: [T] = []
    // MARK: - Delegate
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ValueTableViewCell<T>
        cell.value = array[indexPath.row]
        cell.indexPath = indexPath
        return cell
    }
}

