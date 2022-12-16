//
//  AuthManager.swift
//  TwitterClone
//
//  Created by Rıdvan Yılmaz on 16.12.2022.
//

import Foundation
import Firebase
import FirebaseAuthCombineSwift
import Combine

class AuthManager {
    static let shared = AuthManager()
    
    func registerUser(with email: String, password: String) -> AnyPublisher<User, Error>  {
        
        
        return Auth.auth().createUser(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }

}
    
