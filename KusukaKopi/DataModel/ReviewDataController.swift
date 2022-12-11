//
//  ReviewDataController.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 11/09/22.
//

import Foundation
import CoreData

class ReviewDataController: ObservableObject{
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
    
    func addReview(brewing_review: String, taste_review: String, context: NSManagedObjectContext){
        let review = Review(context: context)
        review.brewing_review = brewing_review
        review.taste_review = taste_review
        
        save(context: context)
    }
    
    func editReview(review: Review, brewing_review: String, taste_review: String,  context: NSManagedObjectContext){
        review.brewing_review = brewing_review
        review.taste_review = taste_review
        
        save(context: context)
    }
}
