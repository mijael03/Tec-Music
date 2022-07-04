//
//  AudioManager.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import Foundation
import AVKit
import Firebase
final class AudioManager: ObservableObject {
    //static let shared = AudioManager()
    var player: AVAudioPlayer?
    var radioplayer: AVPlayer?
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    @Published private(set) var isLooping: Bool = false
    @Published var songs:[Song] = []
    init (){
        fetchSongs()
    }
    func startPlayer(pista: String, isPreview: Bool = false) {
        guard let url = Bundle.main.url(forResource: pista, withExtension: "mp3") else {
            print("Recurso no encontrado: \(pista)")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            if isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
                isPlaying = true
            }
        } catch {
            print("Fallo al iniciar play", error)
        }
    }
    
    func playPause() {
        guard let player = player else {
            print("Audio play no funciona")
            return
        }

        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }

    func stop() {
        guard let player = player else { return }

        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
    }

    func toggleLoop() {
        guard let player = player else {
            return
        }
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0
        print("isLooping", isLooping)
    }
    func loadRadio(radioURL: String) {

        guard let url = URL.init(string: radioURL) else { return }
        let playerItem = AVPlayerItem.init(url: url)
       
        let duration = Double(playerItem.asset.duration.value) / Double(playerItem.asset.duration.timescale)
        print(duration)
        
        radioplayer = AVPlayer.init(playerItem: playerItem)
        radioplayer!.play()
        isPlaying = true
    }
    func pauseRadio(){
        if radioplayer?.timeControlStatus == .playing {
            radioplayer!.pause()
            isPlaying = false
        }else {
            radioplayer!.play()
            isPlaying = true
        }
        
        
    }
    func stopRadio(){
        if let play = radioplayer {
                    print("stopped")
                    play.pause()
                    isPlaying = false
                    radioplayer = nil
                    print("player deallocated")
                } else {
                    print("player was already deallocated")
                }
    }
    func fetchSongs() {
        let db = Firestore.firestore()
        db.collection("songs").getDocuments(){ (snapshot, error) in
            for document in snapshot!.documents {
                let song = Song(
                    id : document.documentID,
                    name : document.data()["title"] as! String,
                    artist: document.data()["artist"] as! String,
                    artwork : document.data()["artwork"] as! String,
                    category : document.data()["category"] as! String,
                    albumName : document.data()["album"] as! String,
                    source: document.data()["file"] as! String
                )
                print(song.name)
                self.songs.append(song)
            }
            
        }
    }
//        Database.database().reference().child("songs").observe(DataEventType.childAdded, with: {(snapshot) in
//            let song = Song(
//                id : snapshot.key,
//                name : (snapshot.value as! NSDictionary)["title"] as! String,
//                artwork : (snapshot.value as! NSDictionary)["artwork"] as! String,
//                category : (snapshot.value as! NSDictionary)["category"] as! String,
//                albumName : ((snapshot.value as! NSDictionary)["album"] as! String)
//            )
//            print(song.name)
//            self.songs.append(song)
//
//        })
    }

