//  SoundManager.swift
//  Match App

import Foundation
import AVFoundation

class SoundManager {
    
   static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        case flip
        case shuffle
        case match
        case noMatch
        
    }
    
    static func playSound(_ effect:SoundEffect) {
        
        var soundFileName = ""
        
        // Determine which sound effect we want to play
        // And set the appropriate filename
        switch effect {
        
        case .flip:
            soundFileName = "cardflip"
        case .shuffle:
            soundFileName = "shuffle"
        case .match:
            soundFileName = "dingcorrect"
        case .noMatch:
            soundFileName = "dingwrong"

        }
        
        // Get the path to the sound file inside the bundle
        
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard bundlePath != nil else{
            print("Couldn't find \(soundFileName) in the bundle")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            audioPlayer?.play()
            
        }
        catch {
            // Couldn't create audio player object, log the error
            print("Couldn't create the audio player object for the sound file \(soundFileName)")
        }
    }
}
