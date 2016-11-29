//
//  ViewModel.swift
//  Rx
//
//  Created by wlm on 16/11/29.
//  Copyright © 2016年 wlm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ViewModel{
    func getUsers() -> Observable<[SectionModel<String, User>]> {
        return Observable.create({ (observer) -> Disposable in
            let users = [User(followersCount: 1005, followingCount: 390, screenName: "BlackMne"),
                         User(followersCount: 302, followingCount: 300, screenName: "RedDog"),
                         User(followersCount: 110, followingCount: 400, screenName: "OrangeBig")]
            let section = [SectionModel(model: "", items: users)]
            observer.onNext(section)
            observer.onCompleted()
            return Disposables.create()
        })
    }
}
