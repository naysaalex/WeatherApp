//
//  WelcomeView.swift
//  WeatherSampleApp
//
//  Created by naysa alex
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    // MARK: - Properties
    @EnvironmentObject var locationManager: LocationManager
    
    // MARK: - Body
    var body: some View {
        VStack {
            VStack {
                Text("Weather App")
                    .bold().font(.title)
                
                Text("Please share your current location to get the weather in your area")
                    .padding()
                
            } // VStack
            .multilineTextAlignment(.center)
            .padding()
            
            //second subview is a button that calls the requestLocation() method on the locationManager object when tapped
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        } // VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity) //view takes up all the available space
        
    }
}

// MARK: - Preview
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
