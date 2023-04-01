//
//  ModelData.swift
//  WeatherSampleApp
//
//  Created by naysa alex on 01/22.
//


import Foundation

//holds preview weather data
var previewWeather: ResponseBody = load("weatherData.json")

//loads JSON file and decodes it into an object type T
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data //variable to hold file data

    //file with specified name in main bundle
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    //loads file data from URL
    do {
        data = try Data(contentsOf: file)
    } catch {
        //an error will appear if there is an error loading the file data
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    //tries to decode the file data into object type T
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        //if there's an error decoding the file data, error is reported
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
