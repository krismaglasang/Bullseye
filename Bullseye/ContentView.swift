//
//  ContentView.swift
//  Bullseye
//
//  Created by Kristian Maglasang on 12/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var totalScore = 0
    @State var round = 1
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.white)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .modifier(ShadowStyle())
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .modifier(ShadowStyle())
        }
    }
    
    struct ShadowStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: .black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())
                Text("\(self.target)").modifier(ValueStyle())
            }
            
            Spacer()
            
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(.green)
                Text("100").modifier(LabelStyle())
            }
            
            Spacer()
            
            Button(action: {
                self.alertIsVisible = true
                totalPointsScored()
            }) {
                Text("Hit Me!").modifier(ButtonLargeTextStyle())
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound() + rewardPoints()) this round."
                ), dismissButton: .default(Text("\(alertTitle())")) {
                    target = Int.random(in: 1...100)
                    round += 1
                })
            }
            .background(Image("Button"))
            .modifier(ShadowStyle())
            
            Spacer()
            
            HStack{
                Button(action: {
                    startOver()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start Over").modifier(ButtonSmallTextStyle())
                    }
                }
                .background(Image("Button"))
                .modifier(ShadowStyle())
                
                Spacer()
                
                Text("Score: ")
                Text("\(totalScore)").modifier(ValueStyle())
                
                Spacer()
                
                Text("Round: ")
                Text("\(round)").modifier(ValueStyle())
                
                Spacer()
                
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonSmallTextStyle())
                        
                    }
                }
                .background(Image("Button"))
                .modifier(ShadowStyle())
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        return 100 - amountOff()
    }
    
    func totalPointsScored() {
        totalScore += pointsForCurrentRound()
    }
    
    func rewardPoints() -> Int {
        var reward = 0
        if amountOff() == 0 {
            reward += 100
        } else if amountOff() == 1 {
            reward += 50
        }
        
        return reward
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        
        return title
    }
    
    func startOver() {
        sliderValue = 50.0
        target = Int.random(in: 1...100)
        totalScore = 0
        round = 1
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
