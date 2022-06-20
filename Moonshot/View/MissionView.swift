//
//  MissionView.swift
//  Moonshot
//
//  Created by Bouchedoub Rmazi on 8/4/2022.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
   
    var body: some View {
        GeometryReader { geometry in
                   ScrollView {
                       VStack {
                           Image(mission.image)
                               .resizable()
                               .scaledToFit()
                               .frame(maxWidth: geometry.size.width * 0.6)
                               .padding(.top)

                           VStack(alignment: .leading) {
                               Rectangle()
                                   .frame(height: 2)
                                   .foregroundColor(.lightBackground)
                                   .padding(.vertical)
                               VStack(alignment:.leading ){
                               Text("Mission Highlights")
                                   .font(.title.bold())
                                   .padding(.bottom, 5)
                               Text(mission.formattedLaunchDate)
                                   .font(.title2)
                               }
                               .padding(.bottom)
                               

                               Text(mission.description)
                               
                               Rectangle()
                                   .frame(height: 2)
                                   .foregroundColor(.lightBackground)
                                   .padding(.vertical)
                               
                               Text("Crew")
                                   .font(.title.bold())
                                   .padding(.bottom, 5)
                              

                           }
                           .padding(.horizontal)
                       }
                       .padding(.bottom)
                       ScrollView(.horizontal, showsIndicators: false) {
                           HStack {
                               ForEach(crew, id: \.role) { crewMember in
                                   HorizontalScrollView(astronaut: crewMember.astronaut, crewmember: crewMember)
                               }
                           }
                       }
                   }
               }
               .navigationTitle(mission.displayName)
               .navigationBarTitleDisplayMode(.inline)
               .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }

}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
