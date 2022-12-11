//
//  ReiewPage.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 21/10/22.
//

import SwiftUI

struct ReviewPage: View {
    //binding core data
    @Binding var recipeName : String
    @Binding var beans : String
    @Binding var variety : String
    @Binding var region : String
    @Binding var altitude : String
    @Binding var coffeeDose: String
    @Binding var grindSize: String
    @Binding var minutes: Int
    @Binding var seconds: Int
    @Binding var brewTemperature: String
    @Binding var coffeeToWaterRatio: Double
    @Binding var brewingWater: String
    @Binding var showAddRecipe:Bool
    
    @State private var toMainMenu = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.presentationMode) var presentation
    
    @State private var showRatingAromaInfoView = false
    @State private var showRatingFlavourInfoView = false
    @State private var showRatingSweetnessInfoView = false
    @State private var showRatingAcidityInfoView = false
    @State private var showRatingBodyInfoView = false
    @State private var showRatingAftertasteInfoView = false
    
    @State private var showDoseInfo = false
    @State private var showGrindSizeInfo = false
    @State private var showBrewtimeInfo = false
    @State private var showTemperatureInfo = false
    @State private var showWaterInfo = false
    
    @State var aromaRating = 1
    @State var flavourRating = 1
    @State var sweetnessRating = 1
    @State var acidityRating = 1
    @State var bodyRating = 1
    @State var afterTasteRating = 1
    @State var overalRating = 0
    
    
    @State var dosePicker = false
    @State var grindSizePicker = false
    @State var brewtimePicker = false
    @State var waterPicker = false
    @State var temperaturePicker = false
    
    @State var indexDoseSelected = 0
    @State var indexGrindSizeSelected = 0
    @State var indexBrewtimeSelected = 0
    @State var indexWaterSelected = 0
    @State var indexTemperatureSelected = 0
    
    @State private var dose = ["Not Set", "Terlalu Sedikit", "Pas", "Terlalu Banyak"]
    @State private var grindSizes = ["Not Set","Terlalu Halus","Pas","Terlalu Kasar"]
    @State private var brewtime = ["Not Set", "Terlalu Cepat","Pas", "Terlalu Lama"]
    @State private var temperature = ["Not Set","Terlalu Rendah","Pas","Terlalu Tinggi"]
    @State private var water = [ "Not Set", "Terlalu Sedikit","Pas", "Terlalu Banyak"]
    
    @State var didTap:Bool = false
    
    //overall score
    var overallScore: Int{
        let aromaRatingGiven = aromaRating
        let flavourRatingGiven = flavourRating
        let sweetnessRatingGiven = sweetnessRating
        let acidityRatingGiven = acidityRating
        let bodyRatingGiven = bodyRating
        let aftertasteRatingGiven = afterTasteRating
        let overalRatingScore = (aromaRatingGiven+flavourRatingGiven+sweetnessRatingGiven+acidityRatingGiven+bodyRatingGiven+aftertasteRatingGiven) / 6
        
        return overalRatingScore
    }
    
    
    var body: some View {
        
//        NavigationView{
            
            ZStack{
                VStack{
                    
                    Form{
                        Section{
                            HStack{
                                Image(systemName: "scalemass")
                                Text("Dose")
                                    .font(.headline)
                                
                                Button {
                                    self.showDoseInfo = true
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        
                                }
                                
                                .sheet(isPresented: $showDoseInfo, onDismiss: {
                                    print(self.showDoseInfo)
                                        
                                        
                                    //                                        .presentationDetents([.medium])
                                })
//                                .interactiveDismissDisabled(true)
//                                .halfSheet(showSheet: $showModal)
                                {
                                    DoseView2()
                                }
                                .buttonStyle(.plain)
                                
                                Spacer()
                                Button(action: {
                                    self.dosePicker.toggle()
                                }){
                                    HStack{
                                        Text("\(self.dose[indexDoseSelected]) ")
                                        Image(systemName: "chevron.right")
                                    }
                                }
                                .padding()
                                .buttonStyle(.plain) //agar not setnya saja yg terpejet
                                .foregroundColor(Color.secondary)
                                
                            }
                            .foregroundColor(Color.primary)
                            
                            HStack{
                                Image(systemName: "gearshape")
                                Text("Grind Size")
                                    .font(.headline)
                                Button {
                                    self.showGrindSizeInfo = true
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        
                                }
                                
                                .sheet(isPresented: $showGrindSizeInfo, onDismiss: {
                                    print(self.showGrindSizeInfo)
                                        
                                        
                                    //                                        .presentationDetents([.medium])
                                })
//                                .interactiveDismissDisabled(true)
//                                .halfSheet(showSheet: $showModal)
                                {
                                    grindSizeInfo()
                                }
                                .buttonStyle(.plain)
                                
                                Spacer()
                                Button(action: {
                                    self.grindSizePicker.toggle()
                                }){
                                    HStack{
                                        Text("\(self.grindSizes[indexGrindSizeSelected]) ")
                                        Image(systemName: "chevron.right")
                                    }
                                }
                                .padding()
                                .buttonStyle(.plain)
                                .foregroundColor(Color.secondary)
                            }
                            .foregroundColor(Color.primary)
                            HStack{
                                Image(systemName: "timer")
                                Text("Brewtime")
                                    .font(.headline)
                                Button {
                                    self.showBrewtimeInfo = true
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        
                                }
                                
                                .sheet(isPresented: $showBrewtimeInfo, onDismiss: {
                                    print(self.showBrewtimeInfo)
                                        
                                        
                                    //                                        .presentationDetents([.medium])
                                })
//                                .interactiveDismissDisabled(true)
//                                .halfSheet(showSheet: $showModal)
                                {
                                    brewTimeInfo()
                                }
                                .buttonStyle(.plain)
                                
                                Spacer()
                                Button(action: {
                                    self.brewtimePicker.toggle()
                                }){
                                    HStack{
                                        Text("\(self.brewtime[indexBrewtimeSelected]) ")
                                        Image(systemName: "chevron.right")
                                    }
                                }
                                .padding()
                                .buttonStyle(.plain)
                                .foregroundColor(Color.secondary)
                            }
                            .foregroundColor(Color.primary)
                            HStack{
                                Image(systemName: "thermometer")
                                Text("Temperature")
                                    .font(.headline)
                                Button {
                                    self.showTemperatureInfo = true
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        
                                }
                                
                                .sheet(isPresented: $showTemperatureInfo, onDismiss: {
                                    print(self.showTemperatureInfo)
                                        
                                        
                                    //                                        .presentationDetents([.medium])
                                })
//                                .interactiveDismissDisabled(true)
//                                .halfSheet(showSheet: $showModal)
                                {
                                    temperatureInfo()
                                }
                                .buttonStyle(.plain)
                                
                                Spacer()
                                Button(action: {
                                    self.temperaturePicker.toggle()
                                }){
                                    HStack{
                                        Text("\(self.temperature[indexTemperatureSelected]) ")
                                        Image(systemName: "chevron.right")
                                    }
                                }
                                .padding()
                                .buttonStyle(.plain)
                                .foregroundColor(Color.secondary)
                            }
                            .foregroundColor(Color.primary)
                            HStack{
                                Image(systemName: "drop")
                                Text("Water")
                                    .font(.headline)
                                Button {
                                    self.showWaterInfo = true
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        
                                }
                                
                                .sheet(isPresented: $showWaterInfo, onDismiss: {
                                    print(self.showWaterInfo)
                                        
                                        
                                    //                                        .presentationDetents([.medium])
                                })
//                                .interactiveDismissDisabled(true)
//                                .halfSheet(showSheet: $showModal)
                                {
                                    waterInfo()
                                }
                                .buttonStyle(.plain)
                                
                                Spacer()
                                Button(action: {
                                    self.waterPicker.toggle()
                                }){
                                    HStack{
                                        Text("\(self.water[indexWaterSelected]) ")
                                        Image(systemName: "chevron.right")
                                    }
                                }
                                .padding()
                                .buttonStyle(.plain)
                                .foregroundColor(Color.secondary)
                            }
                            .foregroundColor(Color.primary)
                            
                        }
                        
                    header:{
                        Text("The Recipe")
                            .font(.headline)
                            .foregroundColor(Color.primary)
                        
                    }
                        Section {
                            VStack(alignment: .leading){
                                
                                
                                VStack (alignment: .leading){
                                    HStack{
                                        Text("Aroma")
                                            .font(.headline)
                                        Button {
                                            self.showRatingAromaInfoView = true
                                        } label: {
                                            Image(systemName: "info.circle.fill")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                        }
                                        .sheet(isPresented: $showRatingAromaInfoView, onDismiss: {
                                            print(self.showRatingAromaInfoView)
                                            
                                            
                                        }){
                                            RatingAromaInfoVIew()
                                                .interactiveDismissDisabled(true)
                                            
                                        }
                                        .padding(.bottom, 1)
                                        .buttonStyle(.plain)
                                    }
                                    FlavourRatingView(rating: $aromaRating).padding(.bottom)
                                    
                                    HStack{
                                        Text("Flavour")
                                            .font(.headline)
                                        Button {
                                            self.showRatingFlavourInfoView = true
                                        } label: {
                                            Image(systemName: "info.circle.fill")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                        }
                                        .sheet(isPresented: $showRatingFlavourInfoView, onDismiss: {
                                            print(self.showRatingFlavourInfoView)
                                            
                                        }){
                                            RatingFlavourInfoView()
                                                .interactiveDismissDisabled(true)
                                        }
                                        .padding(.bottom,1)
                                        .buttonStyle(.plain)
                                        
                                    }
                                    FlavourRatingView(rating: $flavourRating).padding(.bottom)
                                       
                                    
                                    HStack{
                                        Text("Sweetness")
                                            .font(.headline)
                                        Button {
                                            self.showRatingSweetnessInfoView = true
                                        } label: {
                                            Image(systemName: "info.circle.fill")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                        }
                                        .sheet(isPresented: $showRatingSweetnessInfoView, onDismiss: {
                                            print(self.showRatingSweetnessInfoView)
                                            
                                        }){
                                            RatingSweetnessInfoView()
                                                .interactiveDismissDisabled(true)
                                        }
                                        .padding(.bottom,1)
                                        .buttonStyle(.plain)
                                    }
                                    FlavourRatingView(rating: $sweetnessRating).padding(.bottom)
                                }
                                
                                
                                VStack (alignment: .leading){
                                    HStack{
                                        Text("Acidity")
                                            .font(.headline)
                                        Button {
                                            self.showRatingAcidityInfoView = true
                                        } label: {
                                            Image(systemName: "info.circle.fill")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                        }
                                        .sheet(isPresented: $showRatingAcidityInfoView, onDismiss: {
                                            print(self.showRatingAcidityInfoView)
                                            
                                        }){
                                            RatingAcidityInfoView()
                                                .interactiveDismissDisabled(true)
                                        }
                                        .padding(.bottom,1)
                                        .buttonStyle(.plain)
                                    }
                                    FlavourRatingView(rating: $acidityRating).padding(.bottom)
                                    
                                    HStack{
                                        Text("Body")
                                            .font(.headline)
                                        Button {
                                            self.showRatingBodyInfoView = true
                                        } label: {
                                            Image(systemName: "info.circle.fill")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                        }
                                        .sheet(isPresented: $showRatingBodyInfoView, onDismiss: {
                                            print(self.showRatingBodyInfoView)
                                            
                                        }){
                                            RatingBodyInfoView()
                                                .interactiveDismissDisabled(true)
                                        }
                                        .padding(.bottom,1)
                                        .buttonStyle(.plain)
                                    }
                                    FlavourRatingView(rating: $bodyRating).padding(.bottom)
                                    
                                    HStack{
                                        Text("After Taste")
                                            .font(.headline)
                                        Button {
                                            self.showRatingAftertasteInfoView = true
                                        } label: {
                                            Image(systemName: "info.circle.fill")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                        }
                                        .sheet(isPresented: $showRatingAftertasteInfoView, onDismiss: {
                                            print(self.showRatingAftertasteInfoView)
                                            
                                        }){
                                            RatingAfterTasteInfoView()
                                                .interactiveDismissDisabled(true)
                                        }
                                        .padding(.bottom,1)
                                        .buttonStyle(.plain)
                                    }
                                    FlavourRatingView(rating: $afterTasteRating).padding(.bottom)
                                    
                                }
                            }
                            .foregroundColor(Color.primary)
//                            .frame(maxWidth: .infinity, alignment: .leading)
                            //
                            //
                        }
                        
                    header:{
                        Text("Rating")
                            .font(.headline)
                            .foregroundColor(Color.primary)
                    }
                        
                        
                    }//Form
                    
                    
                    
                    
                    
                
            }
                .navigationTitle("Review")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItemGroup(placement:.cancellationAction){

                        NavigationLink(destination: Cards(), isActive: $toMainMenu){
                            Button("Cancel"){
                                showAddRecipe = false
                            }
                        }
//
                    }
                    ToolbarItemGroup(placement:.confirmationAction){
                        
                        NavigationLink(destination: Cards(), isActive: $toMainMenu){
                            Button("Done"){
                                overalRating = overallScore
                                //semua review perlu diganti binding nya soale cuma testing disini
                                BrewingVariableDataController()
                                    .addRecipe(bean_altitude: altitude,
                                               bean_location: region,
                                               bean_name: beans,
                                               bean_process: region,
                                               bean_variety: variety,
                                               recipe_name: recipeName,
                                               variable_dose: coffeeDose,
                                               variable_brewtime_minute: Int16(minutes),
                                               variable_brewtime_second: Int16(seconds),
                                               variable_grindsize: grindSize,
                                               variable_ratio: Double(coffeeToWaterRatio),
                                               variable_temperature: brewTemperature,
                                               variable_water: brewingWater,
                                               flavour_review_acidity: Int16(acidityRating),
                                               flavour_review_after_taste: Int16(afterTasteRating),
                                               flavour_review_aroma: Int16(aromaRating),
                                               flavour_review_body: Int16(bodyRating),
                                               flavour_review_flavour: Int16(flavourRating),
                                               flavour_review_overall: Int16(overalRating),
                                               flavour_review_sweetness: Int16(sweetnessRating),
                                               recipe_review_brewtime: brewtime[indexBrewtimeSelected],
                                               recipe_review_dose: dose[indexDoseSelected],
                                               recipe_review_grindsize: grindSizes[indexGrindSizeSelected],
                                               recipe_review_ratio: temperature[indexTemperatureSelected],
                                               recipe_review_temperature: temperature[indexTemperatureSelected],
                                               recipe_review_water: water[indexWaterSelected],
                                               context: managedObjectContext)
                                showAddRecipe = false
                            }
                        }
                       
                    }
                }
                DosePicker1(selectedDose: self.$indexDoseSelected, showingDose: self.$dosePicker , doseSelection: self.$dose)
                    .animation(.linear)
                    .offset(y: self.dosePicker  ? 0 : UIScreen.main.bounds.height)
                
                GrindSizePicker1(selectedGrindSize: self.$indexGrindSizeSelected, showingGrindSize: self.$grindSizePicker , grindSizeSelection: self.$grindSizes)
                    .animation(.linear)
                    .offset(y: self.grindSizePicker  ? 0 : UIScreen.main.bounds.height)
                
                BrewtimePicker1(selectedBrewtime: self.$indexBrewtimeSelected, showingBrewtime: self.$brewtimePicker , brewTimeSelection: self.$brewtime)
                    .animation(.linear)
                    .offset(y: self.brewtimePicker  ? 0 : UIScreen.main.bounds.height)
                
                TemperaturePicker1(selectedTemp: self.$indexTemperatureSelected, showingTemp: self.$temperaturePicker , temperatureSelection: self.$temperature)
                    .animation(.linear)
                    .offset(y: self.temperaturePicker  ? 0 : UIScreen.main.bounds.height)
                
                WaterPicker1(selectedWater: self.$indexWaterSelected, showingWater: self.$waterPicker , waterSelection: self.$water)
                    .animation(.linear)
                    .offset(y: self.waterPicker  ? 0 : UIScreen.main.bounds.height)
                
                
                
            }
            .foregroundColor(Color("buttonBGColor"))
