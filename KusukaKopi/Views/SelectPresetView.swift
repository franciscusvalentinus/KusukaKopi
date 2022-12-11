//
//  SelectPresetView.swift
//  KusukaKopi
//
//  Created by Franciscus Valentinus Ongkosianbhadra on 15/09/22.
//

import SwiftUI

struct SelectPresetView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State private var showBrewingVariableInput =  false
    @State private var title3: String = "Preset"
    @State private var showFlavourfulPresetView = false
    @Binding var showAddRecipe:Bool
    
    
//    @State var action: String = "flavorful"
    @State var showSheet = false
    @State  var toAdjustVariable: Bool = true
    @State  var coffeeDose: String = ""
    @State  var grindSize: Int = 0
    @State  var minutes: Int = 0
    @State  var seconds: Int = 0
    @State  var brewTemperature: String = ""
//    @State var ratio: Double = 0.2
    @State  var coffeeToWaterRatio: Int = 12
    @State var waterTotal: String = ""
    @State var indexGrindSizeSelected = 0
    
    
    //@binding dari addRecipe
    @Binding var recipeName : String
    @Binding var beans : String
    @Binding var variety : String
    @Binding var region : String
    @Binding var altitude : String
    
    //    @State private var isPassingValue = false
    //func hitung ratio
