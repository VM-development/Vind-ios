//
//  MockVindService.swift
//  Vind
//
//  Created by Vadym Malakhatko on 12.10.2023.
//

import Foundation

class MockVindService: VindService {
    func addEvent(_ event: Vind, completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
}

