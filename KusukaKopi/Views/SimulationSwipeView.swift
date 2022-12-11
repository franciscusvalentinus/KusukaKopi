//
//  SimulationSwipeView.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 30/08/22.
//

import SwiftUI

struct SimulationSwipeView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State private var showReviewPage1 = false
    
    
//    @State var isTimeRunning = false
    @State var timeRemaining  = 30
    let timeBlooming = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    @State var pourTimeRemaining = 0
    
    func convertSecondToTime(timeInSeconds : Int) ->
    String{
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        return String (format: "%02i:%02i", minutes, seconds)
    } // time step 6
    
    func convertTimeToSeconds(minutes : Int,
                              seconds: Int) ->
    Int{
        let minutes2 = minutes * 60 + seconds
        
        return minutes2
    } // time step 7
    
    //@binding dari addRecipe & add variable
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
    
    @State private var toCongratsView = false
    
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showCancelButton: Bool = false //on off cancel button
    @State private var title2: String = "V60 Simulation" //changeTitle
    @State var backgroundOffset: CGFloat = 0
    @State private var currentPage = 0
    @State private var isVisible = true
    //    @State var showButton : Bool = false
    
    //    let pages: [pageStep]
    
    var body: some View {
        ZStack{
            Color("simulationColor")
                .ignoresSafeArea()
            
            VStack{
                
                TabView (selection: $currentPage){
                    
                    let pages = pageStep.getStepData(coffeeDose: coffeeDose, grindSize: grindSize, minutes: minutes, seconds: seconds, brewTemperature: brewTemperature, coffeeToWaterRatio: coffeeToWaterRatio, brewingWater: brewingWater)
                    //masukkan var coffeeDose dst ke dalam pageStep.getStepData(coffeeDose,grindSize)
                    
                    ForEach (0 ..< pages.count) { index in
                        boardView(page: pages[index])
                            .tag(index)
                            .padding()
                        //                            .background(.cyan)
                        
                    }
                }// tabView
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                    .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                //                .background(.green)
                Spacer()
                
                HStack{
                    
                    
                    Button( action: { withAnimation(.easeInOut(duration: 1.0)){
                        
                        if currentPage > 0 {
                            
                            self.currentPage = (self.currentPage - 1) % pageStep.getCount()
                        }
                        
                        
                    }
                        
                    }) { //conditional statement (tidak ada tombol kiri ketika di halaman simulation pada step pertama)
                        if currentPage == 0 {
                            Image(systemName: "chevron.left.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("buttonBGColor"))
                                .hidden()
                        } else{
                            Image(systemName: "chevron.left.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("buttonBGColor"))
                        }
                    }
                    
                    
                    Spacer()
                    VStack{
                        //                        Spacer()
                        if currentPage == 5 {
                            
                            Text(convertSecondToTime(timeInSeconds:timeRemaining))
                                .padding()
                                .font(.system(size:30))
                                .foregroundColor(Color.primary)
                                .background(Color("timeColor"))
//                                .background(Color.black)
                                .cornerRadius(20)
                                .onReceive(timer) {
                                    _ in if self.timeRemaining > 0 {
                                        timeRemaining -= 1
                                    }
                                }
                                
                        }else if currentPage == 6{
                            
                            Text(convertSecondToTime(timeInSeconds:pourTimeRemaining))
                                .padding()
                                .font(.system(size:30))
                                .foregroundColor(Color.primary)
                                .background(Color("timeColor"))
//                                .background(Color.black)
                                .cornerRadius(20)
                                .onReceive(timer) {
                                    _ in if self.pourTimeRemaining > 0 {
                                        pourTimeRemaining -= 1
                                    }
                                }
                        }
                    }
                    
                    
                    Spacer()
                    Button( action: { withAnimation(.easeInOut(duration: 1.0)){
                        
                        self.currentPage = (self.currentPage + 1) % pageStep.getCount()
                        
                    }
                        
                    }) { //conditional statement (right button to checkmark) & navigation when action button checkmark
                        //Note buat surya : Kalau mau nyambungin ke codinganmu yg "BrewingVariableInput()"
                        if currentPage == 8 {

                            VStack{
                                NavigationLink(destination:  ReviewPage(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, coffeeDose: $coffeeDose, grindSize: $grindSize, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, brewingWater: $brewingWater, showAddRecipe: $showAddRecipe)){
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color("buttonBGColor"))
                                }
//                                Button {
//                                    self.showReviewPage1 = true
//                                } label: {
//                                    Image(systemName: "checkmark.circle.fill")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(Color("buttonBGColor"))
//                                }
//                                .sheet(isPresented: $showReviewPage1, onDismiss: {
//                                    print(self.showReviewPage1)
//                                    //                                        .presentationDetents([.medium])
//                                }){
//                                    ReviewPage(recipeName: $recipeName, beans: $beans, variety: $variety, region: $region, altitude: $altitude, coffeeDose: $coffeeDose, grindSize: $grindSize, minutes: $minutes, seconds: $seconds, brewTemperature: $brewTemperature, coffeeToWaterRatio: $coffeeToWaterRatio, brewingWater: $brewingWater)
//                                }
                            }
//                            NavigationLink(destination: congrats(), label: {
//                                Image(systemName: "checkmark.circle.fill")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 50, height: 50)
//                                    .foregroundColor(Color("buttonBGColor"))
//                            })

                            
                            //                                                .padding()
                            //                                                .background(Circle().fill(Color.purple))
                        } else {
                            Image(systemName: "chevron.right.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("buttonBGColor"))
                            //                                                    .background(Circle().fill(Color.purple))
                        }
                    }
                }
                .padding()
                
                
            }// VStack
            .navigationTitle(title2)
            .navigationBarTitleDisplayMode(.inline)
            .padding()
            
        }
        .onAppear {
            pourTimeRemaining = convertTimeToSeconds(minutes : minutes, seconds: seconds) - timeRemaining
        }
    }// bodyview
}
struct SimulationSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            //            SimulationSwipeView( pages: <#[SimulationSwipeView.introPage]#>)
            Spacer()
        }
    }
}



