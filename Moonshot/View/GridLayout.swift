//
//  GridLayout.swift
//  Moonshot
//
//  Created by Bouchedoub Rmazi on 11/4/2022.
//

import SwiftUI

struct GridLayout: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showing = true
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        
      
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        VStack{
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)

                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(Color.white)
                                    Text(mission.formattedLaunchDate ?? "N/A")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                        
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.darkBackground)
                            }
                         }
                        
                            
                        }
                        
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                            
                        )
                        .padding([.horizontal, .bottom])

                        
                    }
                }
            }
            .preferredColorScheme(.dark)
            .background(.darkBackground)
            
        
    }
}

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayout()
    }
}
