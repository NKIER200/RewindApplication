//
//  loginFormManager.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 09/07/2022.
//

import Foundation
import UIKit


final class LoginFormManager: FormManageImp1 {
    
    @Published var sections: [FormSN] = []
    @Published var formState: FormState = .na
    
    func load() {
        
    
        let uNameFormItem = FormITM(key: .uname, kind: .text(config: .init(title: " Username", keyboardInputType: .emailAddress, textContentType: .username)), stringVal: "")
        
        let pwordFormItem = FormITM(key: .pword, kind: .secureText(config: .init(title: "Password", keyboardInputType: .default, textContentType: .password)), stringVal: "")
        
        let subFormITM = FormITM(key: .submit, kind: .button(config: .init(title: "Submit", triggerAction: .submit), action: {[weak self] action in self?.validate()}), stringVal: "")
        
        let loginSection = FormSN(key: .login, header: "Login", footer: "enter relevant login information", items: [
            
            uNameFormItem,
            pwordFormItem,
            subFormITM
        ])
        
        //submit section
        //guides
        
       
        
        self.sections = [
        loginSection
      
        
        ]
    }
}

private extension LoginFormManager {
    
    func validate() {
        guard let generalSection = sections
            .first(where: { $0.key == .login })?
            .items.lazy.filter({ $0.key != .submit}) else {
            return
        }
        let formsEmpty = generalSection.first(where: { $0.stringVal.isEmpty }) == nil
        self.formState = formsEmpty ? .valid: .invalid
    }
}
