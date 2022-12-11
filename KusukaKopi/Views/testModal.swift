//
//  testModal.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 08/11/22.
//

import SwiftUI

struct testModal: View {
    @State var showingModal = false
    
    var body: some View {
        Button(action: {
            self.showingModal.toggle()
        }) {
            Text("Show Modal")
        }
        .sheet(
            isPresented: $showingModal,
            content: { ModalPopup(showingModal: self.$showingModal) }
        )
    }
}

struct ModalPopup : View {
    @Binding var showingModal:Bool
    
    var body: some View {
        NavigationView{
            VStack{
                Text("adsabdhbsahbs")
            }
            .navigationBarItems(trailing: HStack{
                Button(action: {
                    self.showingModal = false
                }) {
                    Text("Dismiss").frame(height: 60)
//                        .interactiveDismissDisabled(true)
                }
            })
        }
    }
}

struct testModal_Previews: PreviewProvider {
    static var previews: some View {
        testModal()
    }
}
