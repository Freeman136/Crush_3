//
//  SwiftUIView.swift
//  Crush3
//
//  Created by Andrew on 28.10.2023.
//

import SwiftUI

struct ContentView11: View {
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Section {
                        Image("Services")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                        Text("123")
                    }
                }
                HStack {
                    Image("Services")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                        Text("123")
                    }
                }
            .navigationTitle("Catarina Martines")
            }
        }
    }

#Preview {
    ContentView11()
}


struct MainMenuLogo {
    let image: String
    let name: String
    static let menuNameList: [String] = ["My Bookings","Favorites","Payment Methods", "My Addresses", "My Chats", "My Reviews", "Notifications", "Bonus program", "About Servise","Help","City", "Language","Support Chat"]
    static let menuImages: [String] = []
}






