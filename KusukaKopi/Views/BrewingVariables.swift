//
//  BrewingVariables.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 09/11/22.
//

import Foundation
import SwiftUI
import CoreData


struct BrewingVariables: View {
    
    
    // Core Data
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State private var showSimulationSwipeView = false
    
//    init() {
//           //Use this if NavigationBarTitle is with Large Font
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("fontColor"))]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 34, weight: .heavy)]
//
//           //Use this if NavigationBarTitle is with displayMode = .inline
//           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(Color("fontColor"))]
//    }

// coffee variables function
    @State var isShowingGrindSizePicker = false
    @State var isShowingRatioPicker = false
    @State var isShowingBrewtimePicker = false
    
    @FocusState var isInputActive: Bool
    @Binding var coffeeDose: String
    @State var grindSize = [ "Not Set", "Extra Fine", "Fine", "Medium to Fine", "Medium", "Medium to Coarse", "Coarse"]
    @Binding var minutes: Int
    @Binding var seconds: Int
    @Binding var brewTemperature: String 
    @Binding var coffeeToWaterRatio: Int
    @Binding var indexGrindSizeSelected: Int
    @Binding var waterTotal: String
    @State private var isPassingValue = false
//    @State var toAdjustVariable = false
    
    //@binding dari addRecipe
    @Binding var recipeName : String
    @Binding var beans : String
    @Binding var variety : String
    @Binding var region : String
    @Binding var altitude : String
    @Binding var showAddRecipe:Bool
    
    //func hitung ratio
    var coffeeToWaterRatioVariable: Double{
        let doseTotal = Double (coffeeDose) ?? 0
        let waterTotal = Double (waterTotal) ?? 0
        let ratioTotal = waterTotal/doseTotal
        
        return ratioTotal
    }
    @State var ratioTotal: Double = 0
    
    
    var body: some View {
        ZStack{
            VStack{
                Form{
                    Section{
                        HStack{
                            Image(systemName: "scalemass")
                            Text("Dose")
                                .font(.headline)
                                .padding(.trailing)
                            HStack{
                                TextField("0", text: $coffeeDose)
                                    .textContentType(.oneTimeCode)
                                    .keyboardType(.numberPad)
                                Text("Gr")
                                
                            }
                            .padding(.leading, 50)
                            .multilineTextAlignment(.trailing)
                            
                        }
                        HStack{
                            Image(systemName: "gearshape")
                            Text("Grind Size")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            Button(action: {
                                self.isShowingGrindSizePicker.toggle()
                            }){
                                HStack{
                                    Text("\(self.grindSize[indexGrindSizeSelected]) ")
                                }
                                //                                    .foregroundColor(.secondary)
                                
                            }
                            .buttonStyle(.plain)
                            .padding(.leading, 50)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color("buttonBGColor"))
                        }
                        HStack{
                            Image(systemName: "timer")
                            Text("Brewtime")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            Button(action: {
                                self.isShowingBrewtimePicker.toggle()
                            }){
                                Text("\(self.minutes) Min \(self.seconds) Sec")
                            }
                            .buttonStyle(.plain)
                            .padding(.leading, 50)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color("buttonBGColor"))
                        }
                        HStack{
                            Image(systemName: "thermometer")
                            Text("Temperature")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            HStack{
                                TextField("0", text: $brewTemperature)
                                    .textContentType(.oneTimeCode)
                                    .focused($isInputActive)
                                    .keyboardType(.numberPad)
                                
                                Text("°C")
                            }
                            .padding(.leading, 50)
                            .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Image(systemName: "drop")
                            Text("Water")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            HStack{
                                TextField("0", text: $waterTotal)
                                    .textContentType(.oneTimeCode)
                                    .keyboardType(.numberPad)
                                Text("Gr")
                            }
                            .padding(.leading,50)
                            .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Image(systemName: "percent")
                            Text("Ratio")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            Text("1 : \(ratioTotal, specifier: "%.2f")")
                        }
                    }
                    
                }
                
                
                NavigationLink(destination: SimulationSwipeView(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, coffeeDose: $coffeeDose, grindSize: $grindSize[indexGrindSizeSelected], minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $ratioTotal, brewingWater: $waterTotal, showAddRecipe: $showAddRecipe)){
                    Text("Start Brewing")
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 50)
                        .background(Color("buttonBGColor"))
                        .cornerRadius(10)
                    
                }
                
                
                
                
            }
            .background(Color(UIColor.systemGray6))
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                isInputActive = false
            }
            .navigationTitle("Make Your V60 Recipe")
            
            GrindSizePicker(selectedGrindSize: self.$indexGrindSizeSelected, isShowingGrindSize: self.$isShowingGrindSizePicker, grindSizeSelection: self.$grindSize)
                .animation(.linear)
                .offset(y: self.isShowingGrindSizePicker ? 0 : UIScreen.main.bounds.height)
            BrewtimePicker(minuteSelection: self.$minutes, secondSelection: self.$seconds, isShowingBrewtime: self.$isShowingBrewtimePicker)
                .animation(.linear)
                .offset(y: self.isShowingBrewtimePicker ? 0 : UIScreen.main.bounds.height)
            RatioPicker(selection: self.$coffeeToWaterRatio, isShowing: self.$isShowingRatioPicker)
                .animation(.linear)
                .offset(y: self.isShowingRatioPicker ? 0 : UIScreen.main.bounds.height)
        }
        }
        
    }
struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray).opacity(0.2))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}

struct DarkBrownGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .background(RoundedRectangle(cornerRadius: 8).fill(Color("buttonBGColor")))
            .foregroundColor(Color("variableColor"))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}

struct BrewtimePicker: View {
    @Binding var minuteSelection: Int
    @Binding var secondSelection: Int
    @Binding var isShowingBrewtime: Bool
    @FocusState var isInputActive: Bool
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                Button(action: {
                    self.isShowingBrewtime = false
                }){
                    HStack{
                        Spacer()
                        Text("Done")
                            .padding(16)
                    }
                }
                 HStack {
                     Picker("", selection: $minuteSelection){
                         ForEach(0...60, id: \.self) { i in
                             Text("\(i) Minutes").tag(i)
                             }
                         }
                     .pickerStyle(WheelPickerStyle())
                     .frame(width: 150)
                     Picker("", selection: $secondSelection){
                         ForEach(0...60, id: \.self) { i in
                             Text("\(i) Seconds").tag(i)
                             }
                         }
                     .pickerStyle(WheelPickerStyle())
                     .frame(width: 150)
                 }.padding(.horizontal)
                
                .pickerStyle(.inline)
                .frame(width: 200)
                .labelsHidden()

            }.background(Color(.systemGray4))
                .onTapGesture {
                    isInputActive = false
                }
        }
    }
}

struct RatioPicker: View {
    @Binding var selection: Int
    @Binding var isShowing: Bool
    @FocusState var isInputActive: Bool
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                Button(action: {
                    self.isShowing = false
                }){
                    HStack{
                        Spacer()
                        Text("Done")
                            .padding()
                    }
                }
                Picker(selection: $selection, label: Text("")){
                    ForEach((10..<41), id: \.self){ number in
                        Text("1 : \(number)")
                            .font(.headline)
                            .tag("\(number)")
                    }
                }
                .pickerStyle(.inline)
                .frame(width: 200)
                .labelsHidden()

            }.background(Color(.systemGray4))
                .onTapGesture {
                    isInputActive = false
                }
        }
    }
}

struct GrindSizePicker: View{
    @Binding var selectedGrindSize: Int
    @Binding var isShowingGrindSize: Bool
    @Binding var grindSizeSelection: [String]
    @FocusState var isInputActive: Bool
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                Button(action: {
                    self.isShowingGrindSize = false
                }){
                    HStack{
                        Spacer()
                        Text("Done")
                            .padding()
                    }
                }
                Picker(selection: $selectedGrindSize, label: Text("")){
                    ForEach(grindSizeSelection.indices){ grind in
                        Text(grindSizeSelection[grind])
                    }
                }
                .pickerStyle(.inline)
                .frame(width: 200)
                .labelsHidden()

            }.background(Color(.systemGray4))
                .onTapGesture {
                    isInputActive = false
                }
        }
        
    }
}


struct BrewingVariables_Previews: PreviewProvider {
    static var previews: some View {
        BrewingVariables(coffeeDose: .constant(""), minutes: .constant(0), seconds: .constant(0), brewTemperature: .constant(""), coffeeToWaterRatio: .constant(0), indexGrindSizeSelected: .constant(0), waterTotal: .constant(""), recipeName: .constant(""), beans: .constant(""), variety: .constant(""), region: .constant(""), altitude: .constant(""), showAddRecipe: .constant(true))
//        BrewingVariables(recipeName: .constant(""), beans: .constant(""), variety: .constant(""), region: .constant(""), altitude: .constant(""))

    }
}

