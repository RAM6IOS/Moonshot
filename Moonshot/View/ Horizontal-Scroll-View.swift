//
//   Horizontal-Scroll-View.swift
//  Moonshot
//
//  Created by Bouchedoub Rmazi on 10/4/2022.
//

import SwiftUI

struct HorizontalScrollView: View {
    let astronaut: Astronaut
    let crewmember : CrewMember
    var body: some View {
        NavigationLink{
            AstronautView(astronaut: astronaut)
        }
    label: {
        HStack{
            
            Image(astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(astronaut.name)
                    .foregroundColor(.white)
                    .font(.headline)
                Text(crewmember.role)
                    .foregroundColor(.secondary)
            }

            
        }
    }
    }
}

struct _Horizontal_Scroll_View_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        HorizontalScrollView(astronaut: astronauts["aldrin"]!, crewmember: CrewMember(role:"Command Pilot" , astronaut:astronauts["aldrin"]! )
        )
    }
}
