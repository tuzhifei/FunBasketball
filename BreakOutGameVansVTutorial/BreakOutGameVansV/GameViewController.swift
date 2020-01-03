
import UIKit
import SpriteKit
import GameplayKit

public let SCENE_WIDTH:CGFloat  = 2048
public let SCENE_HEIGHT:CGFloat = 1536

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
        
            if let scene = GameScene(fileNamed: "GameScene") {
                scene.size = CGSize(width: SCENE_WIDTH, height: SCENE_HEIGHT)
                scene.scaleMode = .aspectFill  
                view.presentScene(scene)
            }
          //view.showsPhysics = true 
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .landscape
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
