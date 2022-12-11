//
//  FlavourRatingView.swift
//  KusukaKopi
//
//  Created by Firman Bachmid on 26/10/22.
//

import SwiftUI

struct FlavourRatingView: View {
    
    @Binding var rating: Int
        
        var body: some View {
            ratingView
                .overlay(overlayView.mask(ratingView))
        }
        
        private var ratingView: some View {
            HStack(spacing: 15) {
                ForEach(1..<6) { index in
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundColor(rating >= index ? .gray : .gray)
                        .onTapGesture {
                            withAnimation {
                                rating = index
                            }
                        }
                }
            }
        }
        
        private var overlayView: some View {
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.yellow)
                                    
                        .frame(width: CGFloat(rating) / 5 * proxy.size.width)
                        .background(Color.green)
                }
            }
            .allowsHitTesting(false)
        }
    
}

struct FlavourRatingView_Previews: PreviewProvider {
    static var previews: some View {
        FlavourRatingView(rating: .constant(0))
    }
}
