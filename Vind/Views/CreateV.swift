//
//  CreateV.swift
//  Vind
//
//  Created by Vadym Malakhatko on 29.08.2023.
//

import SwiftUI

struct CreateView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @ObservedObject var viewModel: VindViewModel
    
    @State private var eventName: String = ""
    @State private var isPrivate: Bool = true
    @State private var selectedTime: Int = 6
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    TextField("Event Name", text: $eventName)
                        .padding(10)
                        .border(Color.gray, width: 0.5)
                    
                    Toggle(isOn: $isPrivate) {
                        Text("Friends only?")
                    }.padding()
                }
                Picker("Hour", selection: $selectedTime) {
                    ForEach(0..<24) { hour in
                        Text("\(hour) hr")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(maxWidth: 100)
                .clipped()
            }
            Button("Add Event") {
                let event = Vind(title: eventName, friendsOnly: isPrivate, userId: authenticationViewModel.user!.id, date: Date(), durationSeconds: selectedTime * 3600)
                viewModel.addEvent(event: event) { result in
                    switch result {
                    case .success:
                        alertMessage = "Success"
                        showAlert = true
                    case .failure(let error):
                        // Handle error, e.g., show an error message to the user
                        print("Error adding event: \(error)")
                    }
                }
            }.padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Result "),
                        message: Text(alertMessage),
                        dismissButton: Alert.Button.default(
                            Text("Ok"), action: { 
                                print("Hello world!")
                            }
                        ))
                }
        }.padding()
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(viewModel: VindViewModel(eventService: MockVindService()))
    }
}
