//
//  DataController.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 11/09/22.
//

import Foundation
import CoreData

class RecipeDataController: ObservableObject{
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
    
    func addRecipe(bean_altitude: Int16, bean_location: String, bean_name: String, bean_process: String, recipe_name: String, context: NSManagedObjectContext){
        let recipe = Recipe(context: context)
        recipe.id = UUID()
        recipe.bean_name = bean_name
        recipe.bean_location = bean_location
        recipe.bean_altitude = bean_altitude
        recipe.bean_process = bean_process
        
        save(context: context)
    }
    
    func editRecipe(recipe: Recipe, bean_altitude: Int16, bean_location: String, bean_name: String, bean_process: String, recipe_name: String,  context: NSManagedObjectContext){
        recipe.bean_name = bean_name
        recipe.bean_location = bean_location
        recipe.bean_altitude = bean_altitude
        recipe.bean_process = bean_process
        
        save(context: context)
    }
}
