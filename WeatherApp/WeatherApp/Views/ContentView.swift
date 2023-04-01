//
//  ContentView.swift
//  WeatherSampleApp
//
//  Created by naysa alex
//
// MARK: Weather
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    @StateObject var locationManager = LocationManager() //creates a LocationManager instance that is owned by this view
    var weatherManager = WeatherManager() //weatherManager instance
    @State var weather: ResponseBody? //creates weather property that can be modified by this view
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            //check for location first
            if let location = locationManager.location {
                if let weather = weather {
                    //show weather view if you have weather data for location
                    WeatherView(weather: weather)
                } else {
                    //if weather data is not available, loading view
                    LoadingView()
                        .task {
                            do {
                                weather = try await
                                weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                //welcomeView if the location isn't available
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        } // VStack
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

