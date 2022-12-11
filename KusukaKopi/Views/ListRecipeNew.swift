//
//  ListRecipeNew.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 19/10/22.
//

import Foundation
import SwiftUI
import CoreData

struct ListRecipeNew: View{
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State private var showAddRecipe = false
    
    var body: some View{
        //        NavigationView{
        VStack{
            //                Spacer()
            //                //NavTitle + NavLink Button
            //                HStack{
            //                    Text("My Recipe")
            //                        .font(.largeTitle).bold()
            //                        .font(.system(size: 34, weight: .heavy))
            //                        .foregroundColor(Color("fontColor") )
            //                        .padding()
            //                    Spacer()
            //                    HStack{
            //                        NavigationLink(destination: AddRecipes(), label: {
            //
            //                        Image(systemName: "plus.circle")
            //                            .foregroundColor(Color.blue)
            //                        Text("Add Recipe")
            //                            .font(.system(size: 15))
            //                            .foregroundColor(Color.blue)
            //
            //                        })
            //                    }
            //                }
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/){ item in
                VStack{
                    HStack{
                        VStack{
                            Text("Lorem Ipsum")
                            Text("Lorem Ipsum2")
                        }
                        Spacer()
                        VStack{
                            
                        }
                        HStack{
                            Image(systemName: "star.leadinghalf.filled")
                            Text("Score")
                        }
                    }
                    HStack{
                        HStack{
                            Image("brewTime")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 10)
                            Text("BrewTime")
                                .font(.system(size: 10, weight: .light))
                                .lineLimit(2)
                        }
                        Spacer()
                        HStack{
                            Image("dose")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 10)
                            Text("Dose")
                                .font(.system(size: 10, weight: .light))
                                .lineLimit(2)
                        }
                        Spacer()
                        HStack{
                            Image("water")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 10)
                            Text("Water Total")
                                .font(.system(size: 10, weight: .light))
                                .lineLimit(2)
                        }
                        Spacer()
                        HStack{
                            Image("temp")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 10)
                            Text("Temperature")
                                .font(.system(size: 10, weight: .light))
                                .lineLimit(2)
                        }
                    }
                }
            }
            
            //                VStack{
            //                    HStack{
            //                        VStack(alignment: .leading){
            //                            Text("Lorem Ipsum")
            //                                .font(.system(size: 22, weight: .semibold))
            //                            Text("Bean Name")
            //                                .multilineTextAlignment(.leading)
            //                                .font(.system(size: 18, weight: .medium))
            //
            //                        }
            //                        Spacer()
            //                        VStack{
            //                            HStack{
            //                                Image(systemName: "star.leadinghalf.filled")
            //                                Text("Rating")
            //                                    .font(.system(size: 20,weight: .semibold))
            //                            }.padding([.trailing], 15)
            //                            Spacer()
            //                        }
            //                    }
            //                    Spacer(minLength: 30)
            //                    HStack{
            //                        HStack{
            //                            Image("brewTime")
            //                                .resizable()
            //                                .scaledToFit()
            //                                .frame(height: 10)
            //                            Text("BrewTime")
            //                                .font(.system(size: 10, weight: .light))
            //                                .lineLimit(2)
            //                        }
            //                        Spacer()
            //                        HStack{
            //                            Image("dose")
            //                                .resizable()
            //                                .scaledToFit()
            //                                .frame(height: 10)
            //                            Text("Dose")
            //                                .font(.system(size: 10, weight: .light))
            //                                .lineLimit(2)
            //                        }
            //                        Spacer()
            //                        HStack{
            //                            Image("water")
            //                                .resizable()
            //                                .scaledToFit()
            //                                .frame(height: 10)
            //                            Text("Water Total")
            //                                .font(.system(size: 10, weight: .light))
            //                                .lineLimit(2)
            //                        }
            //                        Spacer()
            //                        HStack{
            //                            Image("temp")
            //                                .resizable()
            //                                .scaledToFit()
            //                                .frame(height: 10)
            //                            Text("Temperature")
            //                                .font(.system(size: 10, weight: .light))
            //                                .lineLimit(2)
            //                        }
            //                        Spacer()
            //                    }
            //
            //                }
            
        }
        .navigationTitle("My Recipe")
        .navigationBarBackButtonHidden(true)
        .toolbar{
            
            Button {
                //                        self.showBrewingVariableInfput = false
                self.showAddRecipe = true
            } label: {
                Text("Next")
            }
            
            
            
            .sheet(isPresented: $showAddRecipe, onDismiss: {
                print(self.showAddRecipe)
                
            }){
                AddRecipes(showCards: $showAddRecipe, showAddRecipe: $showAddRecipe)
//                    .interactiveDismissDisabled(true)
            }
            
            //                .ignoresSafeArea()
            //                .navigationBarHidden(true)
        }
        
        
        //    }
    }
    
    struct ListRecipeNew_Previews: PreviewProvider{
        static var previews: some View{
            ListRecipeNew()
        }
    }
}
