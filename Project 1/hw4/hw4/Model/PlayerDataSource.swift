//
//  PlayerDataSource.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 5.11.2021.
//

import Foundation

struct PlayerDataSource{
    
    private var playerArray: [Player] = []
    
    init(){
        playerArray.append(Player(name: "Captain America", imageName: "camerica", power: "Superhuman Agility\n\nSuperhuman Stamina\n\nSuperhuman Durability\n\nSuperhuman Reflexes\n\nSuperhuman Strength"))
        playerArray.append(Player(name: "Spiderman", imageName: "sman", power: "Superhuman Strength\n\nSuperhuman Speed\n\nSuperhuman Reflexes\n\nSuperhuman Durability\n\nHealing Factor\n\nSpider-Sense\n\nHeightened Senses\n\nWallcrawling"))
        playerArray.append(Player(name: "The Incredible Hulk", imageName: "hulk", power: "Healing Factor\n\nSuperhuman Durability\n\nSuperhuman Strength\n\nSize and Shape Alteration\n\nGenius Intelligence"))
        playerArray.append(Player(name: "Black Widow", imageName: "bwidow", power: "Slowed Aging\n\nSuperhuman Durability"))
        playerArray.append(Player(name: "Captain Marvel", imageName: "cmarvel", power: "Flight\n\nEnergy Blasts\n\nSuperhuman Durability\n\nSuperhuman Strength"))
        playerArray.append(Player(name: "Winter Soldier", imageName: "wsoldier", power: "Unarmed Combat\n\nSuperhuman Strength\n\nMarksman"))
        playerArray.append(Player(name: "Iron Man", imageName: "ironman", power: "Heightened Senses\n\nSuperhuman Strength\n\nRegeneration\n\nGenius Intelligence"))
        playerArray.append(Player(name: "Hawkeye", imageName: "hawkeye", power: "Hand-to-Hand Combat\n\nSuperior Marksmanship"))
        playerArray.append(Player(name: "Vision", imageName: "vision", power: "Density Shifting\n\nIntangibility\n\nPhotokinesis\n\nRemote Interfacing (with other computer systems)\n\nSynthezoid\n\nRegeneration\n\nHeightened Senses\n\nFlight\n\nSuperhuman Strength\n\nSuperhuman Durability\n\nSuperhuman Speed\n\nSuperhuman Reflexes\n\nSuperhuman Agility"))
        playerArray.append(Player(name: "AntMan", imageName: "antman", power: "Size and Shape Alteration\n\nSuperhuman Intelligence\n\nSuperhuman Strength\n\nSuperhuman Durability\n\nEnergy Blasts"))
    }
    
    func getNumberOfPlayers()-> Int {
        return playerArray.count
    }
    
    func getPlayerWithIndex(index: Int)-> Player? {
        return playerArray[index]
    }
}
