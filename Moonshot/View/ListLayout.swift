//
//  ListLayout.swift
//  Moonshot
//
//  Created by Bouchedoub Rmazi on 11/4/2022.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
       
            List{
                ForEach(missions){ mission in
                    
                    NavigationLink{
                        MissionView(mission: mission
                                    , astronauts: astronauts)
                        
                    }
                label:{
                    HStack{
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        VStack{
                            Text(mission.displayName)
                                .font(.headline)
                              .foregroundColor(Color.white)
                            Text(mission.formattedLaunchDate ?? "N/A")
                            . font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        }
                       
                        
                    }
                  
                }
                    
                }
                
                
            }
            
           
            
            .preferredColorScheme(.dark)
            .listStyle(GroupedListStyle())
            .background(.darkBackground)
            
            
           
            
        }
        
    
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListLayout()
            .previewInterfaceOrientation(.portrait)
    }
}
