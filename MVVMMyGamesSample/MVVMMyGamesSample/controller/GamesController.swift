//
//  GamesController.swift
//  MVVMMyGamesSample
//
//  Created by Diler Barbosa on 05/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation
import UIKit

class GamesController: UITableViewController {
    
    var gamesViewModel = [GameViewModel]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
    }
    
    fileprivate func fetchData() {
        gamesViewModel = Provider.shared.fetchGames().map({ return GameViewModel(game: $0) })
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let gameViewModel = gamesViewModel[indexPath.row]
        cell.textLabel?.text = gameViewModel.name
        
        return cell
        
    }
    
    
    
    
}
