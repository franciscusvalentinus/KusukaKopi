//
//  RatingFlavourInfoView.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 01/11/22.
//

import SwiftUI

struct RatingFlavourInfoView: View {
    
    @Environment(\.presentationMode) var presentation1
    
    var body: some View {
        NavigationView{
            VStack ( spacing: 10){
                Text("Kualitas dan kompleksitas kopi yang di dapatkan saat meminum kopi dimana uap akan naik dari mulut ke hidung.")
                    .multilineTextAlignment(.leading)
                VStack ( spacing: 5){
                    //            Text("1. Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
                    //                .multilineTextAlignment(.leading)
                    HStack(alignment: .top){
                        Text("1.")
                        Text("Kopi memiliki kualitas yang buruk dan rasa kopi yang timbul tidak kompleks.")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text(" 2.")
                        Text("Kopi memiliki kualitas yang kurang dan rasa kopi yang timbul kurang kompleks.")
                    }
                    
                    HStack(alignment: .top){
                        Text("3.")
                        Text("Kopi memiliki kualitas yang cukup dan rasa kopi yang timbul cukup kompleks.")
                    }
                    
                    HStack(alignment: .top){
                        Text("4.")
                        Text("Kopi memiliki kualitas yang cukup dan rasa kopi yang timbul kompleks.")
                    }
                    
                    HStack(alignment: .top){
                        Text("5.")
                        Text("Kopi memiliki kualitas yang baik dan rasa kopi yang timbul kompleks.")
                    }
                    
                }
                Spacer()
                    .padding(.leading)
            }
            .navigationBarItems(trailing: Button(action: {
                self.presentation1.wrappedValue.dismiss()
            }, label: {
                Text("Done")
                    .foregroundColor(.blue)
            }))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.yellow)
        .padding([.leading,.trailing,.top,.bottom])
    }
}

struct RatingFlavourInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RatingFlavourInfoView()
    }
}
