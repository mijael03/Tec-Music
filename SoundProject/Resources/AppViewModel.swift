//
//  AppViewModel.swift
//  SoundProject
//
//  Created by Mijael Cama on 21/06/22.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    @Published var signedIn = false
    @Published var errors:String = ""
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) {
            [weak self] result, error in
            if let x = error {
                let err = x as NSError
                switch err.code {
                case AuthErrorCode.wrongPassword.rawValue:
                    self?.errors = "contraseña incorrecta"
                case AuthErrorCode.userNotFound.rawValue:
                    self?.errors = "usuario no encontrado"
                case AuthErrorCode.invalidEmail.rawValue:
                    self?.errors = "email no tiene formato requerido"
                default:
                    self?.errors = "error en logueo"
                }
            }
            
            guard result != nil , error == nil else {
                return
            }
            // success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) {
            [weak self] result, error in
            guard result != nil , error == nil else {
                return
            }
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            print("success in signup")
            
        }
    }
    func signOut () {
        self.signedIn = false
        try? auth.signOut()
    }
}
