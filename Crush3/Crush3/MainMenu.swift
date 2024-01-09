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
            MainMenuPopUp()
        }
    }
}

struct MainMenuPopUp: View {
    @Environment(\.presentationMode) var presentationMode
    let iconInside:Bool = false
    @State var bonusTriger = "bonusProgram_24_24"
    let imageMainMenuLogoArray = [
        ImageMainMenuLogo(imageName: "myBookings_24_24", title: "My Bookings", menu: .myBooking),
        ImageMainMenuLogo(imageName: "favorites_24_24", title: "Favorites", menu: .favorites),
        ImageMainMenuLogo(imageName: "paymentMethods_24_24", title: "Payment Methods", menu: .paymentMethods),
        ImageMainMenuLogo(imageName: "myAddresses_24_24", title: "My Addresses", menu: .myAddresses),
        ImageMainMenuLogo(imageName: "myChats_24_24", title: "My Chats", menu: .myChats),
        ImageMainMenuLogo(imageName: "myReview_24_24", title: "My Reviews", menu: .myReview),
        ImageMainMenuLogo(imageName: "notifications_24_24", title: "Notifications", menu: .notifications),
        ImageMainMenuLogo(imageName: "bonusProgram_24_24", title: "Bonus program", menu: .bonusProgram),
        ImageMainMenuLogo(imageName: "aboutServise_24_24", title: "About Servise", menu: .aboutServise),
        ImageMainMenuLogo(imageName: "help_24_24", title: "Help", menu: .help),
        ImageMainMenuLogo(imageName: "city_24_24", title: "City", menu: .city),
        ImageMainMenuLogo(imageName: "language_24_24", title: "Language", menu: .language),
        ImageMainMenuLogo(imageName: "supportChat_24_24", title: "Support Chat", menu: .supportChat),
        ImageMainMenuLogo(imageName: "logOut_24_24", title: "Log Out", menu: .logOut)
    ]
  
    var body: some View {

        VStack {
            UserIconView()
            NavigationView {
                List {
                    ForEach(imageMainMenuLogoArray, id: \.id) { item in
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.trailing, 17)
                            Text(item.title)
                            if item.imageName == bonusTriger {
                                BonusIcon()
                                    .padding(EdgeInsets(top: 0, leading: 65, bottom: 0, trailing: 0))
                            }
                            if item.imageName == "city_24_24" {
                                redIconUniSize(sizeHorizontal: 100, sizeVertical: 20, textInIcon: "", textOnIcon: "Dube", insideIcon: iconInside)
                            }
                        }
                    }
                    ZStack {
                        Button("Dismiss") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct ImageMainMenuLogo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let menu: Menu
    
}
enum Menu: String {
case myBooking,favorites,paymentMethods,myAddresses,myChats,myReview,notifications,bonusProgram,aboutServise,help,city,language,supportChat,logOut
}

struct UserIconView: View {
    
    var body: some View {
        HStack {
            Image("UsersLogoMain")
                .resizable()
                .frame(width: 48, height: 48, alignment: .top)
            Text("Catarina Martines")
                .font(
                    Font.custom("Montserrat", size: 16)
                    .weight(.semibold)
                )
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 108))
                .foregroundColor(Color.black)
            Image(systemName: "greaterthan")
                .foregroundStyle(Color(red: 0.99, green: 0.39, blue: 0.42))
        }
        .padding(.top, 12)
    }
}

#Preview {
//    ContentView1()
    MainMenuPopUp()
}
