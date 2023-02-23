//
//  ContentView.swift
//  UnitConverter
//
//  Created by Jay Bhensdadia on 23/02/23.
//

import SwiftUI

struct ContentView: View {
    
    let units = ["Kilometer","Meter","Feet","Yard","Mile"]
    
    @State private var selectedInputUint = "Kilometer"
    @State private var selectedOutputUnit = "Meter"
    
    @State private var inputData = 0.0
    
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                   
                    Picker("input unit", selection: $selectedInputUint){
                        ForEach(units,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Enter Data", value: $inputData, format: .number).keyboardType(.decimalPad)
                    
                   
                }header: {
                    Text("Input Unit")
                }
                
                Section{
                    
                    let outputData = inputData * ContentView.getMultiplier(inputUnit: selectedInputUint, outputUnit: selectedOutputUnit)
                    
                    Picker("output unit", selection: $selectedOutputUnit){
                        ForEach(units,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(outputData,format:.number)
                    
                    
                }header: {
                    Text("Output Unit")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
    
    private static func getMultiplier(inputUnit: String, outputUnit: String) -> Double{
        
        if(inputUnit==outputUnit){
            return 1
        }
        
        //kilometer
        else if(inputUnit=="Kilometer" && outputUnit=="Meter"){
            return 1000;
        }else if(inputUnit=="Kilometer" && outputUnit=="Feet"){
            return 3280.84;
        }else if(inputUnit=="Kilometer" && outputUnit=="Yard"){
            return 1093.61;
        }else if(inputUnit=="Kilometer" && outputUnit=="Mile"){
            return 0.621371;
        }
        
        //meter
        else if(inputUnit=="Meter" && outputUnit=="Kilometer"){
            return 0.001;
        }else if(inputUnit=="Meter" && outputUnit=="Feet"){
            return 3.28084;
        }else if(inputUnit=="Meter" && outputUnit=="Yard"){
            return 1.09361;
        }else if(inputUnit=="Meter" && outputUnit=="Mile"){
            return 0.000621371;
        }
        
        //feet
        else if(inputUnit=="Feet" && outputUnit=="Kilometer"){
            return 0.0003048;
        }else if(inputUnit=="Feet" && outputUnit=="Meter"){
            return 0.3048;
        }else if(inputUnit=="Feet" && outputUnit=="Yard"){
            return 0.333333;
        }else if(inputUnit=="Feet" && outputUnit=="Mile"){
            return 0.000189394;
        }
        
        //yard
        else if(inputUnit=="Yard" && outputUnit=="Kilometer"){
            return 0.0009144;
        }else if(inputUnit=="Yard" && outputUnit=="Meter"){
            return 0.9144;
        }else if(inputUnit=="Yard" && outputUnit=="Feet"){
            return 3;
        }else if(inputUnit=="Yard" && outputUnit=="Mile"){
            return 0.000568182;
        }
        
        //mile
        else if(inputUnit=="Mile" && outputUnit=="Kilometer"){
            return 1.60934;
        }else if(inputUnit=="Mile" && outputUnit=="Meter"){
            return 1609.34;
        }else if(inputUnit=="Mile" && outputUnit=="Feet"){
            return 5280;
        }else if(inputUnit=="Mile" && outputUnit=="Yard"){
            return 1760;
        }
        
        return 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
