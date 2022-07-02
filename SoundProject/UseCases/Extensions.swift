//
//  Extensions.swift
//  SoundProject
//
//  Created by Mijael Cama on 26/06/22.
//

import Foundation
extension DateComponentsFormatter {
    static let abreviado: DateComponentsFormatter = {
        print("Inicializando DateComponentsFormatter.abreviado")
        let formato = DateComponentsFormatter()
        
        formato.allowedUnits = [.hour, .minute, .second]
        formato.unitsStyle = .abbreviated
        
        return formato
    }()
    
    static let posicion: DateComponentsFormatter = {
        print("Inicializando DateComponentsFormatter.posicion")
        let formato = DateComponentsFormatter()
        
        formato.allowedUnits = [.minute, .second]
        formato.unitsStyle = .positional
        formato.zeroFormattingBehavior = .pad
        
        return formato
    }()
    
}
