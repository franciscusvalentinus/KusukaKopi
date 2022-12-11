//
//  BrewingResultReview.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 08/09/22.
//

import Foundation
import SwiftUI

struct BrewingResultReview: View{
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    //@binding dari addRecipe & adjust variable
    @Binding var recipeName : String
    @Binding var beans : String
    @Binding var variety : String
    @Binding var region : String
    @Binding var altitude : String
    @Binding var coffeeDose: String
    @Binding var grindSize: String
    @Binding var minutes: Int
    @Binding var seconds: Int
    @Binding var brewTemperature: String
    @Binding var coffeeToWaterRatio: Double
    @Binding var brewingWater: String
    
    @State private var toMainMenu = false
    
    @State var brewingExperienceReview: String = ""
    @State var recipeTasteReview: String = ""
    @FocusState var isInputActive: Bool
    @State var isOpenNext = false
    
//    init() {
//        UITextView.appearance().backgroundColor = .clear
//    }
    
    var body: some View{
        //NavigationView{
        VStack{
            //                Text("Review")
            //                    .font(.system(size: 17))
            //                    .foregroundColor(Color("fontColor"))
            //                    .frame(maxWidth: .infinity, alignment: .center)
            //                    .padding([.leading])
            VStack{
                VStack{
                    brewingExperienceReviewTitle
                    brewingExperienceTextEditorVW
                }.padding()
                VStack{
                    recipeTasteReviewTitle
                    recipeTasteReviewEditorVW
                }.padding()
                //                    NavigationLink( destination: BrewingVariablesInput() ,isActive: $isOpenNext){
                //                    }
            }
            Spacer()
        }
        .navigationTitle("Review")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .focused($isInputActive)
        .toolbar {
            ToolbarItemGroup(placement:.confirmationAction){
                
                NavigationLink(destination: Cards(), isActive: $toMainMenu){
                    Button("Done"){
                        isInputActive = false
                        //semua review perlu diganti binding nya soale cuma testing disini
                        BrewingVariableDataController()
                            .addRecipe(bean_altitude: altitude, bean_location: region, bean_name: beans, bean_process: region,bean_variety: variety ,recipe_name: recipeName, variable_dose: coffeeDose, variable_brewtime_minute: Int16(minutes), variable_brewtime_second: Int16(seconds), variable_grindsize: grindSize, variable_ratio: Double(coffeeToWaterRatio), variable_temperature: brewTemperature, variable_water: brewingWater, flavour_review_acidity: Int16(seconds), flavour_review_after_taste: Int16(seconds), flavour_review_aroma: Int16(seconds),flavour_review_body: Int16(seconds), flavour_review_flavour: Int16(seconds), flavour_review_overall: Int16(seconds), flavour_review_sweetness: Int16(seconds), recipe_review_brewtime: beans, recipe_review_dose: beans, recipe_review_grindsize: beans, recipe_review_ratio: beans, recipe_review_temperature: beans, recipe_review_water: beans, context: managedObjectContext)
                        dismiss()
                        dismiss()
                    }
                }
               
            }
        }
        // }
    }
}

struct BrewingResultReview_Previews: PreviewProvider{
    
    static var previews: some View{
        BrewingResultReview(recipeName: .constant(""), beans: .constant(""), variety: .constant(""), region: .constant(""), altitude: .constant(""), coffeeDose: .constant(""), grindSize: .constant(""), minutes: .constant(0), seconds: .constant(0), brewTemperature: .constant(""), coffeeToWaterRatio: .constant(0), brewingWater: .constant(""))
    }
}

private extension BrewingResultReview{
    
    var brewingExperienceTextEditorVW: some View {
        TextEditor(text: $brewingExperienceReview)
            .frame(height: 120, alignment: .leading)
            .background(Color("variableColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("variableColor"), lineWidth: 10)
            )
            .padding([.horizontal],10)
            .onAppear{
                UITextView.appearance().backgroundColor = .clear
            }
        
    }
    
    var brewingExperienceReviewTitle: some View{
        Text("How was your brewing experience?")
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading], 5)
    }
    
    var recipeTasteReviewEditorVW: some View {
        TextEditor(text: $recipeTasteReview)
            .frame(height: 120, alignment: .leading)
            .background(Color("variableColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("variableColor"), lineWidth: 10)
            )
            .padding([.horizontal],10)
            .onAppear{
                UITextView.appearance().backgroundColor = .clear
            }
    }
    
    var recipeTasteReviewTitle: some View{
        Text("How did the recipe turn out?")
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading], 5)
    }
    
    
}

