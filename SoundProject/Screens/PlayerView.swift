//
//  PlayerView.swift
//  SoundProject
//
//  Created by Mijael Cama on 26/06/22.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
//    var song: Song
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            //imagen de fondo
            Image(uiImage: audioManager.getData(pista: "Adventure")!)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            //vista borrosa
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                //boton dismiss
                HStack {
                    Button {
                        audioManager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                //titulo
                Text("Coldplay")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                
                Spacer()
                
                //Playback
                if let player = audioManager.player {
                VStack(spacing: 5) {
                    //playback recorrido timeline
                    Slider(value: $value, in: 0...player.duration) {
                        editing in
                        print("editing", editing)
                        isEditing = editing
                        if !editing {
                            player.currentTime = value
                        }
                    }
                        .accentColor(.white)
                    //playback time
                    HStack {
                        Text(DateComponentsFormatter.posicion.string(from: player.currentTime) ?? "0:00")
                        Spacer()
                        Text(DateComponentsFormatter.posicion.string(from: player.duration - player.currentTime) ?? "0:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
                //controles de la musica
                HStack{
                    //boton de repetir
                    let color: Color = audioManager.isLooping ? .teal : .white
                    PlaybackControlButton(systemName: "repeat", color: color){
                        audioManager.toggleLoop()
                    }
                    Spacer()
                    //boton de retroceso 10s
                    PlaybackControlButton(systemName: "gobackward.10"){
                        player.currentTime -= 10
                    }
                    Spacer()
                    //boton de play/pausa
                    PlaybackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44){
                        audioManager.playPause()
                    }
                    Spacer()
                    //boton de avanzar 10s
                    PlaybackControlButton(systemName: "goforward.10"){
                        player.currentTime += 10
                    }
                    Spacer()
                    //boton de stop
                    PlaybackControlButton(systemName: "stop.fill"){
                        audioManager.stop()
                        dismiss()
                    }
                    
                }
                }
            }
            .padding(20)
        }
        .onAppear {
           // AudioManager.shared.startPlayer(pista: tecmusicVM.tecmusic.pista, isPreview: isPreview)
            audioManager.startPlayer(pista:"Adventure", isPreview: isPreview)
            
        }
        .onReceive(timer) {
            _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView( isPreview: true)
            .environmentObject(AudioManager())
    }
}
