//
//  congrats.swift
//  KusukaKopi
//
//  Created by Surya Dharma Winata on 12/09/22.
//

import SwiftUI

struct congrats: View {
    

    @State private var showReviewPage = false

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
    @Binding var waterTotal: Int
    
    @State var toResultView = false

    
    var body: some View {
        //NavigationView{
            VStack{
                Text("Congratulation!")
                    .font(.system(size: 20))
                    .bold()
                    .padding(15)
                
                Text("Coffee Simulation has been done. enjoy!")
                    .font(.system(size: 20))
                    .frame(width: 230, height: 60, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(5)
                     
                Image("Congratulations!")
                    .padding(55)

                
                Button {
                    self.showReviewPage = true
                } label: {
                    Text("Let's Review")
                        .foregroundColor(Color("fontColor"))
                                                .underline()
                                                .padding(15)
                }
                .sheet(isPresented: $showReviewPage, onDismiss: {
                    print(self.showReviewPage)
                    //                                        .presentationDetents([.medium])
                }){
                    ReviewPage(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, coffeeDose: $coffeeDose, grindSize: $grindSize, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, brewingWater: $brewingWater, showAddRecipe: $showReviewPage)
                }
                .buttonStyle(.plain)
      
//                NavigationLink(destination: ReviewPage(), label: {
//            Text("Let's Review")
//                        .foregroundColor(Color("fontColor"))
//                        .underline()
//                        .padding(15)
//
//        })

      
                NavigationLink(destination: BrewingResultReview(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, coffeeDose: $coffeeDose, grindSize: $grindSize, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, brewingWater: $brewingWater), isActive: $toResultView){
            Text("Let's Review")
                        .foregroundColor(Color("fontColor"))
                        .underline()
                        .padding(15)
                        
        }

                
            }.padding()
            .navigationBarHidden(true)
        //}
    }
}

struct congrats_Previews: PreviewProvider {
    static var previews: some View {
        congrats(recipeName: .constant(""), beans: .constant(""), variety: .constant(""), region: .constant(""), altitude: .constant(""), coffeeDose: .constant(""), grindSize: .constant(""), minutes: .constant(0), seconds: .constant(0), brewTemperature: .constant(""), coffeeToWaterRatio: .constant(0), brewingWater: .constant(""), waterTotal: .constant(0))
    }
}
