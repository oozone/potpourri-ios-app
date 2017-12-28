//
//  RadioPlayerViewController.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 23/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class RadioPlayerViewController: UIViewController {

    @IBOutlet weak var radioImage: UIImageView!
    var isRadioPlaying : Bool = true
    var radioPlayer : AVPlayer
    @IBOutlet weak var toggleButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        self.isRadioPlaying = true
        self.radioPlayer = AVPlayer()
        super.init(coder: aDecoder)
    }
    
    var radioStation: RadioStation? {
        didSet {
            reloadView()
            playRadioStation()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Plays radiostation
    func playRadioStation() {
        
        // Init our radioplayer
        let stationUrl = URL(string: (self.radioStation?.url)!)
        radioPlayer = AVPlayer(url: stationUrl!)
        
        // Place radio player on view
        let radioPlayerLayer = AVPlayerLayer(player: radioPlayer)
        radioPlayerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(radioPlayerLayer)
        
        // Let's play!
        self.isRadioPlaying = true
        radioPlayer.play()
    }
    
    // Reload the view
    func reloadView() {
        radioImage.downloadedFrom(link: (self.radioStation?.image)!)
    }
    
    @IBAction func toggleRadioPlayer() {
        isRadioPlaying ? radioPlayer.pause() : radioPlayer.play()
        
        isRadioPlaying ? toggleButton.setTitle("Play", for: .normal) : toggleButton.setTitle("Pause", for: .normal)
        
        isRadioPlaying = !isRadioPlaying
    }

}
