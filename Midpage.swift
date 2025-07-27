//
//  Midpage.swift
//  Bicycle
//
//  Created by DEEPAK on 28/09/24.
//
 

import SwiftUI
struct Midpage: View {
    
    var body: some View {
        
        ZStack{
                Text("Choose among the two options")
                    .font(.title)
//                    .background(isDarkMode ? Color.white:Color.black) // Background
                    .foregroundColor(.black)
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top,-200)
                VStack{
                    NavigationLink(destination: estimatedprice()) {
                        Text("Rent a Bicycle (Estimated Price)")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black) // Background based on mode
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: takingrent()) {
                        Text("Get paid for your Bicycle")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background( Color.black) // Background based on mode
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                .navigationTitle("Renzy")
                .padding()
                 
            }
        }}

    //}
#Preview {
    Midpage()
}
