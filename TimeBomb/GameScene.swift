//
//  GameScene.swift
//  TimeBomb
//
//  Created by Sidhant Rajora on 22/04/16.
//  Copyright (c) 2016 Sidhant Rajora. All rights reserved.
//

import SpriteKit
var scoreNumber = 0

class GameScene: SKScene {
    
    
    let scoreLabel = SKLabelNode(fontNamed: "Pusab")
    let playCorrectSoundEffect = SKAction.playSoundFileNamed("Correct.wav", waitForCompletion: false)
    let playGameOver = SKAction.playSoundFileNamed("GameOverSound.wav", waitForCompletion: false)
    let gameArea: CGRect
    
    
    
    
    override init(size : CGSize) {
        
        let maxApspectRatio: CGFloat = 16.0/9.0
        let playAblewidth = size.height / maxApspectRatio
        let gameAreamargin = (size.width - playAblewidth)/2
        gameArea = CGRect(x: gameAreamargin, y: 0, width: playAblewidth, height: size.height)
        
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat{
        return random() * (max - min) + min
    }
    
    
    override func didMoveToView(view: SKView) {
        
        
        scoreNumber = 0;
        let background = SKSpriteNode(imageNamed: "GameBackground.jpg")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let disc = SKSpriteNode(imageNamed: "Bomb1")
        disc.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        disc.zPosition = 2
        disc.name = "discObject"
        self.addChild(disc)
        
        scoreLabel.fontSize = 250
        scoreLabel.text = "0"
        scoreLabel.fontColor = SKColor.redColor()
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        self.addChild(scoreLabel)
        
    }
    
    
    func spwanNewDisc(){
        
        var randomImagenumner = arc4random()%5;
        randomImagenumner += 1;
        
        let disc = SKSpriteNode(imageNamed: "Bomb\(randomImagenumner)")
        disc.zPosition = 2;
        disc.name = "discObject"
        playCorrectSoundEffect
        let randomX = random(min: CGRectGetMinX(gameArea) + disc.size.width/2,
            max: CGRectGetMaxX(gameArea) - disc.size.width/2)
        let randomY = random(min: CGRectGetMinY(gameArea) + disc.size.height/2,
            max: CGRectGetMaxY(gameArea) - disc.size.height/2)
        
        disc.position = CGPoint(x: randomX, y: randomY)
        self.addChild(disc)
        
        disc.runAction(SKAction.sequence([
            
            SKAction.scaleTo(0, duration: 3),
            playGameOver,
            SKAction.runBlock(runGameOver)
            ]))
    }
    
    
    func runGameOver(){
        
        //here we will code game over
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let scenetransition = SKTransition.flipVerticalWithDuration(0.5)
        self.view!.presentScene(sceneToMoveTo, transition: scenetransition)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.removeAllActions()
        for touch : AnyObject in touches{
            
            let positionofTouch =  touch.locationInNode(self)
            let tappedNode = nodeAtPoint(positionofTouch)
            let nameofTappedNode = tappedNode.name
            
            if nameofTappedNode == "discObject"
            {
                
                tappedNode.name = ""
                tappedNode.runAction(SKAction.sequence([
                    SKAction.fadeOutWithDuration(0.1),
                    SKAction.removeFromParent()
                    ]))
                self.runAction(playCorrectSoundEffect)
                spwanNewDisc()
                scoreNumber += 1
                scoreLabel.text = "\(scoreNumber)"
                
                if scoreNumber  == 10 || scoreNumber == 25 || scoreNumber == 75 || scoreNumber == 100 || scoreNumber == 125 || scoreNumber == 175 || scoreNumber == 200 || scoreNumber == 250 || scoreNumber == 300 || scoreNumber == 375 || scoreNumber == 425 || scoreNumber == 480
                {
                    spwanNewDisc()
                }
                if scoreNumber == 500
                {
                    
                    tappedNode.name = ""
                    tappedNode.removeAllActions()
                    self.removeAllChildren()
                    tappedNode.removeAllActions()
                    let alertView = UIAlertController(title: "Game Over", message: "Thanks for saving the city", preferredStyle: .Alert)
                    let cancelAction = UIAlertAction(title: "Ok", style: .Cancel) { (action) in
                        let sceneToMoveTo = GameComplete(size: self.size)
                        sceneToMoveTo.scaleMode = self.scaleMode
                        let scenetransition = SKTransition.fadeWithDuration(0.3)
                        self.view!.presentScene(sceneToMoveTo, transition: scenetransition)
                    }
                    alertView.addAction(cancelAction)
                    self.view?.window?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)
                    
                }
            }
            else
            {
                scoreNumber -= 1
                scoreLabel.text = "\(scoreNumber)"
                let scoreNegative = SKLabelNode(fontNamed: "Pusab");
                scoreNegative.text = "-1"
                scoreNegative.fontColor = SKColor.redColor()
                scoreNegative.position = CGPoint(x: self.size.width * 0.2, y: self.size.height/2)
                scoreNegative.zPosition = 2
                scoreNegative.fontSize = 100
                addChild(scoreNegative)
                scoreNegative.runAction(SKAction.sequence([
                    SKAction.fadeOutWithDuration(0.9),
                    SKAction.removeFromParent()
                    ]))
                
            }
        }
    }
}
