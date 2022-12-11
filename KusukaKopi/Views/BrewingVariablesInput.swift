//
//  File.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 30/08/22.
//

import Foundation
import SwiftUI
import CoreData


//struct BrewingVariablesInput: View {
//    // Core Data
//    @Environment(\.managedObjectContext) var managedObjectContext
//    @Environment(\.dismiss) var dismiss
//
//    @State private var showSimulationSwipeView = false
//
////    init() {
////           //Use this if NavigationBarTitle is with Large Font
////        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("fontColor"))]
////        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 34, weight: .heavy)]
////
////           //Use this if NavigationBarTitle is with displayMode = .inline
////           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(Color("fontColor"))]
////    }
//
//// coffee variables function
//    @State var isShowingGrindSizePicker = false
//    @State var isShowingRatioPicker = false
//    @State var isShowingBrewtimePicker = false
//    @FocusState var isInputActive: Bool
//    @State var coffeeDose: String = ""
//    @State var grindSize = [ "Not Set", "Extra Fine", "Fine", "Medium to Fine", "Medium", "Medium to Coarse", "Coarse"]
//    @State var minutes: Int = 0
//    @State var seconds: Int = 0
//    @State var brewTemperature: String = ""
//    @State var coffeeToWaterRatio: Int = 10
//    @State var indexGrindSizeSelected = 0
//
//    //@binding dari addRecipe
//    @Binding var recipeName : String
//    @Binding var beans : String
//    @Binding var variety : String
//    @Binding var region : String
//    @Binding var altitude : String
//
//
//
//    var brewingWater: Int{
//        let doseTotal = Int (coffeeDose) ?? 0
//        let ratioTotal = coffeeToWaterRatio
//        let waterTotal = doseTotal*ratioTotal
//
//        return waterTotal
//    }
//    @State var waterTotal: Int = 0
//    @State private var isPassingValue = false
//    @State var toAdjustVariable = false
//
//    var body: some View {
//        //NavigationView{
//            ZStack{
//                    VStack{
////                        Text("Make Your \n V60 Recipe")
////                            .font(.system(size: 34, weight: .heavy))
////                            .foregroundColor(Color("fontColor"))
////                            .frame(maxWidth: .infinity, alignment: .leading)
////                            .padding([.leading])
//                        GroupBox{
//                            HStack{
//                                Image("dose")
//                                Text("Coffee Dose")
//                                    .font(.headline)
//                                Spacer()
//                                HStack{
//                                    Spacer()
//                                    TextField("0", text:$coffeeDose)
//                                        .multilineTextAlignment(.trailing)
//                                        .focused($isInputActive)
//                                      .keyboardType(.numberPad)
//                                      .toolbar{
//                                          ToolbarItemGroup(placement: .keyboard){
////                                              HStack{
////                                                  Button("Cancel", role: .cancel){
////                                                      isInputActive = false
////                                                  }
////                                                  Spacer()
////                                                  Button("Done"){
////                                                      isInputActive = false
////                                                  }
////
////                                              }
//                                          }
//                                      }
//                                    Text("gr")
//                                }
//                                .foregroundColor(Color("buttonBGColor"))
//                            }
//                        }
//                        .groupBoxStyle(TransparentGroupBox())
//                        .padding([.leading, .trailing, .top])
//                        GroupBox{
//                            HStack{
//                                Image("grindSize")
//                                Text("Grind Size")
//                                    .font(.headline)
//                                Spacer()
////                                Button(action: {
////                                    self.isShowingGrindSizePicker.toggle()
////                                }){
////                                    Text("\(self.grindSize[indexGrindSizeSelected]) ")
////                                    Image(systemName: "chevron.right")
////                                }
////                                .foregroundColor(Color("buttonBGColor"))
//                            }
//                        }
//                        .groupBoxStyle(TransparentGroupBox())
//                        .padding([.leading, .trailing])
//                        GroupBox{
//                            HStack{
//                                Image("brewTime")
//                                Text("Brewtime")
//                                    .font(.headline)
//                                Spacer()
////                                Button(action: {
////                                    self.isShowingBrewtimePicker.toggle()
////                                }){
////                                    Text("\(self.minutes) Min \(self.seconds) Sec")
////                                    Image(systemName: "chevron.right")
////                                }
////                                .foregroundColor(Color("buttonBGColor"))
//                               /* HStack {
//                                    Picker("", selection: $minutes){
//                                        ForEach(0..<60, id: \.self) { i in
//                                            Text("\(i) Minutes").tag(i)
//                                            }
//                                        }.pickerStyle(WheelPickerStyle())
//                                    Picker("", selection: $seconds){
//                                        ForEach(0..<60, id: \.self) { i in
//                                            Text("\(i) Seconds").tag(i)
//                                            }
//                                        }.pickerStyle(WheelPickerStyle())
//                                }.padding(.horizontal)*/
//                            }
//                        }
//                        .groupBoxStyle(TransparentGroupBox())
//                        .padding([.leading, .trailing])
//                        GroupBox{
//                            HStack{
//                                Image("temp")
//                                Text("Temperature")
//                                    .font(.headline)
//                                Spacer()
//                                HStack{
//                                    Spacer()
//                                    TextField("0", text:$brewTemperature)
//                                        .multilineTextAlignment(.trailing)
//                                        .focused($isInputActive)
//                                      .keyboardType(.numberPad)
//                                    Text("°C")
//                                }
//                                .foregroundColor(Color("buttonBGColor"))
//
//    //                            Picker(
//    //                                selection: $brewTemperature, label: Text("Brewing Temperature"), content: {
//    //                                ForEach(50..<101){ number in
//    //                                    Text("\(number)")
//    //                                        .font(.headline)
//    //                                        .tag("\(number)")
//    //                                }
//    //                            })
//    //                            .pickerStyle(WheelPickerStyle())
//
//
//                            }
//                        }
//                        .groupBoxStyle(TransparentGroupBox())
//                        .padding([.leading, .trailing])
//                        GroupBox{
//                            HStack{
//                                Image("ratio")
//                                Text("Ratio")
//                                    .font(.headline)
//                                Spacer()
//                                Button(action: {
//                                    self.isShowingRatioPicker.toggle()
//                                }){
//                                    Text("1 : \(self.coffeeToWaterRatio)")
//                                    Image(systemName: "chevron.right")
//                                }
//                                .foregroundColor(Color("buttonBGColor"))
//                            }
//                        }
//                        .groupBoxStyle(TransparentGroupBox())
//                        .padding([.leading, .trailing])
//                       GroupBox{
//                            HStack{
//                                Image("water")
//                                Text("Water")
//                                    .font(.headline)
//                                Spacer()
//                                Text("\(brewingWater) gr")
//                                    .foregroundColor(Color("buttonBGColor"))
//                            }
//                        }
//                        .groupBoxStyle(TransparentGroupBox())
//                        .padding([.leading, .trailing])
//                        HStack{
//                            VStack(alignment: .leading){
//                                Text("Feel lost to build your recipe?")
//                                    .font(.footnote)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//
//                                Text("You can try our preset")
//                                    .font(.footnote)
//                            }
//                            GroupBox{
//                                Button{
//                                    toAdjustVariable = true
//                                } label: {
//                                    Text("Select Preset")
//                                }
//                                .padding()
//                                NavigationLink(destination: SelectPresetView(toAdjustVariable: $toAdjustVariable, coffeeDose: $coffeeDose, grindSize: $indexGrindSizeSelected, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, waterTotal: $waterTotal), isActive: $toAdjustVariable) {
//
//                                }
//                            }
//                            .groupBoxStyle(DarkBrownGroupBox())
//                        }
//                        .padding([.leading, .trailing])
//                        Spacer()
//                        GroupBox{
//                            VStack{
//
//                                NavigationLink(destination: SimulationSwipeView(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, coffeeDose: $coffeeDose, grindSize: $grindSize[indexGrindSizeSelected], minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $ratio, brewingWater: $waterTotal), isActive: $isPassingValue){
//                                }
//
//                                Button("Start Brewing Simulation"){
//                                    isPassingValue = true
//                                    waterTotal = brewingWater
//                                    self.showSimulationSwipeView = true
//
//                                }
//                                .sheet(isPresented: $showSimulationSwipeView, onDismiss: {
//                                    print(self.showSimulationSwipeView)
//
//                                    //                                        .presentationDetents([.medium])
//                                })
//
//                                {
//                                    SimulationSwipeView(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, coffeeDose: $coffeeDose, grindSize: $grindSize[indexGrindSizeSelected], minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, brewingWater: $waterTotal)
//                                }
//                            }
//
//                            .padding(15)
//                        }
//                        .groupBoxStyle(DarkBrownGroupBox())
//                    }
//                //VStack {
//                GrindSizePicker(selectedGrindSize: self.$indexGrindSizeSelected, isShowingGrindSize: self.$isShowingGrindSizePicker, grindSizeSelection: self.$grindSize)
//                    .animation(.linear)
//                    .offset(y: self.isShowingGrindSizePicker ? 0 : UIScreen.main.bounds.height)
//                BrewtimePicker(minuteSelection: self.$minutes, secondSelection: self.$seconds, isShowingBrewtime: self.$isShowingBrewtimePicker)
//                    .animation(.linear)
//                    .offset(y: self.isShowingBrewtimePicker ? 0 : UIScreen.main.bounds.height)
//                RatioPicker(selection: self.$coffeeToWaterRatio, isShowing: self.$isShowingRatioPicker)
//                    .animation(.linear)
//                    .offset(y: self.isShowingRatioPicker ? 0 : UIScreen.main.bounds.height)
//                   // .background(.white)
//                //}.background(.white)
//
//            }
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarHidden(true)
//                .onTapGesture {
//                    isInputActive = false
//                }
////                .navigationTitle("Make Your V60 Recipe")
//           // }
//        }
//}


//struct BrewingVariablesInput_Previews: PreviewProvider {
//    static var previews: some View {
//        BrewingVariablesInput(recipeName: .constant(""), beans: .constant(""), variety: .constant(""), region: .constant(""), altitude: .constant(""))
////        BrewingVariablesInput(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude)
//    }
//}
