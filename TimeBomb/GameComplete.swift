//
//  GameComplete.swift
//  TimeBomb
//
//  Created by Sidhant Rajora on 22/04/16.
//  Copyright © 2016 Sidhant Rajora. All rights reserved.
//

import Foundation
import SpriteKit

class GameComplete: SKScene{
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "GameBackground.jpg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let gameHeader = SKLabelNode(fontNamed: "Chalkduster")
        gameHeader.text = "You saved the city, from the imense threat!"
        gameHeader.fontSize = 40
        gameHeader.position = CGPoint(x: self.size.width/2, y: self.size.height*0.80)
        gameHeader.fontColor = SKColor.whiteColor()
        gameHeader.zPosition = 1
        self.addChild(gameHeader)
        
        
        let gameTitle = SKLabelNode(fontNamed: "Chalkduster")
        gameTitle.text = "Time Bomb Over"
        gameTitle.fontSize = 120
        gameTitle.position = CGPoint(x: self.size.width/2, y: self.size.height*0.70)
        gameTitle.fontColor = SKColor.redColor()
        gameTitle.zPosition = 1
        self.addChild(gameTitle)
        
        let startGame = SKLabelNode(fontNamed: "Chalkduster")
        startGame.text = "Exit !"
        startGame.fontSize = 100
        startGame.position = CGPoint(x: self.size.width/2, y: self.size.height*0.50)
        startGame.fontColor = SKColor.redColor()
        startGame.zPosition = 1
        startGame.name = "Exit"
        self.addChild(startGame)
        
        let subTitle = SKLabelNode(fontNamed: "Chalkduster")
        subTitle.text = "Created with ❤️ in India"
        subTitle.fontSize = 50
        subTitle.position = CGPoint(x: self.size.width/2, y: self.size.height*0.01)
        subTitle.zPosition = 1
        self.addChild(subTitle)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch : AnyObject in touches{
            
            let positionofTouch =  touch.locationInNode(self)
            let tappedNode = nodeAtPoint(positionofTouch)
            let nameofTappedNode = tappedNode.name
            
            if nameofTappedNode   == "Exit"
            {
                self.removeAllActions()
                self.runAction(clickSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let scenetransition = SKTransition.fadeWithDuration(0.06)
                self.view!.presentScene(sceneToMoveTo, transition: scenetransition)
                
            }
        }
    }
    
}
