//
//  FungiListViewModel.swift
//  U_FungiFinder
//
//  Created by Don McKenzie on 11/29/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FungiListViewModel: ObservableObject {
    
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    func save(name: String, url: URL, completion: (Error?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        do {
            let _ = try db.collection("fungi").addDocument(from: Fungi(
                name: name, photoUrl: url.absoluteString, userId: currentUser.uid
            ))
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    func uploadPhoto(data: Data, completion: @escaping (URL?) -> Void) {
        let imageName = UUID().uuidString
        
        let storageRef = storage.reference()
        let photoRef = storageRef.child("images/\(imageName).png")
        
        photoRef.putData(data, metadata: nil) {metadata, error in
            photoRef.downloadURL { (url, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    completion(url)
                }
            }
        }
    }
    
}
