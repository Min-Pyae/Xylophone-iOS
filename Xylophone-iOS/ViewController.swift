//
//  ViewController.swift
//  Xylophone-iOS
//
//  Created by Chris Min on 22/01/2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func keyButtonOnPressed(_ sender: UIButton) {
        if let keyTitle = sender.currentTitle {
            playSound(soundName: keyTitle)
        }
        
        // REDUCING BUTTON OPACITY TO HALF
        sender.alpha = 0.5
        
        // EXECUTING AFTER 0.1 SECONDS DELAY
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            // BRINGING BUTTON'S OPACITY BACK TO FULLY OPAQUE
            sender.alpha = 1.0
            
        }
    }
    
    func playSound(soundName: String) {
        
        if let url = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
        }
        
    }

}

