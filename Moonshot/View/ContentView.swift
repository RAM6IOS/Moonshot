//
//  ContentView.swift
//  Moonshot
//
//  Created by Bouchedoub Rmazi on 6/4/2022.
//

import SwiftUI



struct ContentView: View {
    //let astronaut = astronauts()
    //let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    //let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showing = true
   
    
    
    
    var body: some View {
        
    
        
        NavigationView{
            
            Group {
                if showing {
                    GridLayout()
                } else{
                   ListLayout()
                }
            }
            
            .navigationTitle("Moonshot")
            .navigationBarTitleDisplayMode(.inline)
             .toolbar {
                 Picker("Get notifications", selection: $showing) {
                     Text("GridLayout").tag(false)
                     Text("ListLayout").tag(true)
                 }
                 //.pickerStyle(.segmented)
            }
        }
        
            
            
         
         
        
        
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
 

