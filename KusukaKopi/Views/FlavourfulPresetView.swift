//
//  FlavourfulPresetView.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 17/11/22.
//

import SwiftUI

struct FlavourfulPresetView: View {
    
    @Binding var toAdjustVariable: Bool
    @Binding var coffeeDose: String
    @Binding var grindSize: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    @Binding var brewTemperature: String
    @Binding var coffeeToWaterRatio: Int
    @Binding var waterTotal: String
    @State var indexGrindSizeSelected = 4
    
    //@binding dari addRecipe
    @Binding var recipeName : String
    @Binding var beans : String
    @Binding var variety : String
    @Binding var region : String
    @Binding var altitude : String
    @Binding var showAddRecipe:Bool
    
    @State var showSheet = false
    @State var showBrewingVariables = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Flavourful Preset")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(Color.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top])
                    .padding(.top)
            }
            
            GroupBox{
                HStack{
                    Image(systemName: "scalemass")
                    Text("Coffee Dose")
                        .font(.headline)
                    Spacer()
                    Text("22 g")
                }
            }
            .groupBoxStyle(TransparentGroupBox())
            .padding([.leading, .trailing, .top])
            GroupBox{
                HStack{
                    Image(systemName: "gearshape")
                    Text("Grind Size")
                        .font(.headline)
                    Spacer()
                    Text("Medium")
                }
            }
            .groupBoxStyle(TransparentGroupBox())
            .padding([.leading, .trailing])
            GroupBox{
                HStack{
                    Image(systemName: "timer")
                    Text("Brewtime")
                        .font(.headline)
                    Spacer()
                    Text("2 Min 30 Sec")
                }
            }
            .groupBoxStyle(TransparentGroupBox())
            .padding([.leading, .trailing])
            GroupBox{
                HStack{
                    Image(systemName: "thermometer")
                    Text("Temperature")
                        .font(.headline)
                    Spacer()
                    Text("93.5")
                }
            }
            .groupBoxStyle(TransparentGroupBox())
            .padding([.leading, .trailing])
            GroupBox{
                HStack{
                    Image(systemName: "percent")
                    Text("Ratio")
                        .font(.headline)
                    Spacer()
                    Text("1 : 10")
                }
            }
            .groupBoxStyle(TransparentGroupBox())
            .padding([.leading, .trailing])
            GroupBox{
                HStack{
                    Image(systemName: "drop")
                    Text("Water")
                        .font(.headline)
                    Spacer()
                    Text("220 g")
                }
            }
            .groupBoxStyle(TransparentGroupBox())
            .padding([.leading, .trailing])
            Spacer()
            GroupBox{
                VStack{
                    Button("Select This Preset"){
                        toAdjustVariable = false
                        showSheet = false
                        coffeeDose = "22"
                        grindSize = 4
                        minutes = 2
                        seconds = 30
                        brewTemperature = "93.5"
                        coffeeToWaterRatio = 10
                        waterTotal = "220"
                        showBrewingVariables = true
                        print("masuk2")


                    }
//                    NavigationLink(destination: BrewingVariables(coffeeDose: $coffeeDose,toAdjustVariable: $toAdjustVariable, recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude), isActive: $showBrewingVariables){
//////
//                    }
                    NavigationLink(destination: BrewingVariables(coffeeDose: $coffeeDose, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, indexGrindSizeSelected: $indexGrindSizeSelected, waterTotal: $waterTotal, recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, showAddRecipe: $showAddRecipe), isActive: $showBrewingVariables){
////
                    }
                   
                }
                .padding(15)
            }
            .groupBoxStyle(DarkBrownGroupBox())
            
        }
    }
}

struct FlavourfulPresetView_Previews: PreviewProvider {
    static var previews: some View {
        FlavourfulPresetView(toAdjustVariable: .constant(true), coffeeDose: .constant(""), grindSize: .constant(0), minutes: .constant(0), seconds: .constant(0), brewTemperature: .constant(""), coffeeToWaterRatio: .constant(0), waterTotal: .constant(""), recipeName: .constant(""), beans: .constant(""), variety: .constant(""), region: .constant(""), altitude: .constant(""), showAddRecipe: .constant(true))
    }
}
