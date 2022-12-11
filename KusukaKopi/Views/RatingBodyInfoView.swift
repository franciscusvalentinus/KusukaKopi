//
//  RatingBodyInfoView.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 01/11/22.
//

import SwiftUI

struct RatingBodyInfoView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView{
            VStack ( spacing: 10){
                Text("Sensasi yang diberikan kopi pada langit-langit mulut.")
                    .multilineTextAlignment(.leading)
                VStack( spacing: 5){
                    //            Text("1. Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
                    //                .multilineTextAlignment(.leading)
                    HStack(alignment: .top){
                        Text(" 1.")
                        Text("Kopi tidak memiliki body sama sekali.")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text("2.")
                        Text("Kopi memiliki body yang sangat tipis.")
                    }
                    
                    HStack(alignment: .top){
                        Text("3.")
                        Text("Kopi memiliki body yang tipis.             ")
                    }
                    
                    HStack(alignment: .top){
                        Text("4.")
                        Text("Kopi memiliki body yang cukup.         ")
                    }
                    
                    HStack(alignment: .top){
                        Text("5.")
                        Text("Kopi memiliki body yang tebal atau full bodied.")
                        Text(" ")
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

struct RatingBodyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RatingBodyInfoView()
    }
}
