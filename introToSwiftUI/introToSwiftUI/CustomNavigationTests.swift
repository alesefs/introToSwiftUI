//
//  CustomNavigationTests.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 10/05/24.
//

import SwiftUI

struct CustomNavigationSimple: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    Text("New View") //tela 2
                } label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
        }
    }
}

#Preview("CustomNavigationSimple") {
    CustomNavigationSimple()
}


struct CarBrand: Identifiable, Hashable {
    let name: String
    let id = NSUUID().uuidString
}

struct Car: Identifiable, Hashable {
    let id = NSUUID().uuidString
    let make: String
    let model: String
    let year: Int
    
    var description: String {
        return "\(make) \(model) \(year)"
    }
}

struct CustomNavigationSimpleStack: View {
    let brands: [CarBrand] = [
        .init(name: "Ferrari"),
        .init(name: "Lamborghini"),
        .init(name: "Mercedes"),
        .init(name: "Aston Martin"),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(brands) { brand in
//                    Text(brand.name)
                    NavigationLink(value: brand) {
                        Text(brand.name)
                    }
                }
            }
            .navigationDestination(for: CarBrand.self) { brand in
                Text("New \(brand.name)")
            }
        }
    }
}

#Preview("CustomNavigationSimpleStack") {
    CustomNavigationSimpleStack()
}

struct CustomNavigationSectionStack: View {
    let brands: [CarBrand] = [
        .init(name: "Ferrari"),
        .init(name: "Lamborghini"),
        .init(name: "Mercedes"),
        .init(name: "Aston Martin"),
    ]
    
    let cars: [Car] = [
        .init(make: "Ferrari", model: "488", year: 2022),
        .init(make: "Lamborghini", model: "Aventador", year: 2023),
        .init(make: "Mercedes", model: "AMG 63", year: 2019),
        .init(make: "Aston Martin", model: "Vantage", year: 2021)
    ]
 
    
    var body: some View {
        NavigationStack {
            List {
                Section("Manufacturers") {
                    ForEach(brands) { brand in
                        NavigationLink(value: brand) {
                            Text(brand.name)
                        }
                    }
                }
                
                Section("Cars") {
                    ForEach(cars) { car in
                        NavigationLink(value: car) {
                            Text(car.description)
                        }
                    }
                }
            }
            .navigationDestination(for: CarBrand.self) { brand in
                Text("New \(brand.name)")
            }
            .navigationDestination(for: Car.self) { car in
                Text("New \(car.description)")
            }
        }
    }
}

#Preview("CustomNavigationSectionStack") {
    CustomNavigationSectionStack()
}

struct CustomNavigationByFuncStack: View {
    let brands: [CarBrand] = [
        .init(name: "Ferrari"),
        .init(name: "Lamborghini"),
        .init(name: "Mercedes"),
        .init(name: "Aston Martin"),
    ]
    
    let cars: [Car] = [
        .init(make: "Ferrari", model: "488", year: 2022),
        .init(make: "Lamborghini", model: "Aventador", year: 2023),
        .init(make: "Mercedes", model: "AMG 63", year: 2019),
        .init(make: "Aston Martin", model: "Vantage", year: 2021)
    ]
 
    @State private var navigationPath = [CarBrand]()
    @State private var showFullStack = false
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                List {
                    Section("Manufacturers") {
                        ForEach(brands) { brand in
                            NavigationLink(value: brand) {
                                Text(brand.name)
                            }
                        }
                    }
                    
                    Section("Cars") {
                        ForEach(cars) { car in
                            NavigationLink(value: car) {
                                Text(car.description)
                            }
                        }
                    }
                }
                .navigationDestination(for: CarBrand.self) { brand in
//                Text("New \(brand.name)")
                    VStack {
                        viewForBrand(brand)
                        
                        Button(action: {
                            navigationPath = []
                        }, label: {
                            Text("Go to root")
                        })
                    }
                }
                .navigationDestination(for: Car.self) { car in
                    Text("New \(car.description)")
                }
            }
            
            Button(action: {
                showFullStack.toggle()
                
                if showFullStack {
                    navigationPath = brands
                } else {
                    navigationPath = [brands[0], brands[2], brands[1]]
                }
            }, label: {
                Text("View all")
            })
        }
    }
    
    func viewForBrand(_ brand: CarBrand) -> AnyView {
        switch brand.name {
        case "Ferrari":
            return AnyView(Color(.systemRed))
        case "Lamborghini":
            return AnyView(Color(.systemPurple))
        case "Mercedes":
            return AnyView(Color(.systemGray))
        case "Aston Martin":
            return AnyView(Color(.systemGreen))
        default:
            return AnyView(Color(.systemOrange))
        }
    }
}

#Preview("CustomNavigationByFuncStack") {
    CustomNavigationByFuncStack()
}
