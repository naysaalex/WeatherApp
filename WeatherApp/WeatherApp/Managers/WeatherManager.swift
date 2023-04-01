//
//  WeatherManager.swift
//  WeatherSampleApp
//
//  Created by naysa alex
//

import Foundation
import CoreLocation

class WeatherManager {
    //Request weather to Open Weather using async/await
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(30.6280)&lon=\(-96.3344)&appid=\("70c5cbf24e779dcbeb41d4df5549e252")&units=imperial") else {
            fatalError("Missing URL")
            //creates api url using latitude and longitude and api key and prints error message if url can't be created
        }
        //url request using openweather api url
        let urlRequest = URLRequest(url: url)
        
        //uses urlsession to fetch weather data
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        //checks is response status code is ok and if not, prints error
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        //decodes JSON weather data
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

//contains weather data from api
struct ResponseBody: Decodable {
    //properties
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

//defines extensions to responsebody structs to provide more convenient property names
extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
