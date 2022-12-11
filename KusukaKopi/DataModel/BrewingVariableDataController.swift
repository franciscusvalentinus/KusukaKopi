//
//  BrewingVariableDataController.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 11/09/22.
//

import Foundation
import CoreData

class BrewingVariableDataController: ObservableObject{
    let container = NSPersistentContainer(name: "BrooDB")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save (context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data Saved")
        } catch{
            print("Failed to save data!")
        }
    }
    
    func addRecipe(bean_altitude: String, bean_location: String, bean_name: String, bean_process: String, bean_variety: String, recipe_name: String, variable_dose: String, variable_brewtime_minute: Int16, variable_brewtime_second: Int16, variable_grindsize: String, variable_ratio: Double, variable_temperature: String, variable_water: String, flavour_review_acidity : Int16, flavour_review_after_taste : Int16, flavour_review_aroma: Int16, flavour_review_body : Int16, flavour_review_flavour : Int16, flavour_review_overall : Int16, flavour_review_sweetness : Int16, recipe_review_brewtime : String, recipe_review_dose : String, recipe_review_grindsize : String, recipe_review_ratio : String, recipe_review_temperature : String, recipe_review_water : String ,context: NSManagedObjectContext){
        let items = Recipe(context: context)
        items.id = UUID()
        items.bean_name = bean_name
        items.bean_location = bean_location
        items.bean_altitude = bean_altitude
        items.bean_process = bean_process
        items.bean_variety = bean_variety
        items.recipe_name = recipe_name
        items.variable_dose = variable_dose
        items.variable_brewtime_minute = variable_brewtime_minute
        items.variable_brewtime_second = variable_brewtime_second
        items.variable_grindsize = variable_grindsize
        items.variable_ratio = variable_ratio
        items.variable_temperature = variable_temperature
        items.variable_water = variable_water
        items.flavour_review_acidity = flavour_review_acidity
        items.flavour_review_after_taste = flavour_review_after_taste
        items.flavour_review_aroma = flavour_review_aroma
        items.flavour_review_body = flavour_review_body
        items.flavour_review_flavour = flavour_review_flavour
        items.flavour_review_overall = flavour_review_overall
        items.flavour_review_sweetness = flavour_review_sweetness
        items.recipe_review_brewtime = recipe_review_brewtime
        items.recipe_review_dose = recipe_review_dose
        items.recipe_review_grindsize = recipe_review_grindsize
        items.recipe_review_ratio = recipe_review_ratio
        items.recipe_review_temperature = recipe_review_temperature
        items.recipe_review_water = recipe_review_water
        
        save(context: context)
    }
    
    func editRecipe(items: Recipe, bean_altitude: String, bean_location: String, bean_name: String, bean_process: String, bean_variety: String, brewing_review: String, recipe_name: String, taste_review: String, variable_dose: String, variable_brewtime_minute: Int16, variable_brewtime_second: Int16, variable_grindsize: String, variable_ratio: Double, variable_temperature: String, variable_water: String, flavour_review_acidity : Int16, flavour_review_after_taste : Int16, flavour_review_aroma: Int16, flavour_review_body : Int16, flavour_review_flavour : Int16, flavour_review_overall : Int16, flavour_review_sweetness : Int16, recipe_review_brewtime : String, recipe_review_dose : String, recipe_review_grindsize : String, recipe_review_ratio : String, recipe_review_temperature : String, recipe_review_water : String , context: NSManagedObjectContext){
        items.bean_name = bean_name
        items.bean_location = bean_location
        items.bean_altitude = bean_altitude
        items.bean_process = bean_process
        items.bean_variety = bean_variety
        items.recipe_name = recipe_name
        items.variable_dose = variable_dose
        items.variable_brewtime_minute = variable_brewtime_minute
        items.variable_brewtime_second = variable_brewtime_second
        items.variable_grindsize = variable_grindsize
        items.variable_ratio = variable_ratio
        items.variable_temperature = variable_temperature
        items.variable_water = variable_water
        items.flavour_review_acidity = flavour_review_acidity
        items.flavour_review_after_taste = flavour_review_after_taste
        items.flavour_review_aroma = flavour_review_aroma
        items.flavour_review_body = flavour_review_body
        items.flavour_review_flavour = flavour_review_flavour
        items.flavour_review_overall = flavour_review_overall
        items.flavour_review_sweetness = flavour_review_sweetness
        items.recipe_review_brewtime = recipe_review_brewtime
        items.recipe_review_dose = recipe_review_dose
        items.recipe_review_grindsize = recipe_review_grindsize
        items.recipe_review_ratio = recipe_review_ratio
        items.recipe_review_temperature = recipe_review_temperature
        items.recipe_review_water = recipe_review_water
        
        save(context: context)
    }
    
}


