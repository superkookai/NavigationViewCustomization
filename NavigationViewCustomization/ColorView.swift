//
//  ColorView.swift
//  NavigationViewCustomization
//
//  Created by Weerawut Chaiyasomboon on 10/12/2567 BE.
//

import SwiftUI

struct ColorView: View {
    let colors: [Color] = [.red, .blue, .green, .orange, .brown,.red, .blue, .green, .orange, .brown,.red, .blue, .green, .orange, .brown,.red, .blue, .green, .orange, .brown]
    
    @State private var selectedColor: Color?
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                List(colors,id: \.self, selection: $selectedColor){ color in
                    Text("\(color)".capitalized)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color("backgroundColor"))
                }
                .listStyle(.plain)
                .navigationTitle("Colors")
                .navigationDestination(item: $selectedColor) { color in
                    ColorDetailView(color: color)
                }
                //            .toolbarBackground(.blue, for: .navigationBar)
                //            .toolbarTitleDisplayMode(.inline)
                //            .toolbarVisibility(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            //Show alert
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "exclamationmark.triangle")
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
        .tint(.black)
        .onAppear {
            customizeNavigationBar()
        }
        .sheet(isPresented: $showAlert) {
            Text("Hello")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .presentationDetents([.medium, .height(200)])
                .presentationBackground(.red)
                .presentationCornerRadius(40)
        }
        
    }
    
    func customizeNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.red // Background color
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white, // Title color
            .font: UIFont.boldSystemFont(ofSize: 20) // Title font size
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white, // Large title color
            .font: UIFont.boldSystemFont(ofSize: 30) // Large title font size
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}



#Preview {
    ColorView()
}

struct ColorDetailView: View{
    let color: Color
    
    var body: some View{
        ZStack{
            color
            
            Text("\(color)".uppercased())
                .font(.largeTitle)
                .bold()

        }
        .ignoresSafeArea()
    }
}
