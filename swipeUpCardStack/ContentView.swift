//
//  ContentView.swift
//  swipeUpCardStack
//
//  Created by Aadish Jain on 21/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var index = 0

    let titles = ["First Card", "Second Card", "Third Card"]
    let subtitles = ["Swipe up", "Keep Swiping", "Last Screen"]
    let colors: [Color] = [.red.opacity(0.3), .blue.opacity(0.3), .orange.opacity(0.3)]

    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Spacer()
                Text(titles[index])
                    .font(.largeTitle.bold())
                Text(subtitles[index])
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colors[index])
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.height < -50 {
                            index = (index + 1) % 3
                        }
                    }
            )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
