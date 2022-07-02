//
//  SongList.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

struct SongList: View {
    var body: some View {
        List{
            ForEach(0...10, id: \.self){_ in
                CellView()
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
