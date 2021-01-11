//
//  ItemModel.swift
//  ohMyGithubSearch
//
//  Created by Milandr on 08.01.2021.
//

import Foundation

struct ItemModel: Codable {
    var total_count: Int?
    var items: [RepositoryModel]
}