//    var coffeeToWaterRatioVariable: Double{
//        let doseTotal = Double (coffeeDose) ?? 0
//        let waterTotal = Double (waterTotal) ?? 0
//        let ratioTotal = waterTotal/doseTotal
//        
//        return ratioTotal
//    }
//    @State var ratioTotal: Double = 0
    
    var body: some View {
//        NavigationView{
            VStack{
                //                    Text("Choose Our\nDefault Preset")
                //                        .font(.system(size: 34, weight: .heavy))
                //                        .foregroundColor(Color("fontColor"))
                //                        .frame(maxWidth: .infinity, alignment: .leading)
                //                        .padding([.leading])
                GroupBox{
                    HStack{
                        Text("Flavourful")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        
                        GroupBox{
                            VStack{
//                                NavigationLink( destination: FlavourfulPresetView(toAdjustVariable: .constant(true), coffeeDose: .constant(""), grindSize: .constant(0), minutes: .constant(0), seconds: .constant(0), brewTemperature: .constant(""), coffeeToWaterRatio: .constant(0), waterTotal: .constant(0), recipeName: .constant(""), beans: .constant(""), variety: .constant(""), region: .constant(""), altitude: .constant(""))){
                                NavigationLink(destination: FlavourfulPresetView(toAdjustVariable: $toAdjustVariable, coffeeDose: $coffeeDose, grindSize: $grindSize, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature,coffeeToWaterRatio: $coffeeToWaterRatio, waterTotal: $waterTotal, recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, showAddRecipe: $showAddRecipe)){
                                    Text("Choose Preset")
                                }
                            }
                            .padding(15)
                        }
                        .groupBoxStyle(DarkBrownGroupBox())
                    }
                }
                .groupBoxStyle(TransparentGroupBox())
                .padding([.leading, .trailing, .top])
                GroupBox{
                    HStack{
                        Text("Balance")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        
                        GroupBox{
                            VStack{
                                NavigationLink(destination: BalancePresetView(toAdjustVariable: $toAdjustVariable, coffeeDose: $coffeeDose, grindSize: $grindSize, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, waterTotal: $waterTotal, recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, showAddRecipe: $showAddRecipe)){
                                    
                                    Text("Choose Preset")
                                }                            }
                            .padding(15)
                        }
                        .groupBoxStyle(DarkBrownGroupBox())
                        
                    }
                }
                .groupBoxStyle(TransparentGroupBox())
                .padding([.leading, .trailing])
                
                GroupBox{
                    HStack{
                        Text("Make Your Own")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        
                        GroupBox{
                            VStack{
                                NavigationLink(destination: BrewingVariables(coffeeDose: $coffeeDose, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, indexGrindSizeSelected: $indexGrindSizeSelected, waterTotal: $waterTotal, recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, showAddRecipe: $showAddRecipe)){
                                    
                                    Text("Create")
                                }                            }
                            .padding(15)
                        }
                        .groupBoxStyle(DarkBrownGroupBox())
                    }
                }
                .groupBoxStyle(TransparentGroupBox())
                .padding([.leading, .trailing])
                Spacer()
                
                
            }
        
            .navigationTitle(title3)
            .navigationBarTitleDisplayMode(.inline)
            
//            .foregroundColor(Color("buttonBGColor"))
//                        .navigationBarHidden(true)
//            .navigationBarItems(leading: Button(action: {
//                self.presentation.wrappedValue.dismiss()
//            }, label: {
//                Text("Back")
//                    .foregroundColor(.blue)
//            }))
            
//            .halfSheet(showSheet: $showSheet) {
//                // Your Half Sheet View...
//                if action == "flavourful" {
//                    NavigationView{
//                        ScrollView{
//                            VStack{
//                                HStack{
//                                    Text("Flavourful Preset")
//                                        .font(.system(size: 34, weight: .heavy))
//                                        .foregroundColor(Color("fontColor"))
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                        .padding([.leading, .top])
//                                        .padding(.top)
//                                    Button{
//                                        showSheet.toggle()
//                                    } label: {
//                                        Image(systemName: "multiply").frame(width: 35, height: 35).background(Color.gray).cornerRadius(20).foregroundColor(Color.white).padding([.trailing])
//                                    }
//                                    .padding(.top)
//                                    .padding(.top)
//                                }
//
//                                GroupBox{
//                                    HStack{
//                                        Image("dose")
//                                        Text("Coffee Dose")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("22 g")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing, .top])
//                                GroupBox{
//                                    HStack{
//                                        Image("grindSize")
//                                        Text("Grind Size")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("Medium")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                GroupBox{
//                                    HStack{
//                                        Image("brewTime")
//                                        Text("Brewtime")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("2 Min 30 Sec")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                GroupBox{
//                                    HStack{
//                                        Image("temp")
//                                        Text("Temperature")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("93.5")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                GroupBox{
//                                    HStack{
//                                        Image("ratio")
//                                        Text("Ratio")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("1 : 10")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                GroupBox{
//                                    HStack{
//                                        Image("water")
//                                        Text("Water")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("220 g")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                Spacer()
//                                GroupBox{
//                                    VStack{
//                                        Button("Select This Preset"){
//                                            toAdjustVariable = false
//                                            showSheet = false
//                                            coffeeDose = "22"
//                                            grindSize = 4
//                                            minutes = 2
//                                            seconds = 30
//                                            brewTemperature = "93.5"
//                                            coffeeToWaterRatio = 10
//                                            waterTotal = 220
////                                            isPassingValue = true
//                                            //                                                waterTotal = brewingWater
//                                            showBrewingVariableInput = true
//                                            print("masuk2")
//
//
//                                        }
//                                        NavigationLink(destination: BrewingVariables(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude), isActive: $showBrewingVariableInput){
//////                                        .sheet(isPresented: $showBrewingVariableInput, onDismiss: {
//////                                            print(self.showBrewingVariableInput)
////
////                                        }
//
////                                        {
//
////                                                .interactiveDismissDisabled(true)
//                                        }
//                                        //                                                                                        NavigationLink(destination: BrewingVariablesInput(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, coffeeDose: $coffeeDose, grindSize: $grindSize[indexGrindSizeSelected], minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, brewingWater: $waterTotal)){
//
//                                        //                                            Button(action: {
//                                        //
//                                        //                                                //                                                SimulationSwipeView(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, coffeeDose: $coffeeDose, grindSize: $grindSize, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, brewingWater: $waterTotal)
//                                        //                                                //                                                    .interactiveDismissDisabled(true)
//                                        //                                                toAdjustVariable = false
//                                        //                                                showSheet = false
//                                        //                                                coffeeDose = "22"
//                                        //                                                grindSize = 4
//                                        //                                                minutes = 2
//                                        //                                                seconds = 30
//                                        //                                                brewTemperature = "93.5"
//                                        //                                                coffeeToWaterRatio = 10
//                                        //                                                waterTotal = 220
//                                        //                                            }, label: {
//                                        //                                                Text("Select This Preset")
//                                        //
//                                        //                                            }
//                                        //                                            )
//                                    }
//                                    .padding(15)
//                                }
//                                .groupBoxStyle(DarkBrownGroupBox())
//
//                            }
//                            .navigationBarTitleDisplayMode(.inline)
//                            .navigationBarHidden(true)
//                        }
//                        .accentColor(Color("variableColor"))
//                    }
//                } else if action == "balance" {
//                    NavigationView{
//                        ScrollView{
//                            VStack{
//                                HStack{
//                                    Text("Balance Preset")
//                                        .font(.system(size: 34, weight: .heavy))
//                                        .foregroundColor(Color("fontColor"))
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                        .padding([.leading, .top])
//                                        .padding(.top)
//                                    Button{
//                                        showSheet.toggle()
//                                    } label: {
//                                        Image(systemName: "multiply").frame(width: 35, height: 35).background(Color.gray).cornerRadius(20).foregroundColor(Color.white).padding([.trailing])
//                                    }
//                                    .padding(.top)
//                                    .padding(.top)
//                                }
//
//                                GroupBox{
//                                    HStack{
//                                        Image(systemName: "scalemass")
//                                        Text("Coffee Dose")
//                                            .font(.headline)
//                                            .foregroundColor(.black)
//                                        Spacer()
//                                        Text("22 g")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing, .top])
//                                GroupBox{
//                                    HStack{
//                                        Image(systemName: "gearshape")
//                                        Text("Grind Size")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("Medium")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                GroupBox{
//                                    HStack{
//                                        Image(systemName: "timer")
//                                        Text("Brewtime")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("2 Min 30 Sec")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                GroupBox{
//                                    HStack{
//                                        Image(systemName: "thermometer")
//                                        Text("Temperature")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("93.5")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                GroupBox{
//                                    HStack{
//                                        Image(systemName: "divide")
//                                        Text("Ratio")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("1 : 15")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                GroupBox{
//                                    HStack{
//                                        Image(systemName: "drop")
//                                        Text("Water")
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("330 g")
//                                    }
//                                }
//                                .groupBoxStyle(TransparentGroupBox())
//                                .padding([.leading, .trailing])
//                                Spacer()
//                                GroupBox{
//                                    VStack{
////                                        Button("Select This Preset"){
////                                            toAdjustVariable = false
////                                            showSheet = false
////                                            coffeeDose = "22"
////                                            grindSize = 4
////                                            minutes = 2
////                                            seconds = 30
////                                            brewTemperature = "93.5"
////                                            coffeeToWaterRatio = 15
////                                            waterTotal = 330
////                                            //                                                isPassingValue = true
////                                            //                                                waterTotal = brewingWater
////                                            self.showBrewingVariableInput = true
////                                            print("masuk3")
////
////
////                                        }
////                                        .sheet(isPresented: $showBrewingVariableInput, onDismiss: {
////                                            print(self.showBrewingVariableInput)
////                                            print("masuk")
////
////                                        })
////
////                                        {
////                                            BrewingVariables(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude)
////                                                .interactiveDismissDisabled(true)
////                                        }
//                                        Button("Select"){
//                                            toAdjustVariable = false
//                                            showSheet = false
//                                            coffeeDose = "22"
//                                            grindSize = 4
//                                            minutes = 2
//                                            seconds = 30
//                                            brewTemperature = "93.5"
//                                            coffeeToWaterRatio = 15
//                                            waterTotal = 330
//
//                                            self.showBrewingVariableInput = true
//                                        }
//                                        NavigationLink(destination: BrewingVariables(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude), isActive: $showBrewingVariableInput){
//                                 }
//
//                                    }
//                                    .padding(15)
//                                }
//                                .groupBoxStyle(DarkBrownGroupBox())
//
//                            }
//
//                            .navigationBarTitleDisplayMode(.inline)
//                            .navigationBarHidden(true)
//                        }
//
//
//
//                        .accentColor(Color("variableColor"))
//                    }
//                }
//            }
//        onEnd: {
//            print("Dismissed")
//            showBrewingVariableInput = false
//        }
////        }
//        .accentColor(Color("variableColor"))
//
//    }
//}
//
////struct SelectPresetView_Previews: PreviewProvider {
////    static var previews: some View {
////        SelectPresetView(toAdjustVariable: .constant(false), coffeeDose: .constant("22"), grindSize: .constant(4), minutes: .constant(2), seconds: .constant(30), brewTemperature: .constant("93.5"), coffeeToWaterRatio: .constant(10), waterTotal: .constant(220))
////    }
////}
//
//// Custom Half Sheet Modifier...
//extension View {
//
//    //Binding Show Variable...
//    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()->SheetView, onEnd: @escaping()->())->some View {
//
//        // why we using overlay or background...
//        // because it will automatically use the swift ui frame Size only...
//        return self
//            .background(
//                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet, onEnd: onEnd)
//            )
//    }
//}
//
//// UIKit Integration...
//struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
//
//    var sheetView: SheetView
//    @Binding var showSheet: Bool
//    var onEnd: ()->()
//
//    let controller = UIViewController()
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(parent: self)
//    }
//
//    func makeUIViewController(context: Context) -> UIViewController {
//
//        controller.view.backgroundColor = .clear
//        return controller
//
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//
//        if showSheet {
//            // presenting Modal View...
//
//            let sheetController = CustomHostingController(rootView: sheetView)
//            sheetController.presentationController?.delegate = context.coordinator
//
//            uiViewController.present(sheetController, animated: true)
//        }
//        //        else {
//        //            // closing view when showSheet toggled again...
//        //            print("tutup")
//        //            uiViewController.dismiss(animated: true)
//        //        }
//    }
//
//    /// On Dismiss...
//    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
//
//        var parent: HalfSheetHelper
//
//        init(parent: HalfSheetHelper) {
//            self.parent = parent
//        }
//
//        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
//            parent.showSheet = false
//            parent.onEnd()
//        }
//    }
//}
//
//// Custom UIHostingController for halfSheet...
//class CustomHostingController<Content: View>: UIHostingController<Content> {
//
//    override func viewDidLoad() {
//
//        view.backgroundColor = .white
//
//        //setting presentation controller properties...
//        if let presentationController = presentationController as? UISheetPresentationController {
//            presentationController.detents = [
//                .medium(),
//                .large()
//            ]
//
//            // to show grab protion...
//            presentationController.prefersGrabberVisible = true
//        }
    }
    
}
