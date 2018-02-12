//
//  ViewController.swift
//  CodableInAction
//
//  Created by Ken Siu on 12/2/2018.
//  Copyright © 2018 Ken Siu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let decoder: JSONDecoder = {
        return JSONDecoder()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        demoWithLocalJson()
//        demoWithLocalJsonArray()
//        demoWithLocalJsonDict()
//        demoWithLocalJsonNBool()
        demoWithDataThatContainsAGitHubUser()
    }
    
    private func demoWithLocalJson() {
        let githubUser = try! decoder.decode(GitHubUser.self, from: aGithubUser)
        print(githubUser)
    }
    
    private func demoWithLocalJsonArray() {
        let parsedGitHubUsersArray = try! decoder.decode([GitHubUser].self, from: gitHubUsersArray)
        parsedGitHubUsersArray.forEach{print($0)}
    }
    
    private func demoWithLocalJsonDict() {
        let parsedGitHubUsersDict = try! decoder.decode([String: GitHubUser].self, from: gitHubUsersDict)
        parsedGitHubUsersDict.forEach{print("key: \($0.key), value: \($0.value)")}
    }
    
    private func demoWithLocalJsonNBool() {
        let parsedGitHubUsersNBool = try! decoder.decode([GitHubUserOrBool].self, from: gitHubUsersWithBool)
        parsedGitHubUsersNBool.forEach{print($0)}
    }
    
    private func demoWithDataThatContainsAGitHubUser() {
        let parsedDataThatContainsAGitHubUser = try! decoder.decode(TypeContainsAGitHubUser.self, from: aBlockThatContainsAGitHubUser)
        print(parsedDataThatContainsAGitHubUser.gitHub)
        print(parsedDataThatContainsAGitHubUser.simpleString)
    }
}

