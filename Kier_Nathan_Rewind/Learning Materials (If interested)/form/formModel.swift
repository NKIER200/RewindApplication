//
//  formModel.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 09/07/2022.
//

import Foundation
import UIKit

struct FormSN: Identifiable {
    let id = UUID()
    let key: Key
    let header: String?
    let footer: String?
    var items: [FormITM]
    
}

struct FormITM: Identifiable {
    let id = UUID()
    let key: Key
    let kind: Kind
    var stringVal: String = ""
    var boolVal: Bool = false
}

extension FormITM {
    enum Kind {
        case text(config: TextConfig)
        case button(config: ButtonConfig, action: (ButtonConfig.Action)-> Void)
        case toggle(config: ToggleConfig)
        case secureText(config: TextConfig)
    }
}

extension FormITM.Kind {
    struct TextConfig {
        let title: String
        let keyboardInputType: UIKeyboardType
        let textContentType: UITextContentType
    }
    struct ButtonConfig {
        let title: String
        let triggerAction: Action
    }
    struct ToggleConfig {
        let title: String
    }
}


extension FormSN {
    enum Key: String {
        case general
        case submission
        case guides
        case login
    }
}

extension FormITM {
    enum Key: String {
        case prefix
        case firstName
        case lastName
        case submit
        case sendGuides
        case uname
        case pword
    }
}

extension FormITM.Kind.ButtonConfig {
    enum Action {
        case submit
    }
}
