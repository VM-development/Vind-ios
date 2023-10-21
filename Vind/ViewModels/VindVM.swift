//
//  VindVM.swift
//  Vind
//
//  Created by Vadym Malakhatko on 24.09.2023.
//

import Foundation

class VindViewModel: ObservableObject {
    private var eventService: VindService
    @Published var events: [Vind] = []
    
    init(eventService: VindService) {
        self.eventService = eventService
    }
    
    func addEvent(event: Vind, completion: @escaping (Result<Void, Error>) -> Void) {
        eventService.addEvent(event) { result in
            switch result {
            case .success:
                // Handle success, e.g., add event to the events list
                self.events.append(event)
                completion(.success(()))
            case .failure(let error):
                // Handle error, e.g., show an error message to the user
                print("Error adding event: \(error)")
                completion(.failure(error))
            }
        }
    }
}
