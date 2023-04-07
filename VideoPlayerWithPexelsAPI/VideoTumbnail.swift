//
//  VideoTumbnail.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//

import SwiftUI

struct VideoTumbnail: View {
    var url: URL
    var title: String
    var views: String
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                .overlay(
                    Image(systemName: "play.fill")
                        .font(.title)
                        .padding()
                        .background(
                            Material.ultraThin
                        )
                        .clipShape(Circle())
                )
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                Text(views)
                                    .padding(2)
                                    .background(
                                        Material.ultraThin
                                    )
                                    .cornerRadius(5)
                                
                                Text(title)
                                    .padding(2)
                                    .background(
                                        Material.ultraThin
                                    )
                                    .cornerRadius(5)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium, design: .monospaced))
                            Spacer()
                        }
                        
                    }
                )
        } placeholder: {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red.gradient)
                .frame(width: 300, height: 200)
                .overlay(
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5)
                        .padding()
                        .background(
                            Material.ultraThin
                        )
                        .clipShape(Circle())
                )
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Test")
                                
                                Text("Testalsfd")
                            }
                            .padding()
                            .redacted(reason: .placeholder)
                            
                            Spacer()
                        }
                        
                    }
                )
        }
        
    }
}

struct VideoTumbnail_Previews: PreviewProvider {
    static var previews: some View {
        VideoTumbnail(url: URL(string: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elPWoa1_WCFHQC2L-Ek9HAHaEK%26pid%3DApi&f=1&ipt=4b22d837e60035c363a58b2339f8255ca98883f81ff5bca7ce1b2c4e8ebb736b&ipo=images")!, title: "Every day carry", views: "1.2k")
    }
}
