//
//  WeatherButton.swift
//  WeatherUI
//
//  Created by Pravahan J. on 23/02/22.
//

import SwiftUI

struct buttonView : View {
    var mode : String
    var textColor : Color
    var backgroundColor : Color
    var body: some View {
        Text(mode)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size : 20, weight: .bold,  design: .default))
            .cornerRadius(10)
    }
}
