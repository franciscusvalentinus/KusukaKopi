//
//  AddRecipes.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 12/09/22.
//

import SwiftUI

struct AddRecipes: View {
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.dismiss) var dismiss
    
    @State private var showSelectPreset = false
    @Binding var showCards:Bool
    @Binding var showAddRecipe:Bool
    @FocusState var isTypeActive: Bool
    
    @State private var title2: String = "Add Recipe"
    
    @State private var recipeName = ""
    @State private var beans = ""
    @State private var variety = ""
    @State private var region = ""
    @State private var altitude = ""
    
    //    init(){
    //          UITableView.appearance().backgroundColor = .clear
    //      }
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            NavigationView{
                Form{
                    Section{
                        HStack{
                            Text("Recipe's Name")
                                .font(.headline)
                                .padding(.trailing)
                            TextField("Not Set", text: $recipeName)
                                .padding(.leading,50)
                                .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Text("Beans")
                                .font(.headline)
                                .padding(.trailing)
                            TextField("Not Set", text: $beans)
                                .padding(.leading,120)
                                .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Text("Variety")
                                .font(.headline)
                                .padding(.trailing)
                            TextField("Not Set", text: $variety)
                                .padding(.leading,112)
                                .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Text("Process")
                                .font(.headline)
                                .padding(.trailing)
                            TextField("Not Set", text: $region)
                                .padding(.leading,113)
                                .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Text("Altitude")
                                .font(.headline)
                                .padding(.trailing)
                            TextField("in mdpl / masl", text: $altitude)
                                .textContentType(.oneTimeCode)
                                .keyboardType(.numberPad)
                                .padding(.leading,105)
                                .multilineTextAlignment(.trailing)
                        }
                    }//Section
                   
                }//Form
                .onTapGesture {
                    isTypeActive = false
                }
                .background(Color.white)
                .foregroundColor(Color.primary)
                
                
                .navigationTitle(title2)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        HStack{
                    Button {
                        //                        //                        self.showBrewingVariableInfput = false
                        dismiss()
                        print("Cancel")
                        self.showAddRecipe = false
                    } label: {
                        Text("Cancel")
//                            .frame(width: 60, height: 60)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }, trailing:
                                        HStack{
                    Button{
                        showSelectPreset = true
                    } label: {
                        Text("Next")
                    }
                    .padding()
//                    NavigationLink(destination: SelectPresetView(toAdjustVariable: .constant(false), coffeeDose: .constant(""), grindSize: .constant(0), minutes: .constant(0), seconds: .constant(0), brewTemperature: .constant(""), coffeeToWaterRatio: .constant(10), waterTotal: .constant(0), recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude), isActive: $showSelectPreset) {
//
//                    }
                    NavigationLink(destination: SelectPresetView(showAddRecipe: $showAddRecipe, recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude), isActive: $showSelectPreset) {
                        
                    }
//                    Button{
//                        NavigationLink(destination: SelectPresetView(toAdjustVariable: .constant(false), coffeeDose: .constant(""), grindSize: .constant(0), minutes: .constant(0), seconds: .constant(0), brewTemperature: .constant(""), coffeeToWaterRatio: .constant(10), waterTotal: .constant(0), recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude)
//                            {
//
//                        } label:{
//
//                        }
//                    }
//                    Button {
//
////                        self.showSelectPreset = true
//                    } label: {
//                        Text("Next")
//
//                            .frame(width: 50, height: 50)
//                    }
//                    .sheet(isPresented: $showSelectPreset, onDismiss: {
//                        print(self.showSelectPreset)
//
//                    })
//
//                    {
//                        SelectPresetView(toAdjustVariable: .constant(false), coffeeDose: .constant(""), grindSize: .constant(0), minutes: .constant(0), seconds: .constant(0), brewTemperature: .constant(""), coffeeToWaterRatio: .constant(10), waterTotal: .constant(0), recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude)
//                            .interactiveDismissDisabled(true)
//                    }
                    
                    //
                })
                //                .navigationBarItems(
                //                    trailing: Button {
                //                        //                        self.showBrewingVariableInfput = false
                //                        print("ter")
                //                        self.showBrewingVariableInput = true
                //                    } label: {
                //                        Text("Next")
                //                            .frame(width: 50, height: 50)
                //                    }
                //                    //                        .buttonStyle(.plain)
                //                )
                //                .toolbar{
                //
                //                    Button {
                ////                        self.showBrewingVariableInfput = false
                //                        self.showBrewingVariableInfput = true
                //                    } label: {
                //                        Text("Next")
                //                    }
                //
                //
                
                //                .sheet(isPresented: $showBrewingVariableInput, onDismiss: {
                //                    print(self.showBrewingVariableInput)
                //
                //                }){
                //                    BrewingVariablesInput(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude)
                //                }
                
            }//NavigationView
          
            .accentColor(Color("buttonBGColor"))
//            .foregroundColor(Color("buttonBGColor"))
        }
            
            
        }//Zstack
    }


struct AddRecipes_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipes(showCards: .constant(true), showAddRecipe: .constant(true))
    }
}
