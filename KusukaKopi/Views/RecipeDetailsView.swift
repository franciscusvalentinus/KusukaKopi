//
//  RecipeDetailsView.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 19/10/22.
//

import Foundation
import CoreData
import SwiftUI

struct RecipeDetailView: View{
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    var recipes: FetchedResults<Recipe>.Element
    
    @State private var recipeName = ""
    @State private var beanName = ""
    @State private var beanProcess = ""
    @State private var beanVariety = ""
    @State private var beanAltitude = ""
    
    @State private var coffeeDose = ""
    @State private var grindSize = ""
    @State private var minute: Int = 0
    @State private var second: Int = 0
    @State private var temperature = ""
    @State private var water: String = ""
    @State private var ratio: Double = 0
    
    
    var body: some View{
        NavigationView{
            ScrollView{
                VStack {
                    VStack {
                        Text("Ingredients")
                        Spacer()
                        VStack{
                            HStack{
                                Text("Recipe's Name")
                                    .font(.headline)
                                    .padding(.trailing)
                                Text("\(recipes.recipe_name!)")
                                    .padding(.leading,50)
                                    .multilineTextAlignment(.trailing)
                            }.foregroundColor(.primary)
                                .padding(3)
                            HStack{
                                Text("Beans")
                                    .font(.headline)
                                    .padding(.trailing)
                                Text("\(recipes.bean_name!)")
                                    .padding(.leading,120)
                                    .multilineTextAlignment(.trailing)
                            }.foregroundColor(.primary)
                                .padding(3)
                            HStack{
                                Text("Variety")
                                    .font(.headline)
                                    .padding(.trailing)
                                Text("\(recipes.bean_variety!)")
                                    .padding(.leading,112)
                                    .multilineTextAlignment(.trailing)
                            }.foregroundColor(.primary)
                                .padding(3)
                            HStack{
                                Text("Process")
                                    .font(.headline)
                                    .padding(.trailing)
                                Text("\(recipes.bean_process!)")
                                    .padding(.leading,113)
                                    .multilineTextAlignment(.trailing)
                            }.foregroundColor(.primary)
                                .padding(3)
                            HStack{
                                Text("Altitude")
                                    .font(.headline)
                                    .padding(.trailing)
                                Text("\(recipes.bean_altitude!) in mdpl/masl")
                                //                                Text("in mdpl / masl")
                                    .padding(.leading,105)
                                    .multilineTextAlignment(.trailing)
                            }.foregroundColor(.primary)
                        }
                    }
                    Spacer()
                    Form{
                        Section{
                            HStack{
                                Image(systemName: "scalemass")
                                Text("Dose")
                                    .font(.headline)
                                    .padding(.trailing)
                                HStack{
                                    Text("\(recipes.variable_dose!)")
                                    Text("Gr")
                                }
                                Spacer()
                                HStack{
                                    
                                }
                                .padding(.leading, 50)
                                .multilineTextAlignment(.trailing)
                                
                            }
                            HStack{
                                Image(systemName: "gearshape")
                                Text("Grind Size")
                                    .font(.headline)
                                    .padding(.trailing)
                                HStack{
                                    Text("\(recipes.variable_grindsize!)")
                                    Text("Gr")
                                }
                                Spacer()
                                HStack{
                                    
                                }
                                .padding(.leading, 50)
                                .multilineTextAlignment(.trailing)
                            }
                            HStack{
                                Image(systemName: "timer")
                                Text("Brewtime")
                                    .font(.headline)
                                    .padding(.trailing)
                                HStack{
                                    Text("\(recipes.variable_brewtime_minute)")
                                    Text("Min")
                                    Text("\(recipes.variable_brewtime_second)")
                                    Text("Sec")
                                }
                                Spacer()
                                HStack{
                                    
                                }
                                .padding(.leading, 50)
                                .multilineTextAlignment(.trailing)
                            }
                            HStack{
                                Image(systemName: "thermometer")
                                Text("Temperature")
                                    .font(.headline)
                                    .padding(.trailing)
                                HStack{
                                    Text("\(recipes.variable_temperature!)")
                                    Text("Gr")
                                }
                                Spacer()
                                HStack{
                                    
                                }
                                .padding(.leading, 50)
                                .multilineTextAlignment(.trailing)
                            }
                            HStack{
                                Image(systemName: "drop")
                                Text("Water")
                                    .font(.headline)
                                    .padding(.trailing)
                                HStack{
                                    Text("\(recipes.variable_water!)")
                                    Text("Gr")
                                }
                                Spacer()
                                HStack{
                                    
                                }
                                .padding(.leading, 50)
                                .multilineTextAlignment(.trailing)
                            }
                            HStack{
                                Image(systemName: "percent")
                                Text("Ratio")
                                    .font(.headline)
                                    .padding(.trailing)
                                HStack{
                                    Text("\(recipes.variable_ratio)")
                                    Text("Gr")
                                }
                                Spacer()
                                //                                HStack{
                                //
                                //                                }
                                    .padding(.leading, 50)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                        
                        
                    }
                    
                }
                
                
            }
            
                        
            
//                        .navigationBarHidden(true)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Recipe Detail")
        .accentColor(Color("buttonBGColor"))
        
    }
    
}

