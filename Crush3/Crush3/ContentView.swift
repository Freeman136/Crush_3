//
//  ContentView.swift
//  NewTestsSUI
//
//  Created by Andrew on 24.10.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var selected = 0
    let horizontalScrollView = [
        ImageScrollView(imageName: "h", title: "Manicure"),
        ImageScrollView(imageName: "h2", title: "Hair Extension"),
        ImageScrollView(imageName: "h3", title: "Lips"),
        ImageScrollView(imageName: "h4", title: "eyelashes"),
        ImageScrollView(imageName: "h", title: "Manicure"),
        ImageScrollView(imageName: "h2", title: "Hair Extension"),
        ImageScrollView(imageName: "h3", title: "Lips"),
        ImageScrollView(imageName: "h4", title: "eyelashes")
    ]
    
    let topChartSalons = [
        SalonsTopTen(imageName: "salonImage_480_280_1", title: ""),
        SalonsTopTen(imageName: "salonImage_480_280_2", title: ""),
        SalonsTopTen(imageName: "salonImage_480_280_3", title: ""),
        SalonsTopTen(imageName: "salonImage_480_280_4", title: ""),
        SalonsTopTen(imageName: "salonImage_480_280_5", title: ""),
        SalonsTopTen(imageName: "salonImage_480_280_6", title: ""),
        SalonsTopTen(imageName: "salonImage_480_280_7", title: "")
    ]
    
    var body: some View {
        
        VStack {
            SearchBarOnTop()
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Popular Services")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 80))
                        .font(Font.custom("Montserrat", size: 36))
                        .font(.largeTitle)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(horizontalScrollView, id: \.id) { item in
                                VStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                    Text(item.title)
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    
                    Text("Recommended Salons")
                        .font(Font.custom("Montserrat", size: 36))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        let horizonlatPadding: CGFloat = 280
                        let verticallatPadding: CGFloat = 96

                        HStack(spacing: 16) {
                            ForEach(topChartSalons, id: \.self) { item in
                                ZStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 280, height: 416)
                                        .cornerRadius(10)
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .background(GlassViewRender(removeEffects: false)
                                            .frame(width: horizonlatPadding, height: verticallatPadding, alignment: .bottom))
                                        .padding(.top, 330)
                                        .cornerRadius(10)
                                    
                                    HStack {
                                        RoundHorizontalScrollView(logo: "star.fill", price: "4,6")
                                        RoundHorizontalScrollView(logo: "bubble.left", price: "25")
                                        RoundHorizontalScrollView(logo: "dollarsign.square", price: "120")
                                    } 
                                    .padding(EdgeInsets(top: 290, leading: 20, bottom: 0, trailing: 80))
                                    
                                    Text("Narine Beauty Studio")
                                        .font(
                                            Font.custom("Montserrat", size: 19)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(.white)
                                        .padding(EdgeInsets(top: 365, leading: 0, bottom: 0, trailing: 70))
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    Image(BannerIcons.banner)
                        .resizable()
                        .frame(width: 380, height: 250, alignment: .center)
                    VStack {
                        Text("The Best")
                            .padding(.trailing, 220)
                        Text("Beauty Experts")
                            .padding(.trailing, 115)
                    }
                    .font(Font.custom("Montserrat", size: 36)
                    .weight(.medium)
                    )
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(topChartSalons, id: \.self) { item in
                                VStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 160, height: 208)
                                        .cornerRadius(10)
                                    Text(item.title)
                                        .font(Font.custom("Montserrat", size: 16))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
                
                ZStack {
                    TabBar()
                    HStack {
                        Button(action: {
                            self.selected = 0
                        }) {
                            VStack {
                                Image(Constants.namesOfButton.home.rawValue)
                                    .resizable()
                                    .frame(width: Constants.frameWidth, height: Constants.frameHeight, alignment: .center)
                                    .foregroundStyle(self.selected == 0 ? .pink : .black)
                                Text("Home")
                                    .foregroundColor(self.selected == 0 ? .pink : .black)
                                    .font(Font.custom("Montserrat", size: 13))
                            }
                        }.padding(.trailing, 30)
                        
                        Button(action: {
                            self.selected = 1
                        }) {
                            VStack {
                                Image(Constants.namesOfButton.salons.rawValue)
                                    .resizable()
                                    .frame(width: Constants.frameWidth, height: Constants.frameHeight, alignment: .center)
                                    .foregroundStyle(self.selected == 1 ? .pink : .black)
                                Text("Salons")
                                    .foregroundColor(self.selected == 1 ? .pink : .black)
                                    .font(Font.custom("Montserrat", size: 13))
                            }
                        }.padding(.trailing, 80)
                        
                        Button(action: {
                            self.selected = 2
                        }) {
                            VStack {
                                Image(Constants.namesOfButton.services.rawValue)
                                    .resizable()
                                    .frame(width: Constants.frameWidth, height: Constants.frameHeight, alignment: .center)
                                    .padding(2)
                                    .foregroundStyle(self.selected == 2 ? .pink : .black)
                                Text("Services")
                                    .foregroundColor(self.selected == 2 ? .pink : .black)
                                    .font(Font.custom("Montserrat", size: 13))
                            }
                        }.padding(.trailing, 30)
                        
                        Button(action: {
                            self.selected = 3
                        }) {
                            VStack {
                                Image(Constants.namesOfButton.blog.rawValue)
                                    .resizable()
                                    .frame(width: Constants.frameWidth, height: Constants.frameHeight, alignment: .center)
                                    .foregroundStyle(self.selected == 3 ? .pink : .black)
                                Text("Blog")
                                    .foregroundColor(self.selected == 3 ? .pink : .black)
                                    .font(Font.custom("Montserrat", size: 13))
                            }
                        }
                    }
                    
                    Button(action: {}) {
                        Image("ExpressButton")
                            .resizable()
                            .frame(width: 70, height: 70, alignment: .center)
                            .contrast(2)
                    }
                    .clipShape(Circle())
                    .offset(y: -23)
                    .shadow(color: .pink, radius: 1.5, x: 0.0, y: 0.0)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, -10)
            }
        }
    }
}

struct TopBarGlass: View {
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(.clear)
                .background(GlassViewRender(removeEffects: false))
                .clipShape(.rect(cornerRadius: 80))
                .frame(width: 380, height: 70)
        }
    }
}

struct ScreenTransitionLogo: View {
    @State private var isShowingDetail = false
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image("Logos")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .contrast(3)
                    .padding(.leading, 16)
                    .onTapGesture {
                        isShowingDetail = true
                    }
            }
        }
        .sheet(isPresented: $isShowingDetail) {
            MainMenuPopUp()
        }
    }
}

struct ImageScrollView: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
}
struct SalonsTopTen: Hashable {
    let imageName: String
    let title: String
}

struct redIconUniSize: View {
    var sizeHorizontal: CGFloat
    var sizeVertical: CGFloat
    var textInIcon: String
    var textOnIcon: String
    var insideIcon: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 74, height: 32, alignment: .center)
                .foregroundStyle(Color(red: 0.99, green: 0.39, blue: 0.42))
            Text(textOnIcon)
                .foregroundStyle(.white)
            if insideIcon {
                Circle()
                    .overlay(Text(textInIcon)
                        .foregroundColor(.white))
                    .frame(width: sizeHorizontal, height: sizeVertical, alignment: .center)
                    .padding(.horizontal, -32)
                    .foregroundStyle(Color.white.opacity(0.25))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
