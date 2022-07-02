//
//  SearchView.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

struct SearchView: View {
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
                    Search()

                }
            }
            .navigationTitle("Buscador")
        }
    }
}

    
struct Search: View {
    @State var searchText = ""
    var body: some View {
        VStack{
            HStack {
               Image(systemName: "auriculares").foregroundColor(.white)
               TextField("Search ..", text: $searchText).foregroundColor(.white)
                
            }.font(.headline).padding().background(RoundedRectangle(cornerRadius: 25).fill(Color(red: 29/255, green: 28/255, blue: 28/255)).shadow(color: .black, radius: 10, x:0, y:0))
            List {
                ForEach(0...10, id: \.self){_ in
                    cellView()
                }
            }.listStyle(PlainListStyle())
            
            
        }
         
    }
}
struct Background: View {
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.1140098769, green: 0.1140098769, blue: 0.1140098769, alpha: 1)), Color(#colorLiteral(red: 0.1295539184, green: 0.1295539184, blue: 0.1295539184, alpha: 1)), Color(#colorLiteral(red: 0.1969114313, green: 0.1969114313, blue: 0.1969114313, alpha: 1)), Color(#colorLiteral(red: 0.2433816386, green: 0.2433816386, blue: 0.2433816386, alpha: 1)), Color(#colorLiteral(red: 0.2796510687, green: 0.2796510687, blue: 0.2796510687, alpha: 1)), Color(#colorLiteral(red: 0.3628764573, green: 0.3628764573, blue: 0.3628764573, alpha: 1))]
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottom, endPoint: .top)
        .edgesIgnoringSafeArea(.all)
    }
}
//struct SongLists: View {
//    var body: some View {
//
//    }
//}

struct cellView : View {
    var body : some View{
        HStack{ Image("auriculares").resizable().scaledToFit().frame(height: 70).cornerRadius(4)
        VStack(alignment: .leading, spacing: 5){
        Text("Cancion del momento").fontWeight(.semibold).foregroundColor(.white)
            Text("Cancion del momento subtitulo").font(.subheadline).lineLimit(2).foregroundColor(.white)
            
        }
        }.listRowBackground(Color.clear)
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
