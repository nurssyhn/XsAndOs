//
//  GameModels.swift
//  XsAndOs
//
//  Created by Nur Sultan Şeyhanlıoğlu on 11.07.2023.
//

import Foundation

enum GameType{
    
    case single , bot, peer , undetermined
    
    var description: String {
    
        switch self {
        case .single:
            return "Share Your iPhone/iPad and play against a friend."
            
        case .bot :
            return "Play against iPhone/iPad."
            
        case .peer:
            return "Invate someone near you who has this app running to play."
            
        case .undetermined:
            return ""
            
        }
    }
}
