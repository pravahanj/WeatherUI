//
//  ContentView.swift
//  WeatherUI
//
//  Created by Pravahan J. on 23/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            backgroundView(isNight: $isNight)
            
            VStack {
                cityTextView(name: "Delhi")
                
                weatherView(weather: "cloud.sun.fill", temp: 24)
                
                HStack(spacing : 20) {
                    dayView(dayOfWeek: "TUE",
                            imageName: "sun.max.fill",
                            temp: 27)
                    
                    dayView(dayOfWeek: "WED",
                            imageName: "wind",
                            temp: 23)
                    
                    dayView(dayOfWeek: "THU",
                            imageName: "cloud.sun.fill",
                            temp: 25)
                    
                    dayView(dayOfWeek: "FRI",
                            imageName: "cloud.fill",
                            temp: 23)
                    
                    dayView(dayOfWeek: "SAT",
                            imageName: "cloud.rain.fill",
                            temp: 22)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label : {
                    buttonView(mode: isNight ? "Light" : "Dark",
                               textColor: .blue,
                               backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct dayView: View {
    var dayOfWeek : String
    var imageName : String
    var temp : Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct backgroundView: View {
    @Binding var isNight : Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,                         
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct cityTextView : View {
    var name : String
    var body: some View {
        Text(name)
          .font(.system(size: 32, weight: .medium, design: .default))
          .foregroundColor(.white)
          .padding()

    }
}

struct weatherView : View {
    var weather : String
    var temp : Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: weather)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

