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
    init() {
    let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
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
                    Button{
                        viewModel.signOut()
                    } label: {
                        Text("signout")
                    }
                    SongsList(songs: audioManager.songs,action: { showPlayer = true})
                }
                .navigationTitle("Menu")
            }
            .navigationViewStyle(.stack)
            .fullScreenCover(isPresented: $showPlayer, content: {PlayerView()})
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
