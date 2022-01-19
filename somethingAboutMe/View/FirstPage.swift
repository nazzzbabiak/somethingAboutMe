//
//  NavigationView.swift
//  somethingAboutMe
//
//  Created by Nazar Babyak on 16.01.2022.
//

import SwiftUI

struct FirstPage: View {
    
    @Binding var selectedTab: String
    
    
    @State var tabPoints: [CGFloat] = []
    
    var body: some View {
        
        
        
        HStack(spacing: 44) {
            
            // Tap Bar Buttons.
            
            ZStack{
                HStack{
                    
            TapBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
                   
            TapBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
            TapBarButton(image: "person.crop.circle", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
            TapBarButton(image: "drop", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
            TapBarButton(image: "pawprint", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
                }
            }
        }
        
        .padding()
//        .background(Color.black
//                        .clipShape(TabCurve(tabPoint: getCurvePoint()))
//        )
        .cornerRadius(35)
        .padding(.horizontal)
    }
        
    
    func getCurvePoint()->CGFloat {
        
        
        if tabPoints.isEmpty {
            return 10
            
        }
        else {
            switch selectedTab {
            case "house": return tabPoints[0]
            case "person": return tabPoints[1]
            case "person.crop.circle": return tabPoints[2]
            case "drop": return tabPoints[3]
            
            default: return tabPoints[4]
            }
        }
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct TapBarButton: View {
    
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    var body: some View{
        
        GeometryReader{reader -> AnyView in
            
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                
                
                if tabPoints.count <= 4{
                    tabPoints.append(midX)
                }
            }
            
            return AnyView (
                Button(action: {
                    //зміна кнопок
                    
                    withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.4)){
                        selectedTab = image
                    }
                } , label: {
                    
                    // заповнення кольором коли вібраний елемент
                    
                    
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundColor(.red)
                    
                        .offset(y: selectedTab == image ? -8 : 0 )
                    
                })
                
                // максимальна рамка
                    .frame(width: .infinity, height: .infinity)
            )
        }
        //максимальна висота рамки
        .frame(height: 50)
        
    }
}
