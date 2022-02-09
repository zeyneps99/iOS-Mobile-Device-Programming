//
//  PlayerInfoViewController.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 7.11.2021.
//

import UIKit

class PlayerInfoViewController: UIViewController {
    
    var selectedPlayer: Player?
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.title = selectedPlayer?.name
        
        if let player = selectedPlayer {
            self.playerInfo.text = player.power
            self.playerImage.image = UIImage(named: player.imageName)
        }
    }
}
