//
//  VindCreationS.swift
//  Vind
//
//  Created by Vadym Malakhatko on 24.09.2023.
//

import Foundation
 
protocol VindService {
    func addEvent(_ event: Vind, completion: @escaping (Result<Void, Error>) -> Void)
}

