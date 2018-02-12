//
//  Models.swift
//  CodableInAction
//
//  Created by Ken Siu on 12/2/2018.
//  Copyright © 2018 Ken Siu. All rights reserved.
//

import Foundation

struct GitHubUser: Codable {
    let id: Int?
    let login: String?
    let avatarUrl: URL?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
    }
}

enum GitHubUserOrBool: Decodable {
    case github(GitHubUser)
    case bool(Bool)
    
    enum CodingKeys: String, CodingKey {
        case github, bool
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let githubUser = try container.decodeIfPresent(GitHubUser.self, forKey: .github) {
            self = .github(githubUser)
        } else {
            self = .bool(try container.decode(Bool.self, forKey: .bool))
        }
    }
}

struct TypeContainsAGitHubUser: Decodable {
    let gitHub: GitHubUser?
    let simpleString: String?
    
    enum CodingKeys: String, CodingKey {
        case gitHub = "github"
        case simpleString = "testkey"
    }
}
