//
//  HeaderVIew.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                    .offset(x: 100)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: 600, height: 600)
                    .rotationEffect(.degrees(70))
                
                Image("mk")
                    .resizable()
                    .padding()
                    .scaledToFit()
                    .frame(width: 75)
                    .background(Material.thin)
                    .cornerRadius(20)
                    .offset(x: 100, y: 250)
            }
            Spacer()
        }
        .ignoresSafeArea()
        .offset(x: -100, y: -500)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
