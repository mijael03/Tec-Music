//
//  BackgroundView.swift
//  SoundProject
//
//  Created by Mijael Cama on 21/06/22.
//

import SwiftUI

struct BackgroundView: View {
    let colors: [Color] = [Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.09846583549, green: 0.09846583549, blue: 0.09846583549, alpha: 1)), Color(#colorLiteral(red: 0.1140098769, green: 0.1140098769, blue: 0.1140098769, alpha: 1)), Color(#colorLiteral(red: 0.1295539184, green: 0.1295539184, blue: 0.1295539184, alpha: 1)), Color(#colorLiteral(red: 0.1969114313, green: 0.1969114313, blue: 0.1969114313, alpha: 1)), Color(#colorLiteral(red: 0.2433816386, green: 0.2433816386, blue: 0.2433816386, alpha: 1)), Color(#colorLiteral(red: 0.2796510687, green: 0.2796510687, blue: 0.2796510687, alpha: 1)), Color(#colorLiteral(red: 0.3628764573, green: 0.3628764573, blue: 0.3628764573, alpha: 1))]
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottom, endPoint: .top)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
