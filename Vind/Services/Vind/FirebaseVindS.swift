//
//  FirebaseVindCreationS.swift
//  Vind
//
//  Created by Vadym Malakhatko on 24.09.2023.
//

import FirebaseFirestore

import Foundation

class FirebaseVindService : VindService {
    private var db = Firestore.firestore()
    
    func addEvent(_ event: Vind, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection("Vinds").addDocument(data:[
            "title": event.title,
            "friendsOnly": event.friendsOnly,
            "userId": event.userId,
            "date": event.date,
            "durationSeconds": event.durationSeconds
        ]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}

