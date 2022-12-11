//
//  ViewTest.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 19/10/22.
//

import Foundation
import SwiftUI


struct ViewTest: View{
    @State var dummyDataModels: [DummyDataModel]
    var body: some View{
        VStack {
            HStack{
                Text("My Recipe")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(Color("fontColor") )
                    .padding([.horizontal])
                Spacer()
                HStack{
                    Image(systemName: "plus.circle")
                        .foregroundColor(Color.blue)
                    Text("Add Recipe")
                        .font(.system(size: 15))
                        .foregroundColor(Color.blue)
                }
            }
            .padding([.horizontal])
            List(dummyDataModels.indices){ itemIndex in
                Section{
                    CardListRow(dummyDataModel: self.$dummyDataModels[itemIndex])
                }
                .background(.white)
            }
            .padding(EdgeInsets(top: 44, leading: 0, bottom: 0, trailing: 0))
            .edgesIgnoringSafeArea(.horizontal)
            .onAppear{
                UITableView.appearance().separatorStyle = .none
                UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear{
                UITableView.appearance().separatorStyle = .singleLine
            }
        }
            .navigationBarHidden(true)
//        VStack {
//            HStack{
//                Text("Testing")
//                Spacer()
//                Text("Text")
//            }
//            Spacer()
//            List{
//                ForEach(dummyDataModel){ card in
//                    VStack{
//                        HStack{
//                            VStack(alignment: .leading){
//                                Text(card.title)
//                                    .font(.system(size: 22, weight: .semibold))
//                                Text(card.subtitle)
//                                    .multilineTextAlignment(.leading)
//                                    .font(.system(size: 18, weight: .medium))
//
//                            }
//                            Spacer()
//                            HStack{
//                                Image(systemName: "star.leadinghalf.filled")
//                                Text(card.rating)
//                            }
//
//                        }
//                        Spacer()
//                        HStack{
//                            HStack{
//                                Image("brewTime")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 10)
//                                Text("BrewTime")
//                                    .font(.system(size: 10, weight: .light))
//                                    .lineLimit(2)
//                            }
//                            Spacer()
//                            HStack{
//                                Image("dose")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 10)
//                                Text("Dose")
//                                    .font(.system(size: 10, weight: .light))
//                                    .lineLimit(2)
//                            }
//                            Spacer()
//                            HStack{
//                                Image("water")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 10)
//                                Text(card.water)
//                                    .font(.system(size: 10, weight: .light))
//                                    .lineLimit(2)
//                            }
//                            Spacer()
//                            HStack{
//                                Image("temp")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 10)
//                                Text(card.temperature)
//                                    .font(.system(size: 10, weight: .light))
//                                    .lineLimit(2)
//                            }
//                            Spacer()
//                        }
//                    }
//
//                }
//            }
        }
        
    }
struct CardContentView: View{
    @Binding var dummyDataModel: DummyDataModel
    
    var body: some View{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(dummyDataModel.title)
                            .font(.system(size: 22, weight: .semibold))
                        Text(dummyDataModel.subtitle)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 18, weight: .medium))
                    }
                    Spacer()
                    VStack{
                        HStack{
                            Image(systemName: "star.leadinghalf.filled")
                            Text(dummyDataModel.rating)
                                .font(.system(size: 20,weight: .semibold))
                        }.padding([.trailing], 10)
                        Spacer()
                    }
                }.padding([.top],10)
                Spacer(minLength: 30)
                HStack{
                    HStack{
                        Image("brewTime")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 10)
                        Text(dummyDataModel.brewtime)
                            .font(.system(size: 10, weight: .light))
                            .lineLimit(2)
                    }
                    Spacer()
                    HStack{
                        Image("dose")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 10)
                        Text(dummyDataModel.dose)
                            .font(.system(size: 10, weight: .light))
                            .lineLimit(2)
                    }
                    Spacer()
                    HStack{
                        Image("water")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 10)
                        Text(dummyDataModel.water)
                            .font(.system(size: 10, weight: .light))
                            .lineLimit(2)
                    }
                    Spacer()
                    HStack{
                        Image("temp")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 10)
                        Text(dummyDataModel.temperature)
                            .font(.system(size: 10, weight: .light))
                            .lineLimit(2)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding([.horizontal])
    }
}

struct CardListRow: View{
    @Binding var dummyDataModel: DummyDataModel
    
    var body: some View{
        ZStack{
            Color.white
                .cornerRadius(12)
            CardContentView(dummyDataModel: $dummyDataModel)
        }
        .fixedSize(horizontal: false, vertical: false)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}



struct ViewTest_Previews: PreviewProvider{
    static var previews: some View{
        ViewTest(dummyDataModels: DummyDataModel.dummyData)
    }
}
