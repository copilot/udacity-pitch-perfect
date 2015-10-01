//
//  PlaybackViewController.swift
//  Pitch Perfect
//
//  Created by Aaron Wagner on 9/30/15.
//  Copyright © 2015 Aaron Wagner. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var player:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            do {
                try player = AVAudioPlayer(contentsOfURL: RecordSoundsViewController.recordedAudioPath!)
            } catch {
                print("error in audio initialization")
            }
            player.enableRate = true
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playWithSpeed(rate: Float) {
        player.stop()
        player.currentTime = 0.0
        player.rate = rate
        player.play()
    }

    @IBAction func stopPlayback(sender: AnyObject) {
        player.stop()
    }
    
    @IBAction func speedUpSound(sender: AnyObject) {
        self.playWithSpeed(2.0)
    }
    
    @IBAction func slowDownSound(sender: AnyObject) {
        self.playWithSpeed(0.5)
    }

}
