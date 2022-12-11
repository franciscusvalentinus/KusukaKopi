//
//  RatingAromaInfoVIew.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 28/10/22.
//

import SwiftUI

struct RatingAromaInfoVIew: View {
    
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        NavigationView{
            VStack ( spacing: 10){
                Text("Tingkat intens atau kuat dan nikmat yang ditimbulkan kopi setelah diseduh.")
                    .multilineTextAlignment(.leading)
                VStack ( spacing: 5){
                    //            Text("1. Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
                    //                .multilineTextAlignment(.leading)
                    HStack(alignment: .top){
                        Text("1.")
                        Text("Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text("2.")
                        Text("Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
                    }
                    
                    HStack(alignment: .top){
                        Text("3.")
                        Text("Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
                    }
                    
                    HStack(alignment: .top){
                        Text("4.")
                        Text("Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
                    }
                    
                    HStack(alignment: .top){
                        Text("5.")
                        Text("Kopi tidak memiliki aroma yang menggambarkan karakter kopi sama sekali")
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

struct RatingAromaInfoVIew_Previews: PreviewProvider {
    static var previews: some View {
        RatingAromaInfoVIew()
    }
}
