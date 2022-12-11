//
//  CoreDataTestView.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 28/10/22.
//

import Foundation
import CoreData
import SwiftUI


struct CoreDataTestView: View{
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var recipes : FetchedResults<Recipe>
    @State var isShowingNextView = false
    
    var body: some View{
        List{
            ForEach(recipes) {recipe in
                ZStack {
                    NavigationLink(destination: Text(""), isActive: $isShowingNextView){
                        EmptyView()
                    }
                    HStack{
                        VStack{
                            Text("acidity : \(recipe.flavour_review_acidity)")
                            Text("after taste : \(recipe.flavour_review_after_taste)")
                            Text("aroma : \(recipe.flavour_review_aroma)")
                            Text("body : \(recipe.flavour_review_body)")
                            Text("flavour : \(recipe.flavour_review_flavour)")
                            Text("overall : \(recipe.flavour_review_overall)")
                            Text("swetness : \(recipe.flavour_review_sweetness)")
                        }
                        Spacer()
                        VStack{
                            HStack{
                                Text("Dose : ")
                                Text(recipe.recipe_review_dose ?? "not found")
                            }
                            HStack{
                                Text("Brewtime : ")
                                Text(recipe.recipe_review_brewtime ?? "not found")
                            }
                            HStack{
                                Text("Grindsize : ")
                                Text(recipe.recipe_review_grindsize ?? "not found")
                            }
                            HStack{
                                Text("Temp : ")
                                Text(recipe.recipe_review_temperature ?? "not found")
                            }
                            HStack{
                                Text("Ratio : ")
                                Text(recipe.recipe_review_ratio ?? "not found")
                            }
                            HStack{
                                Text("Water : ")
                                Text(recipe.recipe_review_water ?? "not found")
                            }
                        }
                    }
                }
//                Text(recipe.recipe_name ?? "not found")
//                Text(recipe.bean_name ?? "not found")
//                Text(recipe.bean_process ?? "not found")
//                Text(recipe.bean_altitude ?? "not found")
//                Text(recipe.bean_location ?? "not found")
//                Text(recipe.variable_dose ?? "not found")
//                Text(recipe.variable_grindsize ?? "not found")
//                Text(recipe.variable_temperature ?? "not found")
//                Text("1 : \(recipe.variable_ratio)")
//                Text("\(recipe.variable_water) gr")
//                Text("\(recipe.variable_brewtime_minute) minutes")
//                Text("\(recipe.variable_brewtime_second) seconds")
            }
            //ondelete func here
            .onDelete(perform: recipeDelete)
        }
        
        //remove function
        
    }
    func recipeDelete(at offsets: IndexSet){
        for offset in offsets{
            let recipe = recipes[offset]
            managedObjContext.delete(recipe)
        }
        try? managedObjContext.save()
    }
}

struct CoreDataTestView_Previews: PreviewProvider{
    static var previews: some View{
        CoreDataTestView()
    }
}
