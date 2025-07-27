//
//  estimatedprice.swift
//  Bicycle
//
//  Created by DEEPAK on 28/09/24.
//
import SwiftUI

struct estimatedprice: View {
    @State private var selectedBikeType: String = "Regular"
    @State private var rentalDuration: Double = 0.0
    @State private var totalPrice: String = ""
    let bikeTypes = ["Regular", "Gear", "MTB Gear"]

    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Select a Bicycle Type 🚴‍♂️")
                    .font(.system(size: 35, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

                Picker("Select a Bike", selection: $selectedBikeType) {
                    ForEach(bikeTypes, id: \.self) { bike in
                        Text(bike)
                            .font(.system(size: 20, design: .serif))
                            .foregroundColor(.black)
                    }
                }
                .padding(.top, 20)
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)

                Slider(value: $rentalDuration, in: 0...24, step: 0.5) {
                    Text("Rental Duration (Hours)")
                        .foregroundColor(.white)
                }
                .padding(.bottom)
                .accentColor(.orange)
                Text("Duration: \(String(format: "%.1f", rentalDuration)) hours")
                    .font(.system(size: 20, design: .serif))
                    .foregroundColor(.black)
                Button(action: {
                    totalPrice = calculateRent(for: selectedBikeType, duration: rentalDuration)
                }) {
                    Text("Calculate Rent")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                Text("Total Price: \(totalPrice)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("Instructions:")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("""
                    ~ If the duration exceeds the expected time, additional charges will apply
                    ~ In case of damages, appropriate charges will apply.
                    """)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
                }
             //   .navigationBarBackButtonHidden(true) 
            }
        }
    }
    func calculateRent(for bikeType: String, duration: Double) -> String {
        let rate: Double
        switch bikeType {
        case "Regular":
            rate = 10.0
        case "Gear":
            rate = 15.0
        case "MTB Gear":
            rate = 20.0
        default:
            return "Invalid bike type."
        }
        let totalCost: Double
        if duration < 1 {
            totalCost = rate
        } else {
            totalCost = rate * duration
        }
        return "Rs \(String(format: "%.2f", totalCost))"
    }
}
#Preview {
    estimatedprice()
}
