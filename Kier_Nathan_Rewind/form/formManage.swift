//
//  formManage.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 09/07/2022.
//

import Foundation

enum FormState {
    case na
    case valid
    case invalid
}

protocol FormManageImp1: ObservableObject {
    var sections: [FormSN] { get set }
    var formState: FormState { get set }
    func load()
}

final class formManage: FormManageImp1 {
    
    @Published var sections: [FormSN] = []
    @Published var formState: FormState = .na
    
    func load() {
        
        let prefixFormItem = FormITM(key: .prefix, kind: .text(config: .init(title: "Prefix", keyboardInputType: .default, textContentType: .namePrefix)), stringVal: "")
        
        let firstNameFormItem = FormITM(key: .firstName, kind: .text(config: .init(title: "First Name", keyboardInputType: .namePhonePad, textContentType: .name)), stringVal: "")
        
        let secondNameFormItem = FormITM(key: .lastName, kind: .text(config: .init(title: "Last Name", keyboardInputType: .namePhonePad, textContentType: .name)), stringVal: "")
        
        let giSection = FormSN(key: .general, header: "General", footer: "enter relevant information", items: [
            prefixFormItem,
            firstNameFormItem,
            secondNameFormItem
        ])
        
        //submit section
        let subFormITM = FormITM(key: .submit, kind: .button(config: .init(title: "Submit", triggerAction: .submit), action: {[weak self] action in self?.validate()}), stringVal: "")
        
        let submitSection = FormSN(key: .submission, header: nil, footer: nil, items: [
        subFormITM
        
        ])
        //guides
        
        let guidesToggleItem = FormITM(key: .sendGuides, kind: .toggle(config: .init(title: "Do you wish to receive some guides")), boolVal: true)
        
        let guidesSection = FormSN(key: .guides, header: "Guide Preferences", footer: nil, items: [
            guidesToggleItem
        ])
        
        self.sections = [
        giSection,
        guidesSection,
        submitSection
        
        ]
    }
}

private extension formManage {
    func validate() {
        guard let generalSection = sections.first(where: { $0.key == .general }) else {
            return
        }
        let formsEmpty = generalSection.items.first(where: { $0.stringVal.isEmpty }) == nil
        self.formState = formsEmpty ? .valid: .invalid
    }
}