//            .navigationBarItems(leading:
//                                    HStack{
//                Button(action: {
//    //                self.showCards = false
//                }) {
//                    Text("Cancel").frame(height: 60)
//                        .foregroundColor(.blue)
//
//                }
//            }, trailing:
//                                    HStack{
//                Button {
//    //                self.showSelectPreset = true
//                } label: {
//                    Text("Save")
//                        .foregroundColor(.blue)
//                        .frame(width: 50, height: 50)
//                }
//                //
//            }
//            )
            
//        }//NavView
        
        
    }//Body
    
}

struct DosePicker1: View{
    @Binding var selectedDose: Int
    @Binding var showingDose: Bool
    @Binding var doseSelection: [String]
    @FocusState var isInputActive: Bool
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                Button(action: {
                    self.showingDose = false
                }){
                    HStack{
                        Spacer()
                        Text("Done")
                            .padding()
                    }
                }
                Picker(selection: $selectedDose, label: Text("")){
                    ForEach(doseSelection.indices){ dose in
                        Text(doseSelection[dose])
                    }
                }
                .pickerStyle(.inline)
                .frame(width: 200)
                .labelsHidden()
               
                
            }.background(Color(.systemGray4))
        }
        
    }
}


struct GrindSizePicker1: View{
    @Binding var selectedGrindSize: Int
    @Binding var showingGrindSize: Bool
    @Binding var grindSizeSelection: [String]
    @FocusState var isInputActive: Bool
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                Button(action: {
                    self.showingGrindSize = false
                }){
                    HStack{
                        Spacer()
                        Text("Done")
                            .padding()
                    }
                }
                Picker(selection: $selectedGrindSize, label: Text("")){
                    ForEach(grindSizeSelection.indices){ grind in
                        Text(grindSizeSelection[grind])
                    }
                }
                .pickerStyle(.inline)
                .frame(width: 200)
                .labelsHidden()
                
            }.background(Color(.systemGray4))
        }
        
    }
}

