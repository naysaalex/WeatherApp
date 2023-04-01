//
//  WeatherView.swift
//  WeatherSampleApp
//
//  Created by naysa alex
//

import SwiftUI

struct WeatherView: View {
    // MARK: - Properties
    var weather: ResponseBody //weather data to display
    
    // MARK: - Body
    var body: some View {
        
        ZStack(alignment: .leading) {
            // MARK: - City and date
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    //app title
                    Text("Weather App")
                        .bold()
                        .font(.title3)
                        .padding(.bottom, 6)
                    
                    //city name
                    Text(weather.name)
                        .bold()
                        .font(.headline)
                    
                    //current date
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                        .font(.subheadline)
                } // VSTack
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                // MARK: - Temperature
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            //weather icon
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            //weather description
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        //temperature
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    } // HStack
                    
                    Spacer()
                        .frame(height: 80)
                    
                    //background image
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                } // VStack
                .frame(maxWidth: .infinity)
            } // VStack
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: - Weather details
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                //weather details title
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        //minimum temp
                        WeatherRow(logo: "thermometer", name: "Min temp", value:
                                    (weather.main.tempMin
                                    .roundDouble() + "°"))
                        Spacer()
                        //maximum temp
                        WeatherRow(logo: "thermometer", name: "Max temp", value:
                                    (weather.main.tempMax
                                    .roundDouble() + "°"))
                    } // HStack
                    
                    HStack {
                        //wind speed
                        WeatherRow(logo: "wind", name: "Wind speed", value:
                                    (weather.wind.speed
                                    .roundDouble() + "m/s"))
                        Spacer()
                        //humidity
                        WeatherRow(logo: "humidity", name: "Humidity", value:
                                    (weather.main.humidity
                                    .roundDouble() + "%"))
                    } // HStack
                    
                } // VStack
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            } // VStack
        } // ZStack
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

// MARK: - Preview
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
