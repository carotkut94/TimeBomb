//
//  MainMenuScene.swift
//  TimeBomb
//
//  Created by Sidhant Rajora on 22/04/16.
//  Copyright © 2016 Sidhant Rajora. All rights reserved.
//

import Foundation
import SpriteKit


class MainMenuScene: SKScene{
    
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "GameBackground.jpg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let gameHeader = SKLabelNode(fontNamed: "Chalkduster")
        gameHeader.text = "Play for fun don't take it seriously! "
        gameHeader.fontSize = 50
        gameHeader.position = CGPoint(x: self.size.width/2, y: self.size.height*0.90)
        gameHeader.fontColor = SKColor.blackColor()
        gameHeader.zPosition = 1
        self.addChild(gameHeader)
        
        let gameSubheader = SKLabelNode(fontNamed: "Chalkduster")
        gameSubheader.text = "But be as fast as The Flash 😉"
        gameSubheader.fontSize = 50
        gameSubheader.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        gameSubheader.fontColor = SKColor.blackColor()
        gameSubheader.zPosition = 1
        self.addChild(gameSubheader)
        
        let gameTitle = SKLabelNode(fontNamed: "Chalkduster")
        gameTitle.text = "Time Bomb"
        gameTitle.fontSize = 140
        gameTitle.position = CGPoint(x: self.size.width/2, y: self.size.height*0.70)
        gameTitle.fontColor = SKColor.redColor()
        gameTitle.zPosition = 1
        self.addChild(gameTitle)
        
        let startGame = SKLabelNode(fontNamed: "Chalkduster")
        startGame.text = "Play !"
        startGame.fontSize = 120
        startGame.position = CGPoint(x: self.size.width/2, y: self.size.height*0.50)
        startGame.fontColor = SKColor.redColor()
        startGame.zPosition = 1
        startGame.name = "starGameButton"
        self.addChild(startGame)
        
        let subTitle = SKLabelNode(fontNamed: "Chalkduster")
        subTitle.text = "Created with ❤️ in India"
        subTitle.fontSize = 60
        subTitle.position = CGPoint(x: self.size.width/2, y: self.size.height*0.1)
        subTitle.zPosition = 1
        subTitle.fontColor = SKColor.blackColor()
        self.addChild(subTitle)
        
        let subAuthor = SKLabelNode(fontNamed: "Chalkduster")
        subAuthor.text = "Created by Sidhant Rajora with ❤️"
        subAuthor.fontSize = 60
        subAuthor.position = CGPoint(x: self.size.width/2, y: self.size.height*0.05)
        subAuthor.zPosition = 1
        subAuthor.fontColor = SKColor.blackColor()
        self.addChild(subAuthor)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch : AnyObject in touches{
            
            let positionofTouch =  touch.locationInNode(self)
            let tappedNode = nodeAtPoint(positionofTouch)
            let nameofTappedNode = tappedNode.name
            
            if nameofTappedNode == "starGameButton"
            {
             
                self.runAction(clickSound)
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let scenetransition = SKTransition.flipVerticalWithDuration(0.5)
                self.view!.presentScene(sceneToMoveTo, transition: scenetransition)
                
            }
        }
    }
    
}