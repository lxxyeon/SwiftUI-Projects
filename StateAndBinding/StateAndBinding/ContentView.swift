//
//  ContentView.swift
//  StateAndBinding
//
//  Created by leeyeon2 on 2021/06/27.
//

import SwiftUI

enum Mood: String {
    case happy = "😀"
    case sad = "☹️"
    case upsidedown = "🙃"
    case cat = "🐱"
}

struct ContentView: View {
    @State var name: String = "Hello"
    @State var favoriteColor: Color = .red
    @State var mood: Mood = Mood.happy
    @State var showDetails = false
    var body: some View {
        VStack {
            StatusControl(name: $name, favoriteColor: $favoriteColor, mood: $mood)
            StatusIcon(name: name, favoriteColor: favoriteColor, mood: mood)
            HStack(spacing: 20){
                 Button(action: {
                    //action
                    self.showDetails.toggle()
                }) {
                    //display
                    Text("Show details")
                }
                 Button("Button"){
                     print("Button1")
                 }
                 Button(action:{print("Button2")}){
                     Text("Button")
                         .padding()
                         .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                 }
                 Button(action: {print("Button3")}) {
                     Circle()
                         .stroke(lineWidth: 2)
                         .frame(width: 80, height: 80)
                         .overlay(Text("Button"))
                 }
                 .accentColor(.green)
             }
            HStack(spacing: 20){
                        Button(action: {print("Button1")}){
                            Image("swift_logo")
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                        Button(action:{print("Button2")}){
                            Image(systemName: "play.circle")
                                .imageScale(.large)
                                .font(.largeTitle)
                        }
            }.padding()
            if showDetails {
                Text("You should see me in a crown")
                    .font(.largeTitle)
                    .lineLimit(nil)
            }
        }
    }
}

struct StatusControl: View{
    @Binding var name: String
    @Binding var favoriteColor: Color
    @Binding var mood: Mood
    var body: some View {
        HStack {
            TextField("Name", text: $name)
            ColorPicker("Favorite Color", selection: $favoriteColor)
            Picker("Mood", selection: $mood) {
                Text(Mood.happy.rawValue).tag(Mood.happy)
                Text(Mood.sad.rawValue).tag(Mood.sad)
                Text(Mood.upsidedown.rawValue).tag(Mood.upsidedown)
                Text(Mood.cat.rawValue).tag(Mood.cat)
            }
            .pickerStyle(SegmentedPickerStyle())
        }.padding()
    }
}

struct StatusIcon: View {
    let name: String
    let favoriteColor: Color
    let mood: Mood
    
    var body: some View {
        VStack {
            VStack {
                Text(mood.rawValue)
                Text(name)
                    .foregroundColor(.white)
            }
            .font(.largeTitle)
            .padding()
            .background(favoriteColor)
            .cornerRadius(12)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
