//
//  LoginView.swift
//  SoundProject
//
//  Created by Mijael Cama on 21/06/22.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    @State var email = ""
    @State var pass = ""
    @EnvironmentObject var viewModel: AppViewModel
    @State private var presentAlert = false
    var body: some View{
        ZStack{
            BackgroundView()
            VStack{
                Image("TecMusic").resizable().padding().frame(width: 325, height: 300)
                Text("Email or username").frame(height: 60).font(.largeTitle).font(.system(size: 20, weight:.semibold))
                
                TextField("", text: $email).padding().background(Color.init(red: 83/255, green: 82/255, blue: 83/255))
                
                Text("Password").frame(height: 80).font(.largeTitle).font(.system(size: 20, weight:.semibold)).padding(.all, 2)
                
                SecureField("", text: $pass).padding().background(Color.init(red: 83/255, green: 82/255, blue: 83/255)).padding(.bottom)
                Button {
                    guard !email.isEmpty, !pass.isEmpty else {
                        return
                    }
                    viewModel.signIn(email: email, password: pass)
                    
                } label : {
                    Text("Log in").fontWeight(.bold).foregroundColor(.white).frame(width: 150, height: 25).padding().background(Color.init(red: 30/255, green: 215/255, blue: 96/255)).cornerRadius(25)
                
                
                }
                HStack {
                    Text("already have an account?")
                    Button {
                        
                    } label : {
                        NavigationLink(destination: RegisterView().navigationBarBackButtonHidden(true)){
                            Text("Sign Up")
                        }
                        
                    }
                }.padding([.bottom,.leading,.trailing])
                
                if viewModel.errors == "" {
                    
                }else{
                    Text(viewModel.errors).foregroundColor(Color.red)
                    
                }
            }.padding(.bottom)
        }.foregroundColor(.white).alert(isPresented: $presentAlert) {
            Alert(title: Text(viewModel.errors))}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AppViewModel())
    }
}
