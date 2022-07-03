//
//  HomeView.swift
//  SoundProject
//
//  Created by Mijael Cama on 21/06/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var audioManager: AudioManager
    @State private var showPlayer = false
    @State private var isLoading = false
    @State var songSelected:Song = Song(id: "", name: "", artist: "", artwork: "", category: "", albumName: "", source: "")
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    func fetchinit() {
        isLoading = true
        audioManager.fetchSongs()
        isLoading = false
    }
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [
                    Color.black,
                    Color.gray
                ]),startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all, edges: .all)
                ScrollView{
                    if audioManager.songs.count == 0 {
                        VStack{
                            ProgressView().progressViewStyle(.circular).scaleEffect(3).tint(Color.init(red: 30/255, green: 215/255, blue: 96/255)).frame(width: 100, height: 100, alignment: .center).padding(20)
                            Text("Loading").font(.body)
                        }
                        
                        
                    }else {
                        SongsList(songs: audioManager.songs,action: { showPlayer = true
                            print(self.songSelected)
                        },songSelected: self.$songSelected)
                    }
                }
                .navigationTitle("Menu")
            }
            .navigationViewStyle(.stack)
            .fullScreenCover(isPresented: $showPlayer, content: {RadioPlayerView(song: songSelected)})
        }.onAppear{fetchinit()}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
