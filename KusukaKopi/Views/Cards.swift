//
//  Cards.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 19/10/22.
//

import Foundation
import SwiftUI
import CoreData

struct Cards: View{
    //    @Environment(\.presentationMode) var presentation
    //    init(){
    //        UITableView.appearance().sectionFooterHeight = 0
    //    }
    //    var objects: [Int]
    // CoreData Fetching
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    @State private var showAddRecipe = false
    
    
    @State private var isShowingDetailView = false
    @State private var isDetailPresented = false
    
    var body: some View{
        //        listView
        //    }
        //    @ViewBuilder
        //    var listView: some View{
        //        if objects.isEmpty{
        //            empetyListView
        //        }else{
        //            objectsListView
        //
        //        }
        //    }
        //    var objectsListView: some View{
        NavigationView{
            VStack{
                //                HStack{
                //                    Text("My Recipe")
                //                        .font(.largeTitle).bold()
                //                        //.border()
                //        //                .frame(
                //        //                    maxWidth: .infinity,
                //        //                    maxHeight: .infinity,
                //        //                    alignment: .topLeading)
                //                        .font(.system(size: 34, weight: .heavy))
                //                        .padding()
                //                    Spacer()
                ////                    HStack{
                ////                        NavigationLink(destination: AddRecipes(), label: {
                ////
                ////                        Image(systemName: "plus.circle")
                ////                            .foregroundColor(Color.blue)
                ////                        Text("Add Recipe")
                ////                            .font(.system(size: 15))
                ////                            .foregroundColor(Color.blue)
                ////
                ////                        })
                ////                    }
                //
                //                        //.background(Color("colorbg"))
                //                    //Spacer()
                //    //                Button("Add Recipe"){
                //    //
                //    //                }
                //                }.padding([.horizontal])
                List{
                    ForEach (recipes) { recipe in
                        GroupBox{
                            ZStack{
                                NavigationLink(destination: RecipeDetailViewTest(recipes: recipe)){
                                }
                                .opacity(0)
                                VStack{
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text(recipe.recipe_name ?? "Not Set")
                                                .font(.system(size: 22, weight: .semibold))
                                            Text(recipe.bean_name ?? "Bean Name")
                                                .multilineTextAlignment(.leading)
                                                .font(.system(size: 18, weight: .medium))
                                        }
                                        Spacer()
                                        VStack{
                                            HStack{
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(Color.yellow)
                                                Text("\(recipe.flavour_review_overall) / 5")
                                                //                                            Text("\(recipe.flavour_review_overall)")
                                                    .font(.system(size: 20,weight: .semibold))
                                            }.padding([.trailing], 10)
                                            Spacer()
                                        }
                                    }.padding([.top],10)
                                    Spacer(minLength: 30)
                                    VStack{
                                        HStack{
                                            HStack{
                                                Image(systemName: "timer")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 15)
                                                Text("\(recipe.variable_brewtime_minute) min \(recipe.variable_brewtime_second) sec")
                                                    .font(.system(size: 15, weight: .light))
                                                    .lineLimit(2)
                                            }
                                            Spacer()
                                            HStack{
                                                Image(systemName: "scalemass")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 15)
                                                HStack{
                                                    Text(recipe.variable_dose ?? "Not Set")
                                                        .font(.system(size: 15, weight: .light))
                                                        .lineLimit(2)
                                                    Text("gr")
                                                        .font(.system(size: 15, weight: .light))
                                                        .lineLimit(2)
                                                }
                                            }
                                            
                                        }.padding([.horizontal], 8)
                                        HStack{
                                            HStack{
                                                Image(systemName: "drop")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 15)
                                                HStack{
                                                    Text(recipe.variable_water ?? "0")
                                                        .font(.system(size: 15, weight: .light))
                                                        .lineLimit(2)
                                                    Text("gr")
                                                        .font(.system(size: 15, weight: .light))
                                                        .lineLimit(2)
                                                }
                                            }
                                            Spacer()
                                            HStack{
                                                Image(systemName: "thermometer")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 15)
                                                HStack{
                                                    Text(recipe.variable_temperature ?? "Temperature")
                                                        .font(.system(size: 15, weight: .light))
                                                        .lineLimit(2)
                                                    Text("°C")
                                                        .font(.system(size: 15, weight: .light))
                                                        .lineLimit(2)
                                                }
                                            }
                                        }.padding([.horizontal], 8)
                                    }
                                }
                            }
                        }
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .padding([.horizontal], 15)
                        .padding([.vertical], 3)
                        .background(Rectangle()
                            .foregroundColor(Color.clear))
                        .groupBoxStyle(TransparentGroupBox())
                        .listStyle(.plain)
                        .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: recipeDelete)
                    
                }
                .listStyle(.plain)
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("My Recipe")
            //            .navigationBarHidden(true)
            .toolbar {
                Button {
                    //                        self.showBrewingVariableInfput = false
                    self.showAddRecipe = true
                } label: {
                    Text("Add Recipe")
                        .frame(width: 100, height: 80)
                        .foregroundColor(Color("buttonBGColor"))
                }
                
                
                
                .sheet(isPresented: $showAddRecipe, onDismiss: {
                    print(self.showAddRecipe)
                    
                }){
                    AddRecipes(showCards: $showAddRecipe, showAddRecipe: $showAddRecipe)
                        .interactiveDismissDisabled(true)
                }
            }
        }
        
        //        .navigationViewStyle(.stack)
        
    }
    func recipeDelete(at offsets: IndexSet){
        for offset in offsets{
            let recipe = recipes[offset]
            managedObjContext.delete(recipe)
        }
        try? managedObjContext.save()
    }
}



//var empetyListView : some View{
//    Text("Oops, loos like there's no data...")
//        .foregroundColor(.white)
//}

struct Cards_Previews: PreviewProvider{
    static var previews: some View{
        //        Cards(objects: [0])
        Cards()
        
    }
}
