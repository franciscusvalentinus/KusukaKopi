//
//  InfoView.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 27/10/22.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DoseView2: View {
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            VStack (spacing: 10){
                Text("Banyaknya biji kopi yang digunakan.")
                    .multilineTextAlignment(.leading)
                VStack ( spacing: 5){
                    HStack(alignment: .top){
                        Text("Kurang banyak:")
                        Text("Rasa kopi seperti air atau watery")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text("Pas:")
                        Text("Rasa kopi balance")
                    }
                    
                    HStack(alignment: .top){
                        Text("Terlalu banyak:")
                        Text("Rasa kopi terlalu kompleks")
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
        }//NavView
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.blue)
        .padding([.leading,.trailing,.top,.bottom])
    }
}

struct grindSizeInfo : View{
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            VStack (spacing: 10){
                Text("Ukuran hasil giling dari biji kopi")
                    .multilineTextAlignment(.leading)
                VStack ( spacing: 5){
                    HStack(alignment: .top){
                        Text("Terlalu kasar: ")
                        Text("Hasil gilingan kopi terasa seperti parutan lada")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text("Pas: ")
                        Text("Hasil gilingan kopi terasa seperti pasir halus")
                    }
                    
                    HStack(alignment: .top){
                        Text("Terlalu halus: ")
                        Text("Hasil gilingan kopi terasa lebih halus daripada garam dapur")
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
        }//NavView
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.blue)
        .padding([.leading,.trailing,.top,.bottom])
    }
}

struct brewTimeInfo : View{
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            VStack (spacing: 10){
                Text("Waktu yang dibutuhkan untuk menyeduh kopi")
                    .multilineTextAlignment(.leading)
                VStack ( spacing: 5){
                    HStack(alignment: .top){
                        Text("Terlalu Cepat: ")
                        Text("Rasa kopi terlalu asam")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text("Pas: ")
                        Text("Rasa kopi tidak terlalu asam ataupun pahit")
                    }
                    
                    HStack(alignment: .top){
                        Text("Terlalu lama: ")
                        Text("Rasa kopi terlalu pahit")
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
        }//NavView
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.blue)
        .padding([.leading,.trailing,.top,.bottom])
    }
}

struct temperatureInfo : View{
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            VStack (spacing: 10){
                Text("Tinggi suhu air yang dibutuhkan untuk menyeduh kopi")
                    .multilineTextAlignment(.leading)
                VStack ( spacing: 5){
                    HStack(alignment: .top){
                        Text("Terlalu Rendah: ")
                        Text("Kopi memiliki rasa asin ataupun gurih")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text("Pas: ")
                        Text("Kopi tidak memiliki rasa asin ataupun gurih")
                    }
                    
                    HStack(alignment: .top){
                        Text("Terlalu Tinggi: ")
                        Text("Kopi memiliki rasa seperti pahit gosong (smokey)")
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
        }//NavView
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.blue)
        .padding([.leading,.trailing,.top,.bottom])
    }
}

struct waterInfo : View{
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            VStack (spacing: 10){
                Text("Banyaknya air yang digunakan untuk membuat V60")
                    .multilineTextAlignment(.leading)
                VStack ( spacing: 5){
                    HStack(alignment: .top){
                        Text("Terlalu Sedikit: ")
                        Text("Rasa kopi terlalu intens")
                    }
                    
                    
                    HStack(alignment: .top){
                        Text("Pas: ")
                        Text("Rasa kopi balance")
                    }
                    
                    HStack(alignment: .top){
                        Text("Terlalu Banyak: ")
                        Text("Rasa kopi seperti air (watery)")
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
        }//NavView
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.blue)
        .padding([.leading,.trailing,.top,.bottom])
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct DoseView2_Previews: PreviewProvider {
    static var previews: some View {
        DoseView2()
    }
}

struct grindSizeInfo_Previews: PreviewProvider{
    static var previews: some View{
        grindSizeInfo()
    }
}

struct waterInfo_Previews: PreviewProvider{
    static var previews: some View{
        waterInfo()
    }
}
