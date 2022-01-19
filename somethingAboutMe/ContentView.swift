//
//  ContentView.swift
//  somethingAboutMe
//
//  Created by Nazar Babyak on 16.01.2022.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        NavigationView {
        ZStack{
            Image("aaa")
                .resizable()
                .ignoresSafeArea(.all)
                
            VStack{
                NavigationLink(destination: Home(), label: {
                 Text("About me")
                
                    .frame(width: 200, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .opacity(1)
                    .background(Color.black)
                    .cornerRadius(12)
                    .opacity(0.66)
                })
             }
        }
        .navigationTitle("")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
