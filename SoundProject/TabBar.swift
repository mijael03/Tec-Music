//
//  TabBar.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var audioManager: AudioManager
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
    }
    var body: some View {
        TabView {
            HomeView().environmentObject(AudioManager())
                .tabItem {
                Label("Home", systemImage: "house")
                    .foregroundColor(Color.black)
                }
            SearchView()
                .tabItem {
                Label("Buscador", systemImage: "magnifyingglass")
                    .foregroundColor(Color.black)
                }
            BibliotecaView().environmentObject(AudioManager())
                .tabItem {
                    Label("Biblioteca" , systemImage: "square.fill.text.grid.1x2")
                        .foregroundColor(Color.black)
                }
        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
