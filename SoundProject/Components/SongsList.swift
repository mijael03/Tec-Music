//
//  MenuLista.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

struct SongsList: View {
    var songs: [Song]
    var action: () -> Void
    var body: some View {
        VStack{
            HStack{
                Text("\(songs.count) \(songs.count > 1 ? "Canciones" : "Cancion")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .opacity(0.7)
                
                Spacer()
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15){
                ForEach(songs) { song in
                    Button {
                        action()
                    }label: {
                        SongCard(song: song)
                    }
                    
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct SongsList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            SongsList(songs: Song.all, action: {print("super")})
        }
    }
}
