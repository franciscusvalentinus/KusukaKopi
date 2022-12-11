//
//  RecipeDetailViewTest.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 30/11/22.
//

import SwiftUI

struct RecipeDetailViewTest: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    var recipes: FetchedResults<Recipe>.Element
    @State private var title: String = "Detail Recipe"
    
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
    
    @State private var aromaRating = 0
    @State private var flavourRating = 0
    @State private var sweetnessRating = 0
    @State private var acidityRating = 0
    @State private var bodyRating = 0
    @State private var afterTasteRating = 0
    
    @FocusState var isTypeActive: Bool
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            NavigationView{
                Form{
                    Section{
                        HStack{
                            Text("Ingredients")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            Text("\(recipes.recipe_name!)")
                                .padding(.leading,50)
                                .multilineTextAlignment(.trailing)
                        }.foregroundColor(.primary)
                        //                            .padding(3)
                        HStack{
                            Text("Beans")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            Text("\(recipes.bean_name!)")
                                .padding(.leading,120)
                                .multilineTextAlignment(.trailing)
                        }.foregroundColor(.primary)
                            .padding(3)
                        HStack{
                            Text("Variety")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            Text("\(recipes.bean_variety!)")
                                .padding(.leading,112)
                                .multilineTextAlignment(.trailing)
                        }.foregroundColor(.primary)
                            .padding(3)
                        HStack{
                            Text("Process")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            Text("\(recipes.bean_process!)")
                                .padding(.leading,113)
                                .multilineTextAlignment(.trailing)
                        }.foregroundColor(.primary)
                        //                            .padding(3)
                        HStack{
                            Text("Altitude (mdpl)")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                            Text("\(recipes.bean_altitude!)")
                            //                                Text("in mdpl / masl")
                                .padding(.leading,105)
                                .multilineTextAlignment(.trailing)
                        }.foregroundColor(.primary)
                    }
                    
                header:{
                    Text("The Recipe")
                        .font(.headline)
                        .foregroundColor(Color.primary)
                    
                }//Section
                    Section{
                        HStack{
                            Image(systemName: "scalemass")
                            Text("Dose")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                                Text("\(recipes.variable_dose!) Gr")
                            .padding(.leading, 50)
                            .multilineTextAlignment(.trailing)
                            
                        }
                        HStack{
                            Image(systemName: "gearshape")
                            Text("Grind Size")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                                Text("\(recipes.variable_grindsize!)")
                            .padding(.leading, 50)
                            .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Image(systemName: "timer")
                            Text("Brewtime")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                                Text("\(recipes.variable_brewtime_minute) Min")
                                Text("\(recipes.variable_brewtime_second) Sec")
                            .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Image(systemName: "thermometer")
                            Text("Temperature")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                                Text("\(recipes.variable_temperature!)˚C")
                            .padding(.leading, 50)
                            .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Image(systemName: "drop")
                            Text("Water")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                                Text("\(recipes.variable_water!) Gr")
                            .padding(.leading, 50)
                            .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Image(systemName: "percent")
                            Text("Ratio")
                                .font(.headline)
                                .padding(.trailing)
                            Spacer()
                                Text("\(recipes.variable_ratio)")
                                .padding(.leading, 50)
                                .multilineTextAlignment(.trailing)
                        }
                    } //Section
                header:{
                    Text("The Recipe ")
                        .font(.headline)
                        .foregroundColor(Color.primary)
                    
                }//Header
                .onTapGesture {
                    isTypeActive = false
                }
//                    Section{
//                        VStack(alignment: .leading){
//
//
//                            VStack (alignment: .leading){
//                                HStack{
//                                    Text("Aroma")
//                                        .font(.headline)
//                                    Button {
//                                        self.showRatingAromaInfoView = true
//                                    } label: {
//                                        Image(systemName: "info.circle.fill")
//                                            .resizable()
//                                            .frame(width: 10, height: 10)
//                                    }
//                                    .sheet(isPresented: $showRatingAromaInfoView, onDismiss: {
//                                        print(self.showRatingAromaInfoView)
//
//
//                                    }){
//                                        RatingAromaInfoVIew()
//                                            .interactiveDismissDisabled(true)
//
//                                    }
//                                    .padding(.bottom, 1)
//                                    .buttonStyle(.plain)
//                                }
//                                FlavourRatingView(rating: $aromaRating).padding(.bottom)
//
//                                HStack{
//                                    Text("Flavour")
//                                        .font(.headline)
//                                    Button {
//                                        self.showRatingFlavourInfoView = true
//                                    } label: {
//                                        Image(systemName: "info.circle.fill")
//                                            .resizable()
//                                            .frame(width: 10, height: 10)
//                                    }
//                                    .sheet(isPresented: $showRatingFlavourInfoView, onDismiss: {
//                                        print(self.showRatingFlavourInfoView)
//
//                                    }){
//                                        RatingFlavourInfoView()
//                                            .interactiveDismissDisabled(true)
//                                    }
//                                    .padding(.bottom,1)
//                                    .buttonStyle(.plain)
//
//                                }
//                                FlavourRatingView(rating: $flavourRating).padding(.bottom)
//
//
//                                HStack{
//                                    Text("Sweetness")
//                                        .font(.headline)
//                                    Button {
//                                        self.showRatingSweetnessInfoView = true
//                                    } label: {
//                                        Image(systemName: "info.circle.fill")
//                                            .resizable()
//                                            .frame(width: 10, height: 10)
//                                    }
//                                    .sheet(isPresented: $showRatingSweetnessInfoView, onDismiss: {
//                                        print(self.showRatingSweetnessInfoView)
//
//                                    }){
//                                        RatingSweetnessInfoView()
//                                            .interactiveDismissDisabled(true)
//                                    }
//                                    .padding(.bottom,1)
//                                    .buttonStyle(.plain)
//                                }
//                                FlavourRatingView(rating: $sweetnessRating).padding(.bottom)
//                            }
//
//
//                            VStack (alignment: .leading){
//                                HStack{
//                                    Text("Acidity")
//                                        .font(.headline)
//                                    Button {
//                                        self.showRatingAcidityInfoView = true
//                                    } label: {
//                                        Image(systemName: "info.circle.fill")
//                                            .resizable()
//                                            .frame(width: 10, height: 10)
//                                    }
//                                    .sheet(isPresented: $showRatingAcidityInfoView, onDismiss: {
//                                        print(self.showRatingAcidityInfoView)
//
//                                    }){
//                                        RatingAcidityInfoView()
//                                            .interactiveDismissDisabled(true)
//                                    }
//                                    .padding(.bottom,1)
//                                    .buttonStyle(.plain)
//                                }
//                                FlavourRatingView(rating: $acidityRating).padding(.bottom)
//
//                                HStack{
//                                    Text("Body")
//                                        .font(.headline)
//                                    Button {
//                                        self.showRatingBodyInfoView = true
//                                    } label: {
//                                        Image(systemName: "info.circle.fill")
//                                            .resizable()
//                                            .frame(width: 10, height: 10)
//                                    }
//                                    .sheet(isPresented: $showRatingBodyInfoView, onDismiss: {
//                                        print(self.showRatingBodyInfoView)
//
//                                    }){
//                                        RatingBodyInfoView()
//                                            .interactiveDismissDisabled(true)
//                                    }
//                                    .padding(.bottom,1)
//                                    .buttonStyle(.plain)
//                                }
//                                FlavourRatingView(rating: $bodyRating).padding(.bottom)
//
//                                HStack{
//                                    Text("After Taste")
//                                        .font(.headline)
//                                    Button {
//                                        self.showRatingAftertasteInfoView = true
//                                    } label: {
//                                        Image(systemName: "info.circle.fill")
//                                            .resizable()
//                                            .frame(width: 10, height: 10)
//                                    }
//                                    .sheet(isPresented: $showRatingAftertasteInfoView, onDismiss: {
//                                        print(self.showRatingAftertasteInfoView)
//
//                                    }){
//                                        RatingAfterTasteInfoView()
//                                            .interactiveDismissDisabled(true)
//                                    }
//                                    .padding(.bottom,1)
//                                    .buttonStyle(.plain)
//                                }
//                                FlavourRatingView(rating: $afterTasteRating).padding(.bottom)
//
//                            }
//                        }
//                        .foregroundColor(Color.primary)
//                    }
                    
                    
                }//Form
                
                
            }
            .background(Color.white)
            .foregroundColor(Color.primary)
            
            
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
}
