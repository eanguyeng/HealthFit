//
//  BicepViewController.swift
//  HealthFit
//
//  Created by Ryan Eng on 12/7/21.
//

import youtube_ios_player_helper
import UIKit

class BicepViewController: UIViewController {
    
    @IBOutlet var playerView : YTPlayerView!
    @IBOutlet var playerView2 : YTPlayerView!
    @IBOutlet var playerView3 : YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bicep Workout"
        
        playerView.load(withVideoId: "v4jRpKD50Nk")
        playerView2.load(withVideoId: "grdqNljPY0Q")
        playerView3.load(withVideoId: "Y3RQY_yGOL0")

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
