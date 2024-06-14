//
//  CustomNavigationRouter.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 14/06/24.
//

import SwiftUI

//struct CustomNavigationRouter: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    CustomNavigationRouter()
//}

// We create enums for our views to keep track where we navigate
enum Screens {
    case screenA
    case screenB
    case screenC
    case screen0
}

// We create navigation path as observable object so that we can access it everywhere
class Navigation: ObservableObject {
    @Published var path = [Screens]()
}

struct CustomNavigationRouter: View {
    @StateObject var navigation = Navigation()

    var body: some View {
        NavigationStack(path: $navigation.path) {
            VStack(spacing: 30) {
                Image(systemName: "0.square.fill").font(.largeTitle).foregroundColor(.green)
                Button("Go to screen A") {
                    navigation.path.append(Screens.screenA)
                }
                
                Button("Go to screen B") {
                    navigation.path.append(Screens.screenB)
                }
                
                Button("Go to screen C") {
                    navigation.path.append(Screens.screenC)
                }
            }
            .navigationDestination(for: Screens.self) { screen in
                NavigationController.navigate(to: screen)
            }
        }
        .environmentObject(navigation)
    }
}

// We create navigation controller to do the navigation to our views
class NavigationController {
    @ViewBuilder
    static func navigate(to screen: Screens) -> some View {
        switch screen {
        case .screenA:
            ScreenA()
        case .screenB:
            ScreenB()
        case .screenC:
            ScreenC()
        case .screen0:
            CustomNavigationRouter()
        }
    }
}

// This is our view A

struct ScreenA: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "a.square.fill").font(.largeTitle).foregroundColor(.green)
            Button("Go to screen B") {
                navigation.path.append(Screens.screenB)
            }
            .navigationDestination(for: Screens.self) { screen in
                NavigationController.navigate(to: screen)
            }
            
            Button("Go to screen C") {
                navigation.path.append(Screens.screenC)
            }
            .navigationDestination(for: Screens.self) { screen in
                NavigationController.navigate(to: screen)
            }
        }
        // We are hiding default back button
        .navigationBarBackButtonHidden()
        // We assign our button that pop to root view
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {
                    navigation.path.removeAll()
                }
            }
        }
    }
}

#Preview {
    ScreenA()
        .environmentObject(Navigation())
}

// This is our view B

struct ScreenB: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "b.square.fill").font(.largeTitle).foregroundColor(.red)
            Button("Go to screen C") {
                navigation.path.append(Screens.screenC)
            }
            .navigationDestination(for: Screens.self) { screen in
                NavigationController.navigate(to: screen)
            }
            
            Button("Go to screen A") {
                navigation.path.append(Screens.screenA)
            }
            .navigationDestination(for: Screens.self) { screen in
                NavigationController.navigate(to: screen)
            }
        }
        // We are hiding default back button
        .navigationBarBackButtonHidden()
        // We assign our button that pop to root view
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {
                    navigation.path.removeAll()
                }
            }
        }
    }
}

// This is our view C

struct ScreenC: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "c.square.fill").font(.largeTitle).foregroundColor(.purple)
            Button("Go to screen B") {
                navigation.path.append(Screens.screenB)
            }
            .navigationDestination(for: Screens.self) { screen in
                NavigationController.navigate(to: screen)
            }
            
            Button("Go to screen A") {
                navigation.path.append(Screens.screenA)
            }
            .navigationDestination(for: Screens.self) { screen in
                NavigationController.navigate(to: screen)
            }
            
            Button("Go to screen A") {
                navigation.path.append(Screens.screenA)
            }
            .navigationDestination(for: Screens.self) { screen in
                NavigationController.navigate(to: screen)
            }
            
            Button("Go to screen 0") {
                navigation.path.removeAll()
            }
            .navigationDestination(for: Screens.self) { screen in
                NavigationController.navigate(to: screen)
            }
        }
        // We are hiding default back button
        .navigationBarBackButtonHidden()
        // We assign our button that pop to root view
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {
                    navigation.path.removeAll()
                }
            }
        }
    }
}

#Preview {
    CustomNavigationRouter()
}
