//
//  FungiListViewModel.swift
//  U_FungiFinder
//
//  Created by Don McKenzie on 11/29/21.
//

import Foundation
import Firebase

class FungiListViewModel: ObservableObject {
    
    let storage = Storage.storage()
    
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
