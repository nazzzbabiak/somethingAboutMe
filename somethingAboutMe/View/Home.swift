//
//  Home.swift
//  somethingAboutMe
//
//  Created by Nazar Babyak on 16.01.2022.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab = "house"
    var body: some View {
        ZStack(alignment: .bottom, content: {
            Image("bbb")
                .resizable()
                .ignoresSafeArea(.all)
            
            
            
            // Tap Bar.
            FirstPage(selectedTab: $selectedTab)
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
