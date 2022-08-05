//
//  DashboadView.swift
//  iOS_Grassdoor
//
//  Created by Ranjitha S on 02/08/22.
//

import SwiftUI

struct TabsView: View {
    
    var array: [String] = ["Home", "Fav"]
    @ObservedObject var dashboardViewModel = DashboardViewModel()
    @State var isNavigate: Bool = false
    @State var pushActive = false
    
    var body: some View {
        NavigationView {
        GeometryReader { geometry in
            
                ZStack{
                    TabView {
                        List(array, id: \.self) { string in
                            if let popList = dashboardViewModel.popularList {
                                ForEach(Array(popList.enumerated()), id: \.offset) { offset, element in
                                    
                                    HStack(spacing: 10){
                                        Image(uiImage:((UIImage(named: "\(String(describing: popList[offset].posterPath))") ?? UIImage(systemName: "house"))!))
                                            .frame(width: 50, height: 50, alignment: .leading)
                                            .background(Color.white)
                                        
                                        VStack(spacing: 10){
                                            Text("Title: \(popList[offset].title ?? "HI")")
                                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding([.leading, .trailing], -100)
                                                .lineLimit(2)
                                            //  .background(Color.yellow)
                                            
                                            Text("Release Date: \(popList[offset].releaseDate ?? "HI")")
                                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                                .frame(width:  UIScreen.main.bounds.size.width, height: 30, alignment: .leading)
                                            // .background(Color.yellow)
                                            
                                        }.frame(width: UIScreen.main.bounds.size.width - 200, height: 100, alignment: .leading)
                                        //.background(Color.blue)
                                            .padding(.horizontal, -20)
                                        
                                        NavigationLink(destination: DashboardDetailsView(title: "\(popList[offset].title ?? "HI")", description: "\(popList[offset].overview ?? "HI")")) {
                                            
                                        }
                                    }.frame(width: UIScreen.main.bounds.size.width - 100, height: 100, alignment: .leading)
                                    //.background(Color.pink)
                                        .padding(.horizontal, 15)
                                    
                                    
                                }//.background(Color.pink)
                            }
                        }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Home")
                                
                            }.onAppear(){
                                dashboardViewModel.getPopularMovies() { (response, statusCode) in
                                }
                            }.refreshable {
                                
                                dashboardViewModel.getPopularMovies() { (response, statusCode) in
                                }
                            }
                        
                        //            .alert(isPresented: self.$showsAlert) {
                        //                        Alert(title: Text("Hello"))
                        //                    }
                        
                        List(array, id: \.self) { string in
                            if let topList = dashboardViewModel.topRatedList {
                                ForEach(Array(topList.enumerated()), id: \.offset) { offset, element in
                                    HStack(spacing: 20){
                                        Image(systemName: "house.fill")
                                        VStack(spacing: 20){
                                            Text("Title: \(topList[offset].title ?? "HI")")
                                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                                .frame(width:  UIScreen.main.bounds.size.width, height: 30, alignment: .leading)
                                                .lineLimit(2)
                                            Text("Release Date: \(topList[offset].releaseDate ?? "HI")")
                                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                                .frame(width:  UIScreen.main.bounds.size.width, height: 30, alignment: .leading)
                                        }.frame(width: UIScreen.main.bounds.size.width, height: 100, alignment: .leading)
                                        
                                        NavigationLink(destination: DashboardDetailsView(title: "\(topList[offset].title ?? "HI")", description: "\(topList[offset].overview ?? "HI")")) {
                                            
                                        }
                                    }.background(Color.yellow)
                                }
                            }
                        }.tabItem {
                            Image(systemName: "house.fill")
                            Text("Fav")
                            
                        }.onAppear(){
                            dashboardViewModel.getTopRated() { (response, statusCode) in
                            }
                        }.refreshable {
                            dashboardViewModel.getTopRated() { (response, statusCode) in
                            }
                        }
                    }
                }
                
            }
            
        }
    }
}

