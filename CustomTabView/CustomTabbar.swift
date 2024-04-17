//
//  CustomTab.swift
//  CustomTabView
//
//  Created by break200 on 4/17/24.
//

import SwiftUI


enum Tab:String,CaseIterable {
    case house
    case message
    case person
    case leaf
    case gearshape
}



struct CustomTab: View {
    
    @Binding var selectedTab:Tab
    
    private var fillImage:String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor:Color {
        switch selectedTab {
        case .house:
            return .blue
        case .message:
            return .green
        case .person:
            return .purple
        case .leaf:
            return .red
        case .gearshape:
            return .orange
        }
    }
    
    var body: some View {
        HStack{
            ForEach(Tab.allCases , id:\.self) { item in
                Spacer()
                Image(systemName: selectedTab == item ? fillImage : item.rawValue)
                    .scaleEffect(selectedTab == item ? 1.25 : 1.0)
                    .foregroundColor(selectedTab == item ? tabColor : Color.gray)
                    .font(.system(size: 22))
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = item
                        }
                    }
                Spacer()
            }
        } //:HSTACK
        .frame(width: nil, height: 60)
        .background(.thinMaterial)
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    CustomTab(selectedTab: .constant(.house))
}
