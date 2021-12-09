//
//  TricepViewController.swift
//  HealthFit
//
//  Created by Ryan Eng on 12/8/21.
//

import youtube_ios_player_helper
import UIKit

class TricepViewController: UIViewController {
    
    @IBOutlet var playerView : YTPlayerView!
    @IBOutlet var playerView2 : YTPlayerView!
    @IBOutlet var playerView3 : YTPlayerView!
    @IBOutlet var playerView4 : YTPlayerView!
    override func viewDidLoad() {

        super.viewDidLoad()
        title = "Tricep Workout"
        playerView.load(withVideoId: "gE-TjRRok9M")
        playerView2.load(withVideoId: "xzfHFQ7kAuk")
        playerView3.load(withVideoId: "5WPtv3Nl_U0")
        playerView4.load(withVideoId: "hlib2jwbxBQ")
        
        // Do any additional setup after loading the view.
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
