//
//  ContentView.swift
//  VolumeConversion
//
//  Created by Sandra Quel on 1/24/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var enterValue  = ""
    
    let units = ["mL","L","cup","pint", "gal"]
    let u : [UnitVolume] = [.milliliters, .liters, .cups, .pints , .gallons]
    
    var conversionFrom: Measurement<UnitVolume>{
        func convertFrom(unit: UnitVolume) -> Measurement<UnitVolume> {
            let conversion = Measurement(value: Double(enterValue) ?? 0, unit: unit)
            return conversion
        }
        
        switch inputUnit {
        case 0 :
            let convertedToMil = convertFrom(unit: u[0])
            return convertedToMil
        case 1 :
            let convertedToL = convertFrom(unit: u[1])
            return convertedToL
        case 2 :
            let convertedToCups = convertFrom(unit: u[2])
            return convertedToCups
        case 3 :
            let convertedToPints = convertFrom(unit: u[3])
            return convertedToPints
        case 4 :
            let convertedToGal = convertFrom(unit: u[4])
            return convertedToGal
        default:
            let convertedToMil = convertFrom(unit: u[0])
            return convertedToMil
        }
    }
    
    var conversionTo: Measurement<UnitVolume> {
        let conversionUnit = conversionFrom
        func convertTo(unit: UnitVolume) -> Measurement<UnitVolume> {
            let conversion = conversionUnit.converted(to: unit)
            return conversion
        }
        
        switch outputUnit {
        case 0 :
            let convertedToMil = convertTo(unit: u[0])
            return convertedToMil
        case 1 :
            let convertedToL = convertTo(unit: u[1])
            return convertedToL
        case 2 :
            let convertedToCups = convertTo(unit: u[2])
            return convertedToCups
        case 3 :
            let convertedToPints = convertTo(unit: u[3])
            return convertedToPints
        case 4 :
            let convertedToGal = convertTo(unit: u[4])
            return convertedToGal
        default:
            let convertedToMil = convertTo(unit: u[0])
            return convertedToMil
        }
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert From")) {
                    TextField("Enter a Value", text: $enterValue).keyboardType(.numberPad)
                    Picker("unit", selection: $inputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                            
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert To")) {
                    Picker("unit", selection: $outputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("\(conversionTo.description)")
                }
            }
            .navigationBarTitle("Volume Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
