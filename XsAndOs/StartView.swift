//
//  ContentView.swift
//  XsAndOs
//
//  Created by Nur Sultan Şeyhanlıoğlu on 11.07.2023.
//

import SwiftUI

struct StartView: View {
    
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    
    var body: some View {
        VStack {
            
            Picker("Select Game" , selection: $gameType) {
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Two Sharing Device").tag(GameType.single)
                Text("Challange Your Device").tag(GameType.bot)
                Text("Challange a Friend").tag(GameType.peer)
            }.padding()
                .background(RoundedRectangle(cornerRadius: 10 , style: .continuous) .stroke(style: (StrokeStyle(lineWidth: 2))))
               
            
            Text(gameType.description)
                .padding()
            VStack{
                switch gameType {
                case .single:
                    VStack{
                        TextField("Your Name" , text: $yourName)
                        TextField("Opponent Name", text: $opponentName)
                    }
                    
                case .bot:
                TextField("Your Name", text: $yourName)
                case .peer:
                    EmptyView()
                case .undetermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            
            if gameType != .peer {
                Button ( "Start Game!"){
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(gameType == .undetermined ||
                          gameType == .bot ||
                          gameType == .single &&
                          (yourName.isEmpty || opponentName.isEmpty)
                )
                
                Image("LaunchScreen")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Xs and Os")
        .fullScreenCover(isPresented: $startGame) {
            GameView()
        }
        .inNavigationStack()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
