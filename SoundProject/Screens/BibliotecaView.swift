//
//  BibliotecaView.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.red, Color.black],
    startPoint: .top, endPoint: .bottom)

struct BibliotecaView: View {
    @EnvironmentObject var viewModel : AppViewModel
    @State private var quoteData: QuoteData?

    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationView{
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [
                        Color.black,
                        Color.gray
                    ]),startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all, edges: .all)
                    VStack{
                        Button{
                            viewModel.signOut()
                        } label: {
                            Text("Sign Out")
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .frame(width: 80, height: 50)
                        }
                        HStack {
                            
                            VStack(alignment: .trailing) {
                                Spacer()
                                Text(quoteData?.en ?? "")
                                .font(.title2)
                                Text("- \(quoteData?.author ?? "")")
                                .font(.title2)
                                .padding(.top)
                                Spacer()
                                Button(action: loadData) {
                                    Image(systemName: "arrow.clockwise")
                                }
                                    //.background(Color.black)
                                .font(.title)
                                .padding()
                            }.padding()
                            }
                    }
                    
                    }
                
            
            .navigationTitle("Biblioteca")
            .multilineTextAlignment(.trailing)
            //.padding()
            .onAppear(perform: loadData)
//            .navigationViewStyle(.stack)
        }
    }
    private func loadData() {
        guard let url = URL(string: "https://programming-quotes-api.herokuapp.com/quotes/random") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(QuoteData.self, from: data) {
                DispatchQueue.main.async {
                    self.quoteData = decodedData
                }
            }
        }.resume()
    }
}

struct QuoteData: Decodable {
    //var _id: String
    var en: String
    var author:String
    var id: String
}

struct BibliotecaView_Previews: PreviewProvider {
    static var previews: some View {
        BibliotecaView().environmentObject(AppViewModel())
    }
}