struct boardView: View{
    
    let page : pageStep
    
    //        let systemImageName: String
    //        let title: String
    //        let description: String
    //        let stepOf: String
    
    var body: some View{
        VStack{
            
            
            //stepOff
            Text(self.page.stepOf)
                .font(.system(size: 13))
                .foregroundColor(Color.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.bottom],2)
            //                .background(.yellow)
            //                .multilineTextAlignment(.leading)
            //                .frame(width: 300, height: 30, alignment: .leading)
            //                    .background(.cyan)
            //                .padding(.top,-100)
            
            Text(self.page.title)
                .bold()
                .font(.system(size: 20))
                .foregroundColor(Color.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding([.bottom],5)
            //                .background(.red)
            
            Image(self.page.systemImageName)
                .resizable()
            //                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(width: 288, height: 288, alignment: .leading)
                .cornerRadius(20)
                .padding(.bottom,5 )
            //                .padding(.top,-60)
            
            //                    .offset(y: -60)
            
            
            
            Text(self.page.description)
                .font(.system(size: 20))
                .foregroundColor(Color.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            //                .frame(width: 300, height: 133, alignment: .topLeading)
            //                                .background(.cyan)
            //                    .offset(y: -40)
            //                .padding(.top,5)
            //                .background(.orange)
                .multilineTextAlignment(.leading)
                
            
            
            Spacer()
            
        }
        .padding(.horizontal)
        .frame(maxHeight: .infinity)
        //        .padding(.bottom,50)
        //        Spacer()
        //            .multilineTextAlignment(.leading)
    }
}

//struct boardView_Previews: PreviewProvider {
//    static var previews: some View {
//        boardView(systemImageName: "Step 1", title: "Step #1", description: "Lorem ipsum dolor akakwwjadowafwaf kowajf wjaofjow fawofjw")
//    }
//}


extension SimulationSwipeView{
    
    private var cancelButton : some View{
        //cancel button
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
            Text("Cancel")
            
        })
    }
    static var step = pageStep(systemImageName:"Step 1", title: "Grind th Coffee", description: "Grind 17 g of coffee to ground (Medium)", stepOf: "1 of 9")
    
    static var previews: some View {
        
        boardView(page: step)
    }
}




struct pageStep{
    
    let systemImageName: String
    let title: String
    let description: String
    let stepOf: String
    
    static func getCount() -> Int{
        return 9
    }
    
    //cari variable yg pake parameter
    static func getStepData(
        coffeeDose: String,
        grindSize: String,
        minutes: Int,
        seconds: Int,
        brewTemperature: String,
        coffeeToWaterRatio: Double,
        brewingWater: String
    ) -> [pageStep] {
        var pS:[pageStep] = [pageStep]()
        
        pS.append(pageStep(systemImageName:"Step 1", title: "Grind th Coffee", description: "Grind \(coffeeDose) g of coffee to ground (\(grindSize))", stepOf: "STEP 1 OF 9"))
        pS.append(pageStep(systemImageName:"Step 2", title: "Filter Placement", description: "To start off, you need to take a piece of filter and put it into the cup. Make sure it goes all the way through and there's no edge showing.", stepOf: "STEP 2 OF 9"))
        pS.append(pageStep(systemImageName:"Step 3", title: "Rinse the Filter", description: "Before you use the filter, Rinse the filter first with hot water to gets rid of the paper taste. After that, throw the rinse water before you start to brew.", stepOf: "STEP 3 OF 9"))
        pS.append(pageStep(systemImageName:"Step 4", title: "Place The Coffee", description: "Place the coffee ground to the filter. Gently tap the filter to make the coffee ground has a flat surface.", stepOf: "STEP 4 OF 9"))
        pS.append(pageStep(systemImageName:"Step 5", title: "Pour In", description: "Your water should be around \(brewTemperature)°C. Pour \(brewingWater) g of water in a circular pattern from the outside of the filter towards the centre.", stepOf: "STEP 5 OF 9"))
        pS.append(pageStep(systemImageName:"Step 6", title: "Blooming", description: "This initial wait is called the bloom and gives time for the gasses trapped in the coffee to escape.", stepOf: "STEP 6 OF 9"))
        pS.append(pageStep(systemImageName:"Step 7", title: "Pour In", description: "Pour the rest of the water gently. Aim for a total brew time of \(minutes).\(seconds) minutes (from the start of the first pour until the last drop.)", stepOf: "STEP 7 OF 9"))
        pS.append(pageStep(systemImageName:"Step 8", title: "Pour is Complete", description: "When there is no more drop on the filter, it means the pouring process is complete. Take the cup and throw the filter.", stepOf: "STEP 8 OF 9"))
        pS.append(pageStep(systemImageName:"Final Step", title: "Serve the Coffee", description: "Put the coffee from the mug to you cup", stepOf: "STEP 9 OF 9"))
        
        
        return pS
        
    }
}





