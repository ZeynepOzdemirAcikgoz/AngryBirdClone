//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Zeynep Özdemir Açıkgöz on 9.08.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //var bird2 = SKSpriteNode()
    
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var box6 = SKSpriteNode()
    
    var gameStarted = false
    
    var originalPosition : CGPoint?
    var originalPositionBox1 :CGPoint?
    var originalPositionBox2 :CGPoint?

    var originalPositionBox3 :CGPoint?

    var originalPositionBox4 :CGPoint?

    var originalPositionBox5 :CGPoint?
    var originalPositionBox6 :CGPoint?
    

    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType: UInt32 {
        case Bird = 1
        case Box = 2
    }

    override func didMove(to view: SKView) {
        /*
        let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: -self.frame.width / 4, y: -self.frame.height / 4)
        bird2.size = CGSize(width: self.frame.width / 16, height: self.frame.height / 10)
        bird2.zPosition = 1
        self.addChild(bird2)
 */
        
        //Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        // Bird
        
        bird = childNode(withName: "bird") as! SKSpriteNode
        
        let birdTexture = SKTexture(imageNamed: "bird")
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.15
        originalPosition = bird.position
        
        bird.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        
        
        //Box
        
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 7, height: boxTexture.size().height / 7)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = false
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.4
        originalPositionBox1 = box1.position
        
        box1.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = false
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.8
        originalPositionBox2 = box2.position

        box2.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue

        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = false
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.4
        originalPositionBox3 = box3.position

        box3.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue

        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = false
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.4
        originalPositionBox4 = box4.position

        
        box4.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue

        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = false
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.4
        originalPositionBox5 = box5.position

        box5.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        box6 = childNode(withName: "box6") as! SKSpriteNode
        box6.physicsBody = SKPhysicsBody(rectangleOf: size)
        box6.physicsBody?.isDynamic = true
        box6.physicsBody?.affectedByGravity = false
        box6.physicsBody?.allowsRotation = true
        box6.physicsBody?.mass = 0.4
        originalPositionBox6 = box6.position

        box6.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
     
        //Label
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
        
        
       
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.collisionBitMask == ColliderType.Bird.rawValue || contact.bodyB.collisionBitMask == ColliderType.Bird.rawValue {
            
            score += 1
            scoreLabel.text = String(score)
            /*box1.physicsBody?.affectedByGravity = true
            box2.physicsBody?.affectedByGravity = true
            box3.physicsBody?.affectedByGravity = true
            box4.physicsBody?.affectedByGravity = true
            box5.physicsBody?.affectedByGravity = true
            box6.physicsBody?.affectedByGravity = true*/
            
            
             box1.position = originalPositionBox1!
                            box2.position = originalPositionBox2!
                            box3.position = originalPositionBox3!
                            box4.position = originalPositionBox4!
                            box5.position = originalPositionBox5!
                            box6.position = originalPositionBox6!
             
           
            
            
            
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        bird.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 100))
        bird.physicsBody?.affectedByGravity = true
 */
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                        
                    }
                    
                }
                
            }
            
            
            
        }
        
   
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      if gameStarted == false {
          
          if let touch = touches.first {
              
              let touchLocation = touch.location(in: self)
              let touchNodes = nodes(at: touchLocation)
              
              if touchNodes.isEmpty == false {
                  
                  for node in touchNodes {
                      
                      if let sprite = node as? SKSpriteNode {
                          if sprite == bird {
                              bird.position = touchLocation
                          }
                      }
                      
                  }
                  
              }
              
          }
          
          
          
      }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
        
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: self)
            let touchNodes = nodes(at: touchLocation)
            
            if touchNodes.isEmpty == false {
                
                for node in touchNodes {
                    
                    if let sprite = node as? SKSpriteNode {
                        if sprite == bird {
                           
                            let dx = -(touchLocation.x - originalPosition!.x)
                            let dy = -(touchLocation.y - originalPosition!.y)
                            
                            let impulse = CGVector(dx: dx, dy: dy)
                            
                            bird.physicsBody?.applyImpulse(impulse)
                            bird.physicsBody?.affectedByGravity = true
                            
                            gameStarted = true
                            
                        }
                    }
                    
                }
                
            }
            
        }
        
        
    }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        if let birdPhysicsBody = bird.physicsBody {
            
            if birdPhysicsBody.velocity.dx <= 0.5 && birdPhysicsBody.velocity.dy <= 0.5 && birdPhysicsBody.angularVelocity <= 0.5 && gameStarted == true {
                
                
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zPosition = 1
                bird.position = originalPosition!
                
               



                
                //score = 0
                //scoreLabel.text = String(score)
                
                gameStarted = false
                
                
            }
            
        }
        
    }
}
