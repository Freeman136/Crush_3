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
        ImageHorizontalScroll(imageName: "h", title: "Manicure"),
        ImageHorizontalScroll(imageName: "h2", title: "Hair Extension"),
        ImageHorizontalScroll(imageName: "h3", title: "Lips"),
        ImageHorizontalScroll(imageName: "h4", title: "eyelashes"),
        ImageHorizontalScroll(imageName: "h", title: "Manicure"),
        ImageHorizontalScroll(imageName: "h2", title: "Hair Extension"),
        ImageHorizontalScroll(imageName: "h3", title: "Lips"),
        ImageHorizontalScroll(imageName: "h4", title: "eyelashes")
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
                    Text("Popular Services          ")
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
                        
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    
                    Text("Recommended Salons")
                        .font(Font.custom("Montserrat", size: 36))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
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
                                                .frame(width: 280, height: 96, alignment: .bottom))
                                                .padding(.top, 330)
                                                .cornerRadius(10)
                                    
                                    ///
                                    ///
                                    ///
                                    HStack {
                                        IconsInHirizontalScrollView(logo: "star.fill", price: "4,6")
                                        IconsInHirizontalScrollView(logo: "bubble.left", price: "25")
                                        IconsInHirizontalScrollView(logo: "dollarsign.square", price: "120")
                                        
                                    } .padding(EdgeInsets(top: 290, leading: 20, bottom: 0, trailing: 80))
                                    
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
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    // PINK image banenr
                    Image("banner")
                        .resizable()
                        .frame(width: 380, height: 250, alignment: .center)
                                        VStack {
                        Text("The Best")
                            .padding(.leading, -180)

                        Text("Beauty Experts")
                            .padding(.leading, -115)

                    }
                    .font(
                        Font.custom("Montserrat", size: 36)
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
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct                     TabBar: View {
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
            DetailView()
        }
    }
}
struct Constants {
    enum namesOfButton: String {
    case home = "Home"
    case salons = "Salons"
    case services = "Services"
    case blog = "Blog"
    }
   
    static let frameWidth: CGFloat = 24
    static let frameHeight: CGFloat = 24
}
struct ImageHorizontalScroll: Identifiable {
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
            HStack(spacing: 16) {
                TextField("Find...", text: $text)
                    .textFieldStyle(.plain)
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 96))
                    .overlay(RoundedRectangle(cornerRadius:48).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                    .lineLimit(1)
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 74, height: 32, alignment: .center)
                        .foregroundStyle(Color(red: 0.99, green: 0.39, blue: 0.42))
                    Text("577")
                        .padding(.leading, 22)
                        .foregroundStyle(.white)
                    Circle()
                        .overlay(Text("C")
                            .foregroundColor(.white))
                        .frame(width: 24, height: 24, alignment: .center)
                        .padding(.horizontal, -32)

                        .foregroundStyle(Color.white.opacity(0.25))
       
                }
            }
            .padding(.trailing,16)
    }
}
struct SearchBarOnTop: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack( spacing: 16) {
            ScreenTransitionLogo ()
            SearchBar(text: $searchText)
        }
    }
}
struct IconsInHirizontalScrollView: View {
    let logo: String
    let price: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 55, height: 24, alignment: .center)
                .foregroundStyle(Color.black.opacity(0.1))
            Text(price)
                .font(
                    Font.custom("Montserrat", size: 12)
                        .weight(.medium)
                )                                           .padding(.leading, 15)
                .foregroundStyle(.white)
            Image(systemName: logo)
                .resizable()
                .frame(width: 13, height: 13, alignment: .center)
                .foregroundColor(.white)
                .padding(.horizontal, -20)
            
        }
    }
}
