//
//  User.swift
//  Rx
//
//  Created by wlm on 16/11/29.
//  Copyright © 2016年 wlm. All rights reserved.
//

import Foundation

struct  User {
    let followersCount: Int
    let followingCount: Int
    let screenName: String
    
    init(followersCount: Int, followingCount: Int, screenName: String) {
        self.followersCount = followersCount
        self.followingCount = followingCount
        self.screenName = screenName
    }
}

