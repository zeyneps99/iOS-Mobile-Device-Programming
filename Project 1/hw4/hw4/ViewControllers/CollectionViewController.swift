//
//  CollectionViewController.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 7.11.2021.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var playerCollection: UICollectionView!
    let playerDataSource = PlayerDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Top 10 List"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! CollectionViewCell
    
        if let indexPath = playerCollection.indexPath(for: cell),
           let player = playerDataSource.getPlayerWithIndex(index: indexPath.row) {
            
            let playerInfoView = segue.destination as! PlayerInfoViewController
            playerInfoView.selectedPlayer = player
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerDataSource.getNumberOfPlayers()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = playerCollection.dequeueReusableCell(withReuseIdentifier: "TopTenCell1",  for: indexPath) as! CollectionViewCell
        
        if let player = playerDataSource.getPlayerWithIndex(index: indexPath.row) {
            cell.playerImage.image = UIImage(named: player.imageName)
            cell.playerLabel.text = player.name
        }
        return cell
    }
}
