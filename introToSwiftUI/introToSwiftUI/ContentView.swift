//
//  ContentView.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 10/03/24.
//

import SwiftUI



struct ContentView: View {
    
    @State var count: Int = 0
    
    var body: some View {
        /*VStack {
//            Text("Hello, world!")
//                .padding(.all)
//                .background(Color.green)
//                .foregroundColor(Color.white)
//                .cornerRadius(8.0)
//                .padding(.all, 10.0)
//                .background(Color.blue)
//                .cornerRadius(8.0)
//                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
//                .cornerRadius(8.0)
//                .accessibilityLabel("Hello, world!")
            
            Spacer()
            
            Image("logo")
                .resizable()
                .aspectRatio(
                    contentMode: .fit
                )
            
            
            Spacer()
            
            HStack() {
                Spacer()
                Text("Hello!")
                Spacer()
                Text("world!")
                Spacer()
            }
            
            Spacer()
        }*/
        
        VStack {
            
            let cityName = "london"
            
            ZStack {
                Image(IconAzure().iconOkName(iconName: cityName))
                    .resizable()
                    .cornerRadius(10.0)
                    .aspectRatio(
                        contentMode: .fit
                    )
                
                
                VStack(alignment: .center) {
                    Text("CN Tower")
                        .font(.largeTitle)
                        .padding([.top, .leading, .trailing])
                    Text(cityName)
                        .font(.caption)
                        .padding([.leading, .bottom, .trailing])
                }
                .padding()
                .foregroundColor(Color.white)//vale paara tudo no Vstack
                .background(Color.black)
                .opacity(0.8)
                .cornerRadius(8.0)
            }
            .padding()
            
            ZStack {
                Image("london")
                    .resizable()
                    .cornerRadius(10.0)
                    .aspectRatio(
                        contentMode: .fit
                    )
                    .padding()
                
                VStack(alignment: .center) {
                    Text("Big Ben")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Text("London")
                        .font(.caption)
                        .foregroundColor(Color.white)
                }
                .padding()
                .background(Color.black)
                .opacity(0.8)
                .cornerRadius(8.0)
            }
            
            
            Spacer()
            
            //Button with label view
            Button(action: {
                print("hello world")
            }, label: {
                HStack {
                    Image(systemName: "play.fill")
                    Text("Button")
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(8.0)
            })
            
            //closure => lambda kotlin => () -> Void => (parameter) -> return type ... se for ultimo parametro, pode passar como objeto { ... }
            
            HStack {
                Spacer()
                
                //Button trailing closure
                Button(
                    "add + 2"
                ) {
//                    print("hello world")
                    count += 2
                }
                
                Spacer()
                
                //Button instance with closure
                Button("mult * 2", action: {
//                    print("hi world")
                    count *= 2
                })
                
                Spacer()
            }
            
            Spacer()
            
            Text(String(count)).font(.title)
            
        }
        
    }
}

/*
#Preview {
    ContentView()
}
*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
