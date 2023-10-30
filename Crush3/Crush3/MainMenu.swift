//
//  MainMenu.swift
//  Crush3
//
//  Created by Andrew on 25.10.2023.
//

import SwiftUI

struct ContentView1: View {
    @State private var isShowingDetail = false

    var body: some View {
        Button("Show Detail") {
            isShowingDetail = true
        }
        .sheet(isPresented: $isShowingDetail) {
            DetailView()
        }
    }
}

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                UserIcon()
            }
            ZStack {
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}


struct UserIcon: View {
    
    var body: some View {
        Image("UsersLogoMain")
            .resizable()
            .frame(width: 48, height: 48, alignment: .top)
//            .padding(.bottom, 651)
//            .padding(.trailing, 277)
        Text("Catarina Martines")
            .font(Font.custom("Montserrat", size: 16))
            .fontWeight(.bold)

    }
}

#Preview {
    ContentView1()
}
