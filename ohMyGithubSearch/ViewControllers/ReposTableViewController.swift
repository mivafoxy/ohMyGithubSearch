//
//  ReposTableViewController.swift
//  ohMyGithubSearch
//
//  Created by Milandr on 06.01.2021.
//

import UIKit

class ReposTableViewController: UITableViewController {
    fileprivate let reuseId = "repoCell"
    
    public var repositories: ItemModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(RepoTableViewCell.self, forCellReuseIdentifier: reuseId)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repositories.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! RepoTableViewCell
        
        // Configure the cell...
        let repo = repositories.items[indexPath.item]
        cell.setupCell(repository: repo)

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Repositories found: \(repositories.items.count)"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 7.0
    }
}
