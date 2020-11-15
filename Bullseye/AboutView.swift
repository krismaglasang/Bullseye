//
//  AboutView.swift
//  Bullseye
//
//  Created by Kristian Maglasang on 15/11/20.
//

import SwiftUI

struct AboutView: View {
    
    let backgroundColor = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .foregroundColor(.black)
                .padding(.bottom, 20)
                .padding(.top, 20)
        }
    }
    
    struct TextViewStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(.black)
                .padding(.bottom, 20)
                .padding(.leading, 60)
                .padding(.trailing, 60)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(HeadingStyle())
                Text("This is Bulleye, the game where you can win points and earn fame by dragging a slider.").modifier(TextViewStyle())
                Text("Your goal is to place the slider as close possible to the target value. The closer you are, the more points you score.").modifier(TextViewStyle())
                Text("Enjoy!").modifier(TextViewStyle())
            }
            .navigationBarTitle("About Bullseye")
            .background(backgroundColor)
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
