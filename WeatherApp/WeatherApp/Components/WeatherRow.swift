//
//  WeatherRow.swift
//  WeatherSampleApp
//
//  Created by naysa alex.
//


import SwiftUI

struct WeatherRow: View {
    // creating the variables
    var logo: String
    var name: String
    var value: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            //pulls the right picture with the appropriate attributes
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.808))
                .cornerRadius(50)
            
            VStack {
                //prints the right intro phrase
                Text(name)
                    .font(.caption)
                
                //prints the appropriate value
                Text(value)
                    .bold()
                    .font(.title)
            } // VStack
        } // HStack
    }
}

// MARK: - Preview
struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        //sends the values for the class to print on the screen
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8")
    }
}
