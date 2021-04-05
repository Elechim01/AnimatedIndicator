//
//  HomeView.swift
//  AnimatedIndicator
//
//  Created by Michele Manniello on 29/03/21.
//

import SwiftUI

struct HomeView: View {
//    Properties
    @State var rotateBall = false
    @State var showPopUp = false
//    Color Scheme for dark mode adoption..
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack {
            Toggle(isOn: $rotateBall, label: {
                Text("Rotate Ball")
            })
            .padding()
            .padding(.vertical)
//            custom shadow button..
            Button(action:{
                withAnimation(.spring()) {
                    showPopUp.toggle()
                }
            }, label: {
                    Text("Show PopUP")
                        .foregroundColor(.black)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(scheme == .dark ? Color.black : Color.white)
                        .cornerRadius(8)
//                shadows...
                        .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.primary.opacity(0.1), radius: 5, x: -5, y: -5)
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            ZStack{
                if showPopUp{
                    Color.primary.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.spring()){
                                showPopUp.toggle()
                            }
                        }
                DribbleAnimatedView(showPopup: $showPopUp, rotateBall: $rotateBall)
                    .offset(y: showPopUp ? 0 : UIScreen.main.bounds.height)
                }
                
            }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
