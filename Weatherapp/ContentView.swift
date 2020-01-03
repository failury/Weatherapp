//
//  ContentView.swift
//  Weatherapp
//
//  Created by failury on 1/2/20.
//  Copyright © 2020 failury. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    var body: some View {
        VStack(alignment: .center){
            TextField("Enter the name of the City", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }.font(.largeTitle)
                .padding()
                .fixedSize()
            Text(self.weatherVM.tempreature)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.blue)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
