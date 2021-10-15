//
//  ContentView.swift
//  UserInputControlsSwiftUI
//
//  Created by Akash on 15/10/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            toggle
            sliderControl
            stepperControl
            pickerControl
        }
    }
    
    
    // Switch Toggle
    @State private var showFavorites = true
    var toggle: some View {
        VStack {
            Toggle(isOn: $showFavorites) {
                Text("Show Favorites").bold()
            }.padding()
                .background(showFavorites ? Color.yellow : Color.gray)
        }
    }
    
    
    @State var sliderTemp = 23.0
    var minimumTemp = 20.0
    var maximumTemp = 38.0
    var sliderControl: some View {
        VStack {
            HStack {
                Text("\(Int(minimumTemp)) °C")
                Slider(value: $sliderTemp,
                       in: minimumTemp...maximumTemp)
                Text("\(Int(maximumTemp)) °C")
            }.padding()
            Text(
                "Temperature Selected: \(Int(sliderTemp)) °C")
        }
    }
    
    
    @State private var qty = 1
    @State private var minimumItems = 0
    @State private var maximumItems = 10
    
    var stepperControl: some View {
        Stepper(value: $qty, in: minimumItems...maximumItems,
                label: {
            Text("Qty: \(qty)")
        }).padding()
    }
    
    
    var typesOfCoffee = ["Caffè Americano", "Caffè Latte", "Cappuccino",
                         "Espresso", "Flat White", "Long Black",
                         "Macchiato", "Mochaccino", "Irish Coffee",
                         "Vienna", "Affogato","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee","Irish Coffee"]
    @State private var selectedCoffee = 0
    var pickerControl: some View {
        VStack{
            Picker(selection: $selectedCoffee,
                   label: Text("Types of Coffee").bold()) {
                ForEach(0 ..< typesOfCoffee.count){
                    Text(self.typesOfCoffee[$0]).tag($0)
                }
            }
                   .padding()
            Text("Coffee selected: \(typesOfCoffee[selectedCoffee])")
            
            
            Picker(selection: $selectedCoffee,
                            label: Text("Types of Coffee").bold()) {
                            ForEach(0 ..< typesOfCoffee.count){
                                Text(self.typesOfCoffee[$0]).tag($0)
                            }
                        }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
