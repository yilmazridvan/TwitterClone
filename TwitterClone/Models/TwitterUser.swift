//
//  TwitterUser.swift
//  TwitterClone
//
//  Created by Rıdvan Yılmaz on 23.12.2022.
//

import Foundation
import Firebase

struct TwitterUser: Codable {
    let id: String
    var displayName: String = ""
    var username: String = ""
    var followersCount: Double = 0
    var followingCount: Double = 0
    var createdOn: Date = Date()
    var bio: String = ""
    var avatarPath: String = ""
    var isUserOnboard: Bool = false
    
    init(from user: User) {
        self.id = user.uid
        
        
    }
}
