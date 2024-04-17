//
//  ContentView.swift
//  CustomTabView
//
//  Created by break200 on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tab = .house
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    switch selectedTab {
                    case .house:
                        HouseView()
                            .tag(0)
                    case .message:
                        MessageView()
                            .tag(1)
                    case .person:
                        OtherView()
                            .tag(2)
                    case .leaf:
                        OtherView()
                            .tag(2)
                    case .gearshape:
                        OtherView()
                            .tag(2)
                    }
                }
                Spacer(minLength: 0)
                CustomTab(selectedTab: $selectedTab)
                    .frame(width: .infinity , height: 80)
                    .background(Color.blue)
            }
        }
    }
}

#Preview {
    ContentView()
}
