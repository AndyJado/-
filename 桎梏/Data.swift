//
//  Data.swift
//  桎梏
//
//  Created by Andy Jado on 2022/6/23.
//

import SwiftUI

enum Carver {
    case aStart
    case going
    case thinking
    case suspend
    case aEnd
    case lost
    
    var literal: String {
        switch self {
        case .aStart: return " { "
        case .going: return " _ "
        case .thinking: return " ^ "
        case .suspend: return " | "
        case .aEnd: return " } "
        case .lost: return " ? "
        }
    }
    
    func knot() -> (String,Date) {
       return (self.literal, Date())
    }
}
