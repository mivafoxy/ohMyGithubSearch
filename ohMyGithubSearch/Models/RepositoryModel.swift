//
//  RepositoryModel.swift
//  ohMyGithubSearch
//
//  Created by Milandr on 08.01.2021.
//

import Foundation

struct RepositoryModel: Codable {
    var name: String?
    var description: String?
    var owner: OwnerModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case owner
    }
}
