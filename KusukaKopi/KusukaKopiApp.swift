//
//  KusukaKopiApp.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 26/08/22.
//

import SwiftUI

@main
struct KusukaKopiApp: App {
    
    @State private var brewingVariableDataController = BrewingVariableDataController()
//    init(){
////        UINavigationBar.appearance().backgroundColor = UIColor.init(Color("buttonBGColor"))
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(Color("fontColor"))]
//
//    }
    
    var body: some Scene {
        WindowGroup {
            //BrewingVariablesInput(recipeName: .constant(""), beans: .constant(""), variety: .constant(""), region: .constant(""), altitude: .constant(""))
            //AddRecipes()
//            ListRecepi()
//                .environment(\.managedObjectContext, brewingVariableDataController.container.viewContext)
//
//            AddRecipes()

            
//            CoreDataTestView() .environment(\.managedObjectContext,brewingVariableDataController.container.viewContext)
//            ViewTest(dummyDataModels: DummyDataModel.dummyData)
//
            Cards()
                .environment(\.managedObjectContext,brewingVariableDataController.container.viewContext)
            
//            BrewingVariables()
            
        }
    }
}
