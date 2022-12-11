//
//  RatingSweetnessInfoView.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 01/11/22.
//

import SwiftUI

struct RatingSweetnessInfoView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView{
            VStack ( spacing: 10){
                Text("Sensasi rasa manis yang dihasilkan oleh kopi")
                    .multilineTextAlignment(.leading)
                VStack ( spacing: 5){
                    //
                    HStack(alignment: .top){
                        Text("1.")
                        Text("Kopi tidak memiliki sensai rasa manis.      ")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text(" 2.")
                        Text("Kopi kurang memiliki sensasi rasa manis. ")
                    }
                    
                    HStack(alignment: .top){
                        Text("3.")
                        Text("Kopi cukup memiliki sensasi rasa manis. ")
                    }
                    
                    HStack(alignment: .top){
                        Text("4.")
                        Text("Kopi memiliki sensasi rasa manis yang kompleks.  ")
                        Text(" ")
                    }
                    
                    HStack(alignment: .top){
                        Text("5.")
                        Text("Kopi memiliki sensasi rasa manis yang kompleks.   ")
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
//        .background(Color.yellow)
        .padding([.leading,.trailing,.top,.bottom])
    }
}

struct RatingSweetnessInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RatingSweetnessInfoView()
    }
}
