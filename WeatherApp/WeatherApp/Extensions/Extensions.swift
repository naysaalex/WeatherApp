//
//  Extensions.swift
//  WeatherSampleApp
//
//  Created by naysa alex
//


import Foundation
import SwiftUI

extension Double {
    //will format whatever string is called with this method
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension View {
    //will format any view called with this format -> to appear rounded using the RoundedCorner struct
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    //called by cornerRadius
    var radius: CGFloat = .infinity //specifies the radius of the rounded corners
    var corners: UIRectCorner = .allCorners //specifies which corners of the rectangle should be rounded
    
    func path(in rect: CGRect) -> Path {
        //creates a UIBezierPath object with rounded corners
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath) //returns the object
    }
}
