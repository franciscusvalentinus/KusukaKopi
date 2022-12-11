//
//  ListRecepi.swift
//  KusukaKopi
//
//  Created by vincent fernando on 09/09/22.
//

import SwiftUI
import CoreData

struct ListRecepi: View {
    
    //Core Data Fetch
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    
    @FocusState var isActive: Bool
//    var judul: String
//    var waktu: String
//    var biji: String
//    var gram: String
    let gradient = Gradient(colors: [Color("buttonBGColor"), Color("variableColor")])
    
    var body: some View {
        NavigationView{
        VStack{
            HStack{
                Text("My Recipe")
                    .font(.largeTitle).bold()
                    //.border()
    //                .frame(
    //                    maxWidth: .infinity,
    //                    maxHeight: .infinity,
    //                    alignment: .topLeading)
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(Color("fontColor") )
                    .padding()
                Spacer()
                HStack{
                    NavigationLink(destination: AddRecipes(showCards: .constant(true), showAddRecipe: .constant(true)), label: {
                        
                    Image(systemName: "plus.circle")
                        .foregroundColor(Color.blue)
                    Text("Add Recipe")
                        .font(.system(size: 15))
                        .foregroundColor(Color.blue)
                        
                    })
                }
                
                    //.background(Color("colorbg"))
                //Spacer()
//                Button("Add Recipe"){
//
//                }
            }
            //GroupBox{
            ScrollView{
            ForEach(recipes) { recipe in
                HStack {
                    //Image("appicon")
                        //.clipShape(Circle())
                        //.padding()//.trailing, 10)
                VStack(spacing: 5) {
                    HStack{
                        
                    
                        Text(recipe.recipe_name ?? "not found")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color("buttonBGColor"))
                        .lineLimit(1)
                        //.padding(.trailing,20)
                    Spacer()
                    Image(systemName: "clock.fill")
                            .foregroundColor(Color("buttonBGColor"))
                        Text("\(recipe.variable_brewtime_minute) : \(recipe.variable_brewtime_second)")
                            .font(.system(size: 18))
                            .foregroundColor(Color("buttonBGColor"))
                    .lineLimit(1)
                    }
                    .padding(5)
                    //Spacer()

                    
                    HStack{
                        Image("dose")
                        Text(recipe.bean_name ?? "not found")
                            .font(.system(size: 15))
                            .foregroundColor(Color("fontColor"))
                            .lineLimit(1)
                        Spacer()
                        Image("grams")
                            .foregroundColor(Color("fontColor"))
                        Text(recipe.variable_dose ?? "not found")
                            .font(.system(size: 15))
                            .foregroundColor(Color("fontColor"))
                            .lineLimit(1)
                    }
                }
            }.padding()
                
                .background(Rectangle()
                .foregroundColor(Color("variableColor")))
                //.background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))

                .cornerRadius(15)
            
        //}
                
            Spacer()
            }
            }
                
        }.padding()
                .navigationBarHidden(true)
                }
    }
}
//struct SecondView: View {
//    var body: some View{
//        Text("test")
//    }
//}
//struct ContenView: View{
//            var body: some View {
//                NavigationView{
//                    VStack {
//                        NavigationLink(destination: SecondView()){
//                            Text("Add Test")
//                                .frame(
//                                    maxWidth: .infinity,
//                                    maxHeight: .infinity,
//                                    alignment: .topTrailing)
//                        }
//                        .navigationTitle("Navigation")
//
//                        }
//                    }
//                }
//            }
//




struct ListRecepi_Previews: PreviewProvider {
    static var previews: some View {
        ListRecepi()
    }
}
