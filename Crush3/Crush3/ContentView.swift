//
//  ContentView.swift
//  NewTestsSUI
//
//  Created by Andrew on 24.10.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var selected = 0
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
            ExtractedView()
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Popular Services")
                        .font(Font.custom("Montserrat", size: 36))
                        .font(.largeTitle)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(items, id: \.id) { item in
                                VStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                    Text(item.title)
                                        .font(Font.custom("Montserrat", size: 16))
                                }
                            }
                        }
                        
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 20, trailing: 0))
                    
                    Text("Recommended Salons")
                        .font(Font.custom("Montserrat", size: 36))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(topChartSalons, id: \.self) { item in
                                VStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 280, height: 416)
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
                    ButtomBar()
                    HStack {
                        Button(action: {
                            self.selected = 0
                        }) {
                            VStack {
                                Image(Icons.home)
                                    .resizable()
                                    .frame(width: Icons.frameWidth, height: Icons.frameHeight, alignment: .center)
                                    .foregroundStyle(self.selected == 0 ? .pink : .black)
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
                                    .foregroundStyle(self.selected == 1 ? .pink : .black)
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
                                    .foregroundStyle(self.selected == 2 ? .pink : .black)
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
                                    .foregroundStyle(self.selected == 3 ? .pink : .black)
                                Text("Blog")
                                    .foregroundColor(self.selected == 3 ? .pink : .black)
                                    .font(.system(size: 13))
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    
                    Button(action: {}) {
                        Image("ExpressButton")
                            .resizable()
                            .frame(width: 70, height: 70, alignment: .center)
                            .contrast(2)
                    }
                    .clipShape(Circle())
                    .offset(y: -23)
                    .shadow(color: .pink, radius: 1.5, x: 0.0, y: 0.0)
                }.padding(EdgeInsets(top: 611, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ButtomBar: View {
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(.clear)
                .background(GlassView(removeEffects: false))
                .clipShape(.rect(cornerRadius: 80))            .frame(width: 380, height: 70)
        }
    }
}
struct TopBarGlass: View {
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(.clear)
                .background(GlassView(removeEffects: false))
                .clipShape(.rect(cornerRadius: 80))            .frame(width: 380, height: 70)
        }
    }
}

struct IconLeft: View {
    var body: some View {
        HStack( spacing: 16) {
            Image("Logos")
                .resizable()
                .frame(width: 48, height: 48)
                .contrast(3)
                .padding(.leading, 16)

        }
    }
}


struct Icons {
    static let home = "Home"
    static let salons = "Salons"
    static let services = "Services"
    static let blog = "Blog"
    
    static let frameWidth: CGFloat = 20
    static let frameHeight: CGFloat = 20
}
struct Item: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
}

struct SalonsTopTen: Hashable {
    let imageName: String
    let title: String
}

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                TextField("Find...", text: $text)
                    .textFieldStyle(.plain)
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 96))
                    .overlay(RoundedRectangle(cornerRadius:48).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                    .lineLimit(1)
            }
        }
    }
}

struct ExtractedView: View {
    @State private var searchText = ""

    var body: some View {
        HStack( spacing: 16) {
            IconLeft()
            SearchBar(text: $searchText)
        }
    }
}
