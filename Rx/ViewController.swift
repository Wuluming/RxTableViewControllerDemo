//
//  ViewController.swift
//  Rx
//
//  Created by wlm on 16/11/26.
//  Copyright © 2016年 wlm. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class ViewController: UIViewController {
    let listView: UITableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
    let disposeBag = DisposeBag()
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, User>>()
    let viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RxDemo"
        view.addSubview(listView)
        listView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        dataSource.configureCell = {dataSource, tableView, indexPath,user in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let string = "\(user.screenName) is Follwing,\(user.followingCount)and follwed by \(user.followersCount)"
            cell.textLabel?.text = string
            cell.textLabel?.numberOfLines = 0
            return cell
        }
        
        viewModel.getUsers()
            .bindTo(listView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

