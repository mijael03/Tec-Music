//
//  MenuLista.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

struct SongsList: View {
    var songs: [Song] = []
    var action: () -> Void
    @Binding var songSelected: Song
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
                ForEach(songs.indices, id:\.self) { i in
                    Button {
                        songSelected = self.songs[i]
                        action()
                    }label: {
                        SongCard(song: self.songs[i])
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
            SongsList(songs: Song.all , action: {print("super")},songSelected: .constant(Song.all[0]))
        }
    }
}
