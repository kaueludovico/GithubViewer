//
//  User.swift
//  GithubViewerScroll
//
//  Created by Kaue Ludovico on 24/02/23.
//

import Foundation

struct User : Decodable {
    let id: Int
    let login: String
    let name: String?
    let followers: Int
    let following: Int
    let avatarUrl: String?
}
