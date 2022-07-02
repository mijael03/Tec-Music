//
//  CellView.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

struct CellView: View {
    var body: some View {
        HStack{ Image("auriculares").resizable().scaledToFit().frame(height: 70).cornerRadius(4)
            VStack(alignment: .leading, spacing: 5){
            Text("Cancion del momento").fontWeight(.semibold).foregroundColor(.white)
                Text("Cancion del momento subtitulo").font(.subheadline).lineLimit(2).foregroundColor(.white)
                
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
