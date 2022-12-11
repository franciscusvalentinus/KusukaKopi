//
//  RatingAcidityInfoView.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 01/11/22.
//

import SwiftUI

struct RatingAcidityInfoView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView{
            VStack ( spacing: 10){
                Text("Tingkat rasa asam pada kopi.                            ")
                    .multilineTextAlignment(.leading)
                VStack( spacing: 5){
                    //            Text("1. Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
                    //                .multilineTextAlignment(.leading)
                    HStack(alignment: .top){
                        Text(" 1.")
                        Text("Kopi memiliki rasa asam yang sangat intens dan tidak nyaman.")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text("2.")
                        Text("Kopi memiliki rasa asam yang intens tetapi dapat diterima.")
                    }
                    
                    HStack(alignment: .top){
                        Text("3.")
                        Text("Kopi memiliki rasa asam yg cukup.               ")
                    }
                    
                    HStack(alignment: .top){
                        Text("4.")
                        Text("Kopi kurang memiliki rasa asam.                   ")
                    }
                    
                    HStack(alignment: .top){
                        Text("5.")
                        Text("Kopi tidak memiliki rasa asam dan atau termasuk dalam kategori low acidity.")
                        Text("     ")
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
//        .background(Color.orange)
        .padding([.leading,.trailing,.top,.bottom])
    }
}

struct RatingAcidityInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RatingAcidityInfoView()
    }
}
