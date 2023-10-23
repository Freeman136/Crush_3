//
//  ContentView.swift
//  Crush3
//
//  Created by Andrew on 23.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @State private var searchText = ""
    let items = [
        Item(imageName: "h", title: "Manicure"),
        Item(imageName: "h2", title: "Hair Extension"),
        Item(imageName: "h3", title: "Lips"),
        Item(imageName: "h4", title: "Lips")
    ]
    let topChartSalons = [
        SalonsTopTen(imageName: "SalonImage_480_280_1", title: "Crush"),
        SalonsTopTen(imageName: "SalonImage_480_280_2", title: "Prive7 Dubai")
        
    ]
    
    var body: some View {
        VStack {
            HStack( spacing: 16)
            {
                Image("Logos")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .contrast(3)
                
                SearchBar(text: $searchText)
                    .clipShape(Capsule())
                    .foregroundColor(.pink)
                
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
            ScrollView(.vertical, showsIndicators: false) {
                
                HStack {
                    Text("Popular Services")
                        .font(Font.custom("Montserrat", size: 36))
                        .font(.largeTitle)
                        .padding(35)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 16) {
                        ForEach(items, id: \.self) { item in
                            VStack {
                                Image(item.imageName)
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .background(.white)
                                    .cornerRadius(10)
                                
                                Text(item.title)
                                    .font(Font.custom("Montserrat", size: 16))
                                    .foregroundColor(.black)
                                
                                
                            }
                        }
                    }
                    
                }.padding(16)
                    .padding(.bottom, 20)
                
                
                
                Text("Recommended Salons")
                    .font(Font.custom("Montserrat", size: 36))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 16) {
                        ForEach(topChartSalons, id: \.self) { item in
                            VStack {
                                Image(item.imageName)
                                    .resizable()
                                    .frame(width: 280, height: 416)
                                    .background(.white)
                                    .cornerRadius(10)
                                
                                Text(item.title)
                                    .font(Font.custom("Montserrat", size: 16))
                                    .foregroundColor(.black)
                                
                            }
                        }
                    }
                }
            }
            
            
            ZStack {
                Capsule()
                    .foregroundColor(Color.white.opacity(0.7))
                    .frame(width: 380, height: 80, alignment: .center)
                    .blur(radius: 0.3)
                    .colorMultiply(.gray)
                    .opacity(0.3)
                    .padding(33)
                
                
                HStack {
                    Button(action: {
                        self.selected = 0
                    }) {
                        VStack {
                            Image(Icons.home)
                                .resizable()
                                .frame(width: Icons.frameWidth, height: Icons.frameHeight, alignment: .center)
                            Text("Home")
                                .foregroundColor(self.selected == 0 ? .pink : .black)
                                .font(.system(size: 13))
                        }
                    }
                    Spacer(minLength: 33)
                    
                    Button(action: {
                        self.selected = 1
                    }) {
                        VStack {
                            Image(Icons.salons)
                                .resizable()
                                .frame(width: Icons.frameWidth, height: Icons.frameHeight, alignment: .center)
                            Text("Salons")
                                .foregroundColor(self.selected == 1 ? .pink : .black)
                                .font(.system(size: 13))
                        }
                    }
                    
                    Spacer().frame(width: 120)
                    
                    Button(action: {
                        self.selected = 2
                    }) {
                        VStack {
                            Image(Icons.services)
                                .resizable()
                                .frame(width: Icons.frameWidth, height: Icons.frameHeight, alignment: .center)
                            Text("Services")
                                .foregroundColor(self.selected == 2 ? .pink : .black)
                                .font(.system(size: 13))
                        }
                    }
                    
                    Spacer(minLength: 12)
                    
                    Button(action: {
                        self.selected = 3
                    }) {
                        VStack {
                            Image(Icons.blog)
                                .resizable()
                                .frame(width: Icons.frameWidth, height: Icons.frameHeight, alignment: .center)
                            Text("Blog")
                                .foregroundColor(self.selected == 3 ? .pink : .black)
                                .font(.system(size: 13))
                        }
                    }
                }
                .padding()
                .padding(.horizontal, 37)
                
                Button(action: {}) {
                    Image("ExpressButton")
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .contrast(2)
                }
                .clipShape(Circle())
                .offset(y: -23)
                .shadow(color: .pink, radius: 1.5, x: 0.0, y: 0.0)
                
                
            }
        }
        
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
            Image(systemName: "magnifyingglass")
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

struct Item: Hashable {
    let id = UUID()
    let imageName: String
    let title: String
}

struct SalonsTopTen: Hashable {
    let id = UUID()
    let imageName: String
    let title: String
}

struct Icons {
    static let home = "Home"
    static let salons = "Salons"
    static let services = "Services"
    static let blog = "Blog"
    
    static let frameWidth: CGFloat = 20
    static let frameHeight: CGFloat = 20
}

