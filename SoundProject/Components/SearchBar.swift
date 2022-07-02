//
//  SearchBar.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText = ""
        var body: some View {
             HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.white)
                TextField("Search ..", text: $searchText).foregroundColor(.white)
             }.font(.headline).padding().background(RoundedRectangle(cornerRadius: 25).fill(Color(red: 29/255, green: 28/255, blue: 28/255)).shadow(color: .black, radius: 10, x:0, y:0))
        }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