struct BrewtimePicker1: View{
    @Binding var selectedBrewtime: Int
    @Binding var showingBrewtime: Bool
    @Binding var brewTimeSelection: [String]
    @FocusState var isInputActive: Bool
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                Button(action: {
                    self.showingBrewtime = false
                }){
                    HStack{
                        Spacer()
                        Text("Done")
                            .padding()
                    }
                }
                Picker(selection: $selectedBrewtime, label: Text("")){
                    ForEach(brewTimeSelection.indices){ brewtime in
                        Text(brewTimeSelection[brewtime])
                    }
                }
                .pickerStyle(.inline)
                .frame(width: 200)
                .labelsHidden()
                
            }.background(Color(.systemGray4))
        }
        
    }
}

struct TemperaturePicker1: View{
    @Binding var selectedTemp: Int
    @Binding var showingTemp: Bool
    @Binding var temperatureSelection: [String]
    @FocusState var isInputActive: Bool
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                Button(action: {
                    self.showingTemp = false
                }){
                    HStack{
                        Spacer()
                        Text("Done")
                            .padding()
                    }
                }
                Picker(selection: $selectedTemp, label: Text("")){
                    ForEach(temperatureSelection.indices){ temperature in
                        Text(temperatureSelection[temperature])
                    }
                }
                .pickerStyle(.inline)
                .frame(width: 200)
                .labelsHidden()
                
            }.background(Color(.systemGray4))
        }
        
    }
}

struct WaterPicker1: View{
    @Binding var selectedWater: Int
    @Binding var showingWater: Bool
    @Binding var waterSelection: [String]
    @FocusState var isInputActive: Bool
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                Button(action: {
                    self.showingWater = false
                }){
                    HStack{
                        Spacer()
                        Text("Done")
                            .padding()
                    }
                }
                Picker(selection: $selectedWater, label: Text("")){
                    ForEach(waterSelection.indices){ water in
                        Text(waterSelection[water])
                    }
                }
                .pickerStyle(.inline)
                .frame(width: 200)
                .labelsHidden()
                
            }.background(Color(.systemGray4))
        }
        
    }
}

struct DoseView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Halo")
        }
    }
}

struct ReviewPage_Previews: PreviewProvider {
    static var previews: some View {
        ReviewPage(recipeName: .constant(""), beans: .constant(""), variety: .constant(""), region: .constant(""), altitude: .constant(""), coffeeDose: .constant(""), grindSize: .constant(""), minutes: .constant(0), seconds: .constant(0), brewTemperature: .constant(""), coffeeToWaterRatio: .constant(0), brewingWater: .constant(""), showAddRecipe: .constant(true))
    }
}
