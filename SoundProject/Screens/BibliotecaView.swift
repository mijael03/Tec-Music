//
//  BibliotecaView.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

struct BibliotecaView: View {
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
                Text("Biblioteca")
                    .foregroundColor(Color.white)
                    .navigationTitle("Biblioteca")
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct BibliotecaView_Previews: PreviewProvider {
    static var previews: some View {
        BibliotecaView()
    }
}
