//
//  SearchView.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var audioManager: AudioManager
    @State var searchText = ""
    @State var showPlayer = false
    @State var songSelected: Song?
    private var filteredSongs : [Song] {
        var filter = audioManager.songs.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
        return filter
    }
//    init() {
//        let navBarAppearance = UINavigationBar.appearance()
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [
                    Color.black,
                    Color.gray
                ]),startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all, edges: .all)
                VStack{
                    HStack {
                       Image(systemName: "auriculares").foregroundColor(.white)
                       TextField("Search ..", text: $searchText).foregroundColor(.white)
                        
                    }.font(.headline).padding().background(RoundedRectangle(cornerRadius: 25).fill(Color(red: 29/255, green: 28/255, blue: 28/255)).shadow(color: .black, radius: 10, x:0, y:0))
                    if searchText == ""{
                        Text("search a song ...")
                    }else {
                        List {
                            ForEach(filteredSongs.indices, id:\.self) { i in
                                Button {
//                                    songSelected = filteredSongs[i]
//                                    showPlayer = true
                                    print(filteredSongs[i])
                                }label: {
                                    cellView(song: filteredSongs[i])
                                }
                                
                            }
                        }.listStyle(PlainListStyle())
                    }
                    

                }
            }
            .navigationTitle("Buscador")
            .fullScreenCover(isPresented: $showPlayer, content: {RadioPlayerView(song: songSelected!)})
        }
    }
}
//struct SongLists: View {
//    var body: some View {
//
//    }
//}

struct cellView : View {
    var song:Song
    var body : some View{
            HStack{  AsyncImage(url: URL(string: song.artwork)) { image in image
                .resizable().scaledToFit().frame(height: 70).cornerRadius(4)}
            placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .cornerRadius(4)
            }
            VStack(alignment: .leading, spacing: 5){
                Text(song.name).fontWeight(.semibold).foregroundColor(.black)
                Text("\(song.albumName) - \(song.artist)").font(.subheadline).lineLimit(2).foregroundColor(.black)
                
            }
            }.background(Color.clear)
//        }.listRowBackground(Color.blue)
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
