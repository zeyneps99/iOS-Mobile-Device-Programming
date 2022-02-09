//
//  TableViewController.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 5.11.2021.
//

import UIKit

class TableViewController: UIViewController {
    
    let playerDataSource = PlayerDataSource()
    
    @IBOutlet weak var playerTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playerTable.rowHeight = 120
        self.title = "Top 10 List"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! TableViewCell
        
        if let indexPath = playerTable.indexPath(for: cell), let player = playerDataSource.getPlayerWithIndex(index: indexPath.row) {
            let playerInfoViewController = segue.destination as! PlayerInfoViewController
            playerInfoViewController.selectedPlayer = player
        }
    }
}


extension TableViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerDataSource.getNumberOfPlayers()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopTenCell", for: indexPath) as! TableViewCell
        
        if let player =
            playerDataSource.getPlayerWithIndex(index: indexPath.row) {
            cell.playerImage.image = UIImage(named: player.imageName)
            cell.playerName.text = player.name
        }
        return cell
    }  
}
