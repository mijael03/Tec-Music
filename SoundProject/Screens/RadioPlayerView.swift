//
//  RadioPlayerView.swift
//  SoundProject
//
//  Created by Mijael Cama on 1/07/22.
//

import SwiftUI
import SwURL
import CoreMedia
import FirebaseStorage
struct RadioPlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    var song: Song
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
//    func getLink (path:String)-> String? {
//        var songUrl:String?
//        let storage = Storage.storage()
//        let storageRef = storage.reference()
//        let path = storageRef.child("songs/\(path)")
//        path.downloadURL { url, error in
//          if let error = error {
//            print(error)
//          } else {
//              songUrl = url!.absoluteString
//          }
//        }
//        return songUrl
//    }
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
            //imagen de fondo
            AsyncImage(url: URL(string: song.artwork)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width)
                        .ignoresSafeArea()
                } else if phase.error != nil {
                    Text("There was an error loading the image.")
                } else {
                    ProgressView()
                }
            }
            //vista borrosa
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                //boton dismiss
                HStack {
                    Button {
                        audioManager.stopRadio()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                //titulo
                Text(song.name)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Text("\(song.albumName) - \(song.artist)")
                    .font(.body)
                    .foregroundColor(.white)
                
                Spacer()
                
                PlaybackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44){
                    audioManager.pauseRadio()
                }
                
                //Playback
                if let radioplayer = audioManager.player{
                VStack(spacing: 5) {
                    //playback recorrido timeline
                    Slider(value: $value, in: 0...radioplayer.duration) {
                        editing in
                        print("editing", editing)
                        isEditing = editing
                        if !editing {
                            radioplayer.currentTime = value
                        }
                    }
                        .accentColor(.white)
                    //playback time
                    HStack {
                        Text(DateComponentsFormatter.posicion.string(from: radioplayer.currentTime) ?? "0:00")
                        Spacer()
                        Text(DateComponentsFormatter.posicion.string(from: radioplayer.duration - radioplayer.currentTime) ?? "0:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
                //controles de la musica
                HStack{
                   
                    Spacer()
                    //boton de retroceso 10s
                    PlaybackControlButton(systemName: "gobackward.10"){
                        radioplayer.currentTime -= 10
                    }
                    Spacer()
                    //boton de play/pausa
                    PlaybackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44){
                        audioManager.playPause()
                    }
                    Spacer()
                    //boton de avanzar 10s
                    PlaybackControlButton(systemName: "goforward.10"){
                        radioplayer.currentTime += 10
                    }
                    Spacer()
                    //boton de stop
                    
                }
                }
            }
            .padding(20)
        }
        .onAppear {
           // AudioManager.shared.startPlayer(pista: tecmusicVM.tecmusic.pista, isPreview: isPreview)
            
            audioManager.loadRadio(radioURL: song.source )
            
        }
        .onReceive(timer) {
            _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
}

struct RadioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        RadioPlayerView(song: Song (id: "1", name: "Radioactive",artist: "Imagine Dragons", artwork: "https://m.media-amazon.com/images/I/61yp8mw1rDL._SL1400_.jpg", category: "Hip Hop", albumName: "Night Visions", source: "https://firebasestorage.googleapis.com/v0/b/tecmusic-3dd41.appspot.com/o/songs%2FAdventure.mp3?alt=media&token=369a2097-4954-4c4e-9514-abfad696865f"),isPreview: true ).environmentObject(AudioManager())
    }
}
