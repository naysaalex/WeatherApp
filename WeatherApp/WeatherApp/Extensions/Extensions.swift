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
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
