//
//  DribbleAnimatedView.swift
//  AnimatedIndicator
//
//  Created by Michele Manniello on 05/04/21.
//

import SwiftUI

struct DribbleAnimatedView: View {
    //    Color Scheme for dark mode adoption..
    @Environment(\.colorScheme) var scheme
    @Binding var showPopup : Bool
    @Binding var rotateBall : Bool
//    Animation Proprerties..
    @State var animateBall = false
    @State var animateRotation = false
    
    
    var body: some View {
        ZStack {
            (scheme == .dark ? Color.black : Color.white)
                .frame(width: 150, height: 150)
                .cornerRadius(14)
                .shadow(color: Color.primary.opacity(0.07), radius: 5, x: 5, y: 5)
                .shadow(color: Color.primary.opacity(0.07), radius: 5, x: -5, y: -5)
            
//            Ball Shadow
            Circle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 40, height: 40)
//            Rotating in X Axis...
                .rotation3DEffect(
                    .init(degrees: 60),
                    axis: (x: 1, y: 0.0, z: 0.0),
                    anchor: .center,
                    anchorZ: 0.0,
                    perspective: 1.0)
                .offset(y: 35)
                .opacity(animateBall ? 1 : 0)
            Image("dribble")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .rotationEffect(.init(radians: rotateBall && animateRotation ? 360 : 0))
                .offset(y: animateBall ? 10 : -25)
            
        }
        .onAppear{
            doAnimation()
        }
    }
    func doAnimation(){
        withAnimation(Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)){
            animateBall.toggle()
        }
        withAnimation(Animation.linear(duration: 0.8).repeatForever(autoreverses: true)){
            animateRotation.toggle()
        }
        
    }
}

struct DribbleAnimatedView_Previews: PreviewProvider {
    @State  static var rotateBall = false
    @State static var showPopUp = false
    static var previews: some View {
        DribbleAnimatedView(showPopup: $showPopUp, rotateBall: $rotateBall)
    }
}
