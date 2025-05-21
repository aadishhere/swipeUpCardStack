//
//  ContentView.swift
//  swipeUpCardStack
//
//  Created by Aadish Jain on 21/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var index = 0

    var body: some View {
        ZStack {
            if index == 0 {
                FirstView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                    .id(index)
            } else if index == 1 {
                SecondView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                    .id(index)
            } else if index == 2 {
                ThirdView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                    .id(index)
            } else if index == 3 {
                FourthView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                    .id(index)
            }
        }
        .animation(.easeInOut, value: index)
        .ignoresSafeArea()
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.height < -50 {
                        withAnimation {
                            index = (index + 1) % 4
                        }
                    } else if value.translation.height > 50 {
                        withAnimation {
                            index = (index - 1 + 4) % 4
                        }
                    }
                }
        )
    }
}

struct FirstView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("First Card")
                .font(.largeTitle.bold())
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.3))
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Second Card")
                .font(.largeTitle.bold())
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.3))
    }
}

struct ThirdView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Third Card")
                .font(.largeTitle.bold())
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.opacity(0.3))
    }
}

struct FourthView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Fourth Card")
                .font(.largeTitle.bold())
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.opacity(0.3))
    }
}

#Preview {
    ContentView()
}
