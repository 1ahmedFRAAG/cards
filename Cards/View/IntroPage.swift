//
//  IntroPage.swift
//  Cards
//
//  Created by AHMED on 02/07/2025.
//

import SwiftUI

struct IntroPage: View {
    /// view proparties
    @State private var activeCard: Card? = cards.first
    
    var body: some View {
        ZStack {
            customizedBackGround()
            
            VStack (spacing: 40){
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cards) { card in
                            carouselCardView(card)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                    
            }.padding(15)
        }
    }
    
    @ViewBuilder
    private func customizedBackGround() -> some View {
        GeometryReader {
            let size = $0.size
            ZStack {
                ForEach(cards) {
                    Image($0.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                        .frame(width: size.width * 0.9, height: size.height * 0.9)
                        .opacity(activeCard?.id == $0.id ? 1 : 0)
                        
                }
                
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.4))
                    .ignoresSafeArea()
                
            }
            .compositingGroup()
            .blur(radius: 90, opaque: true)
            .ignoresSafeArea()
        }
    }
    
    // carousel Card view
    @ViewBuilder
    private func carouselCardView(_ card: Card) -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            let frame = proxy.frame(in: .global)
            let screenMid = UIScreen.main.bounds.width / 2
            let offset = abs(screenMid - frame.midX)
            let rotation = (offset / screenMid) * 10
            
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 300)
                .shadow(color: Color.black.opacity(0.4) ,radius: 10, x: 1,y: 0)
                .shadow(radius: 5)
                
                .rotationEffect( frame.midX > screenMid ? .degrees(Double(-rotation)) : .degrees(Double(rotation)), anchor: .bottom)
                
            
        }.frame(width: 220)
            
    }
}

struct IntroPage_Previews: PreviewProvider {
    static var previews: some View {
        IntroPage()
    }
}
