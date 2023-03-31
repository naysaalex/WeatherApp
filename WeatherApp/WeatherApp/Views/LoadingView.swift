//
//  LoadingView.swift
//  WeatherSampleApp
//
//  Created by naysa alex
//

import SwiftUI

struct LoadingView: View {
    
    // MARK: - Body
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
