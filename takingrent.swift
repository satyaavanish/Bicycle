//
//  takingrent.swift
//  Bicycle
//
//  Created by DEEPAK on 28/09/24.
//
 

import SwiftUI
struct takingrent: View {
    @State private var rentalDays: Int = 1
    @State private var selectedBikeType: String = "Regular"
    @State private var totalPrice: String = ""
    @State private var isEmergencyReturn: Bool = false
    let bikeTypes = ["Regular", "Gear", "MTB Gear"]
    let rentalRates = [80, 120, 150]
    var body: some View {
            VStack {
                Text("🚴 Select a Bicycle")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Picker("Select Bicycle Type", selection: $selectedBikeType) {
                    ForEach(bikeTypes, id: \.self) { bike in
                        Text(bike)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)
                
                Stepper("Days to Rent: \(rentalDays)", value: $rentalDays, in: 1...30)
                    .padding()
                Button("Calculate Total Price") {
                    totalPrice = calculateRent(days: rentalDays, bikeType: selectedBikeType, isEmergency: isEmergencyReturn)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                Toggle("Emergency Return", isOn: $isEmergencyReturn)
                    .padding()
                
                Text("Total Price: \(totalPrice)")
                    .font(.headline)
                    .padding()
                
                Text("Instructions:")
                    .font(.headline)
                    .padding(.top)
                Text("""
            ~ Regular Cycle: ₹80 per day
            ~ Gear Cycle: ₹120 per day
            ~ MTB Gear: ₹150 per day
            ~ Emergency returns will cost 75 percent of the rental amount.
            ~ All rentals include a complimentary cleaning service upon return.
            """)
                .multilineTextAlignment(.leading)
                .padding()
                .foregroundColor(.gray)
                
                Spacer()
                
                // .navigationBarBackButtonHidden(true)
            }
        }
        func calculateRent(days: Int, bikeType: String, isEmergency: Bool) -> String {
            let dailyRate: Int
            
            switch bikeType {
            case "Regular":
                dailyRate = rentalRates[0]
            case "Gear":
                dailyRate = rentalRates[1]
            case "MTB Gear":
                dailyRate = rentalRates[2]
            default:
                dailyRate = 0
            }
            var totalCost = dailyRate * days
            
            if isEmergency {
                totalCost = totalCost*2 / 3
            }
            
            return "Rs \(totalCost)"
        }
    }

#Preview {
    takingrent()
}

