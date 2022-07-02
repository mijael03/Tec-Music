//
//  RegisterView.swift
//  SoundProject
//
//  Created by Mijael Cama on 21/06/22.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    var body: some View {
        ZStack{
            BackgroundView()
            FormRegister().padding()
        }.foregroundColor(.white)
    }
}
struct FormRegister: View{
    @State var email = ""
    @State var pass = ""
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack{
            
            Text("Email or username").frame(height: 80).font(.largeTitle).font(.system(size: 20, weight:.semibold)).padding(.all, 2)
            
            TextField("", text: $email).textInputAutocapitalization(.never).disableAutocorrection(true).textContentType(.emailAddress).padding().background(Color.init(red: 83/255, green: 82/255, blue: 83/255))
            
            Text("Password").frame(height: 80).font(.largeTitle).font(.system(size: 20, weight:.semibold)).padding(.all, 2)
            
            SecureField("", text: $pass).padding().background(Color.init(red: 83/255, green: 82/255, blue: 83/255))
            Button {
                guard !email.isEmpty, !pass.isEmpty else {
                    return
                }
                viewModel.signUp(email: email, password: pass)
                print("succees")
            } label : {
                Text("Register").fontWeight(.bold).foregroundColor(.white).frame(width: 150, height: 25).padding().background(Color.init(red: 30/255, green: 215/255, blue: 96/255)).cornerRadius(25)
            }.padding()
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
