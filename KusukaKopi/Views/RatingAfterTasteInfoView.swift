//
//  RatingAfterTasteInfoView.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 01/11/22.
//

import SwiftUI

struct RatingAfterTasteInfoView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView{
            VStack ( spacing: 10){
                Text("Lamanya kopi dapat mempertahankan rasa didalam mulut setelah ditelan atau dibuang.")
                    .multilineTextAlignment(.leading)
                VStack ( spacing: 5){
                    //            Text("1. Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
                    //                .multilineTextAlignment(.leading)
                    HStack(alignment: .top){
                        Text("1.")
                        Text("Kopi tidak memiliki after taste.")
                        Text("            ")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text("2.")
                        Text("Kopi memiliki after taste yang sangat cepat hilang.")
                    }
                    
                    HStack(alignment: .top){
                        Text("3.")
                        Text("Kopi memiliki after taste yang kurang dapat bertahan.")
                    }
                    
                    HStack(alignment: .top){
                        Text("4.")
                        Text("Kopi memiliki after taste yang cukup dapat bertahan.")
                    }
                    
                    HStack(alignment: .top){
                        Text("5.")
                        Text("Kopi memiliki after taste yang dapat bertahan lama.")
                    }
                    
                }
                Spacer()
                    .padding(.leading)
            }
            .navigationBarItems(trailing: Button(action: {
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Done")
                    .foregroundColor(.blue)

            }))
        }
       
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.blue)
        .padding([.leading,.trailing,.top,.bottom])
    }
}

struct RatingAfterTasteInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RatingAfterTasteInfoView()
    }
}
