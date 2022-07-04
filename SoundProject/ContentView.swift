//
//  ContentView.swift
//  SoundProject
//
//  Created by Mijael Cama on 17/06/22.
//
import SwiftUI

struct ContentView: View {
    @StateObject var audioManager = AudioManager()
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView{
            if viewModel.signedIn  {
                TabBar().environmentObject(audioManager)
            }else {
                LoginView()
            }
        }.onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppViewModel())
    }
}

struct Message: View {
    var body: some View {
        Text("Millions of songs Free on TecMusic").frame(height: 100).font(.largeTitle).font(.system(size: 20, weight:.semibold)).padding(.bottom, 15)
            
    }
}

struct Buttons: View {
    var body: some View {
        
        VStack(spacing: 18){
            NavigationLink(destination: RegisterView().navigationTitle("Sign Up")){
                Text("Sign up free").foregroundColor(.white).frame(width: 380, height: 50).background(Color.init(red: 30/255, green: 215/255, blue: 96/255)).cornerRadius(25).font(.system(size: 20, weight:.bold))
            }
            
            Text("Continue with Facebook").foregroundColor(.white).frame(width: 380, height: 50).padding(4)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 2)
            ).cornerRadius(25).font(.system(size: 20, weight:.bold))
            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)){
            Text("Log in").foregroundColor(.white).frame(width: 380, height: 50).cornerRadius(25).font(.system(size: 20, weight:.bold))
            }
        }
    }
}


}


