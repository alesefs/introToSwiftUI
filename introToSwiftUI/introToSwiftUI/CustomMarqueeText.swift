//
//  CustomMarqueeText.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 06/06/24.
//

import SwiftUI

struct CustomMarqueeText: View {
    var body: some View {
        Home()
    }
}

#Preview {
    CustomMarqueeText()
}

struct Home: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 22) {
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    //MARK: Sample Image
                    Image("london")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(15)
                }
                .frame(height: 220)
                .padding(.horizontal)
                
//                Text("Tech, Video games, failed cooking attempts, vlogs and more!")
                Marquee(text: "Tech, Video games, failed cooking attempts, vlogs and more!", font: .systemFont(ofSize: 16, weight: .regular))
            }
            .padding(.vertical)
            .navigationTitle("Marquee Text")
        }
    }
}

struct Marquee: View {
    @State var text: String
    var font: UIFont
    
    //Storing text size
    @State var storeSize: CGSize = .zero
    //Mark: AnimationOffset
    @State var offset: CGFloat = 0
    //MARK: animation speed
    var animationSpeed: Double = 0.02
    var delayTime: Double = 0.5
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(text)
                .font(Font(font))
                .offset(x: offset)
                .padding(.horizontal, 15)
        }
        //MARK: opacity effect
        .overlay(content: {
            HStack {
                let color: Color = scheme == .dark ? .black : .white
                
                LinearGradient(colors: [
                    color,
                    color.opacity(0.7),
                    color.opacity(0.5),
                    color.opacity(0.3)
                ], startPoint: .leading, endPoint: .trailing)
                .frame(width: 20)
                
                Spacer()
                
                LinearGradient(colors: [
                    color,
                    color.opacity(0.7),
                    color.opacity(0.5),
                    color.opacity(0.3)
                ].reversed(), startPoint: .leading, endPoint: .trailing)
                .frame(width: 20)
            }
        })
        .disabled(true)// Disbaling Manual Scrolling
        .onAppear {
            
            //base text
            let baseText = text
            
            //MARK: continuos text animation
            //add spacing for continuos text
            (1...15).forEach { _ in
                text.append(" ")
            }
            
            //stop animation before next text
            storeSize = textSize()
            text.append(baseText)
            
            storeSize = textSize()
            
            //calc total secs based on text Width
            //our animation speed for eache character will be 0.02s
            let timing: Double = (animationSpeed * storeSize.width)
            
            //delay for 1st animation
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                withAnimation(.linear(duration: timing)) {
                    offset = -storeSize.width
                }
            }
        }
        //option if you want some delay for next animation
        .onReceive(Timer.publish(every: ((animationSpeed * storeSize.width) + delayTime), on: .main, in: .default).autoconnect()) { _ in
            //resetting offset to 0
            offset = 0
            
            withAnimation(.linear(duration: (animationSpeed * storeSize.width))) {
                offset = -storeSize.width
            }
        }
        //MARK: repeating marquee effect with help of timer
        
    }
    
    //Mark: Fecting Text Size for offset animation
    func textSize() -> CGSize {
        let attrs = [NSAttributedString.Key.font: font]
        
        let size = (text as NSString).size(withAttributes: attrs)
        
        return size
    }
}
