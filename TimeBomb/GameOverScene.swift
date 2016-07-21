//
//  GameOverScene.swift
//  TimeBomb
//
//  Created by Sidhant Rajora on 22/04/16.
//  Copyright © 2016 Sidhant Rajora. All rights reserved.
//

import Foundation
import SpriteKit

let clickSound = SKAction.playSoundFileNamed("Click.wav", waitForCompletion: false)
let clapps = SKAction.playSoundFileNamed("clap1", waitForCompletion: false)
class GameOverScene: SKScene
{
    
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "GameBackground.jpg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let gameOverlabel = SKLabelNode(fontNamed: "Chalkduster")
        gameOverlabel.text = "Game Over !"
        gameOverlabel.fontSize = 120
        gameOverlabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.70)
        gameOverlabel.fontColor = SKColor.redColor()
        gameOverlabel.zPosition = 1
        self.addChild(gameOverlabel)
        
        let finalScore = SKLabelNode(fontNamed: "Chalkduster")
        finalScore.text = "Score: \(scoreNumber)"
        finalScore.fontSize = 70
        finalScore.fontColor = SKColor.blackColor()
        finalScore.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        finalScore.zPosition = 1
        self.addChild(finalScore)
        
        let defaults = NSUserDefaults()
        var highscore = defaults.integerForKey("highScore")
        
        if scoreNumber > highscore{
            self.runAction(clapps)
            highscore = scoreNumber
            defaults.setInteger(highscore, forKey: "highScore")
            let newHighScore = SKLabelNode(fontNamed: "Chalkduster")
            newHighScore.text = "New High Score !"
            newHighScore.fontSize = 80
            newHighScore.fontColor = SKColor.redColor()
            newHighScore.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
            newHighScore.zPosition = 1
            self.addChild(newHighScore)
            
        }
        
        
        let highScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        highScoreLabel.text = "High Score :\(highscore)"
        highScoreLabel.fontSize = 90
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        highScoreLabel.fontColor = SKColor.blackColor()
        highScoreLabel.zPosition = 1
        self.addChild(highScoreLabel)
        
        let restart = SKLabelNode(fontNamed: "Chalkduster")
        restart.text = "Retry !"
        restart.fontSize = 75
        restart.position = CGPoint(x: self.size.width/2, y: self.size.height*0.20)
        restart.fontColor = SKColor.blackColor()
        restart.zPosition = 1
        restart.name = "restartButton"
        self.addChild(restart)
        
        
        let exit = SKLabelNode(fontNamed: "Chalkduster")
        exit.text = "Exit"
        exit.fontSize = 75
        exit.position = CGPoint(x: self.size.width/2, y: self.size.height*0.10)
        exit.fontColor = SKColor.blackColor()   
        exit.zPosition = 1
        exit.name = "exitButton"
        self.addChild(exit)

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch : AnyObject in touches{
            
            let positionofTouch =  touch.locationInNode(self)
            let tappedNode = nodeAtPoint(positionofTouch)
            let nameofTappedNode = tappedNode.name
            
            if nameofTappedNode ==  "restartButton"{
                self.removeAllActions()
                self.runAction(clickSound)
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let scenetransition = SKTransition.fadeWithDuration(0.3)
                self.view!.presentScene(sceneToMoveTo, transition: scenetransition)
            }
            
            if nameofTappedNode   == "exitButton"
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
