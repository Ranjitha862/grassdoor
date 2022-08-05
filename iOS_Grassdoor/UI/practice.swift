//
//  practice.swift
//  iOS_Grassdoor
//
//  Created by Ranjitha S on 05/08/22.
//

import SwiftUI

struct practice: View {
    
    
    
    
    var body: some View {
            GeometryReader { geometry in
                
                ZStack{
                    Color.white
                        .ignoresSafeArea()
                    HStack{
                    VStack(spacing: 10) {
                        
                        Text("Hi")
                        
                        Text("Hi")
                        
                        Text("Hi")
                    }
                        HStack{
                            
                           Image(systemName: "house")
                        
                }
                    }
            }
        }
    }
}

struct practice_Previews: PreviewProvider {
    static var previews: some View {
        practice()
    }
}
