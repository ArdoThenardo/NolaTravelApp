//
//  DestinationDetailView.swift
//  NolaTravelApp
//
//  Created by Thenardo Ardo on 23/05/22.
//

import SwiftUI
import WaterfallGrid

struct DestinationDetailView: View {
    
    let menus = ["Overview", "Review", "Photo", "Video"]
    @State var selectedMenuIndex = 0
    @State var extendMenuTab: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // Nav Bar
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .aspectRatio(contentMode: .fit)
                        
                        Spacer()
                        
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 16, height: 20)
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .frame(height: 1)
                        .opacity(extendMenuTab ? 0 : 1)
                }
                .frame(height: 35)
                
                List {
                    // Image Cover Header
                    GeometryReader { geometry in
                        ZStack(alignment: .bottomLeading) {
                            Image("beach")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: 450)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .overlay(
                                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                )
                                .shadow(radius: 6)
                            
                            VStack(alignment: .leading, spacing: 16) {
                                HStack(alignment: .center) {
                                    Text("Wuhu Island")
                                        .lineLimit(2)
                                        .font(.custom(CustomFont.mainBold, size: 28))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Image(systemName: "star.fill")
                                            .font(.title2)
                                            .foregroundColor(.yellow)
                                        
                                        Text("**4.8** Ratings")
                                            .font(.custom(CustomFont.mainRegular, size: 12))
                                            .foregroundColor(.white)
                                    }
                                }
                                
                                HStack(alignment: .center) {
                                    Group {
                                        Text("Rp 120.000")
                                            .font(.custom(CustomFont.mainBold, size: 20))
                                        +
                                        Text(" / person")
                                            .font(.custom(CustomFont.mainBold, size: 14))
                                    }
                                    .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    TravelerCircles()
                                        .frame(width: 70)
                                        .offset(x: 30)
                                }
                            }
                            .padding(.bottom, 24)
                            .padding(.horizontal, 16)
                        }
                    }
                    .frame(height: 450)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                    .onAppear {
                        extendMenuTab = false
                    }
                    .onDisappear {
                        extendMenuTab = true
                    }
                    
                    // Tab Menu & Sub Menu
                    Section {
                        if selectedMenuIndex == 0 { // Overview
                            VStack(alignment: .leading) {
                                HStack(alignment: .top, spacing: 36) {
                                    HStack(alignment: .top) {
                                        Image("icon_clock")
                                            .resizable()
                                            .foregroundColor(Color("blue"))
                                            .padding(5)
                                            .background(Color("light_gray"))
                                            .frame(width: 36, height: 36)
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                        
                                        VStack(alignment: .leading) {
                                            Text("DURATION")
                                                .font(.custom(CustomFont.mainRegular, size: 12))
                                                .foregroundColor(.gray)
                                            Text("3 days")
                                                .font(.custom(CustomFont.mainBold, size: 16))
                                        }
                                    }
                                    
                                    HStack(alignment: .top) {
                                        Image("icon_location")
                                            .resizable()
                                            .foregroundColor(Color("blue"))
                                            .padding(5)
                                            .background(Color("light_gray"))
                                            .frame(width: 36, height: 36)
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                        
                                        VStack(alignment: .leading) {
                                            Text("LOCATION")
                                                .font(.custom(CustomFont.mainRegular, size: 12))
                                                .foregroundColor(.gray)
                                            Text("Nintendo, Japan")
                                                .font(.custom(CustomFont.mainBold, size: 16))
                                        }
                                    }
                                }
                                .padding(.bottom)
                                
                                Text(SampleData.sampleLongText)
                                    .font(.body)
                                    .lineSpacing(5)
                                    .padding(.bottom, 120)
                            }
                            .padding(.top)
                            .listRowSeparator(.hidden)
                        } else if selectedMenuIndex == 1 { // Review
                            LazyVStack(alignment: .leading, spacing: 20) {
                                ForEach((0..<6), id: \.self) { _ in
                                    ReviewItem()
                                }
                            }
                            .padding(.top, 28)
                            .padding(.bottom, 120)
                            .listRowSeparator(.hidden)
                        } else if selectedMenuIndex == 2 { // Photo
                            WaterfallGrid((0..<8), id: \.self) { element in
                                Image("beach_\(element + 1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .gridStyle(columns: 2, spacing: 2, animation: nil)
                            .padding(.top, 28)
                            .padding(.bottom, 120)
                            .listRowSeparator(.hidden)
                        }
                    } header: {
                        // Tab Menu
                        VStack(alignment: .leading) {
                            HStack {
                                ForEach(Array(menus.enumerated()), id: \.offset) { index, menu in
                                    TabItem(name: menu, isSelected: index == selectedMenuIndex ? true : false)
                                        .onTapGesture {
                                            selectedMenuIndex = index
                                        }
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, extendMenuTab ? 10 : 0)
                        }
                        .frame(maxWidth: .infinity)
                        .listRowInsets(EdgeInsets())
                        .background(.white)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
                .listStyle(.plain)
                .edgesIgnoringSafeArea(.top)
            }
            
            // Book Now Button
            VStack {
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(height: 1)
                
                Button {
                    
                } label: {
                    HStack(alignment: .center) {
                        Text("Book Now")
                            .font(.custom(CustomFont.mainBold, size: 18))
                            .foregroundColor(.white)
                            .frame(width: 240)
                        
                        Image(systemName: "arrow.forward")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color("blue"))
                    .cornerRadius(26)
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .background(.white)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DestinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetailView()
    }
}
