//
//  DashboardDetailsView.swift
//  iOS_Grassdoor
//
//  Created by Ranjitha S on 03/08/22.
//

import SwiftUI

struct DashboardDetailsView: View {
    
    @State var text: String = "Multiline \ntext \nis called \nTextEditor"
    @State var title: String = ""
    @State var description: String = ""
    @State var pushActive = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    HStack(spacing: 0) {
                        HStack {
                            Image(systemName: "house")
                                .frame(width: 50, height: 50, alignment: .center)
                                .background(Color.white)
                                .padding([.leading, .trailing], 10)
                               // .background(Color.cyan)
                        }
                        
                        VStack(spacing: 0){
                            Text("Title: \(title)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.size.width - 100, height: 50 , alignment: .leading)
                               // .background(Color.yellow)
                            
                            Text("Description: \(description)")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .frame(width: UIScreen.main.bounds.size.width - 100, height: 200 , alignment: .leading)
                            //.background(Color.green)
                        }.frame(width: 330, height: 300, alignment: .leading)
                            //.background(Color.green)
                        
                    }.frame(width:  UIScreen.main.bounds.size.width - 20, height: 250, alignment: .leading)
                        //.background(Color.cyan)
                    
                    VStack(spacing: 20){
                        
                        NavigationLink(destination: VideoLoadingView(), isActive: $pushActive) {
                            Button("Tap to watch") {
                                print("Button tapped!")
                                self.pushActive = true
                                
                            }.frame(width:  UIScreen.main.bounds.size.width - 150 , height: 50, alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(.white)
                        }
                        
                        TextEditor(text: $text)
                            .foregroundColor(Color.red)
                            .frame(width:  UIScreen.main.bounds.size.width - 150 , height: 150, alignment: .center)
                            .border(Color.indigo, width: 2)
                            .padding([.leading, .trailing], 10)
                    }
                }
            }
        }
    
    }
}

struct DashboardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardDetailsView()
    }
}
