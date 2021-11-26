//
//  LoginViewModel.swift
//  U_FungiFinder
//
//  Created by Don McKenzie on 11/26/21.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    
    func login(completion: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                completion()
            }
        }
    }
}

