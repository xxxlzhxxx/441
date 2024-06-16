//
//  Chatt.swift
//  swiftChatter
//
//  Created by 李子恒 on 26-05-2024.
//

import Foundation

struct Chatt {
    var username: String?
    var message: String?
    var timestamp: String?
    @ChattPropWrapper var imageUrl: String?
    @ChattPropWrapper var videoUrl: String?
}


@propertyWrapper
struct ChattPropWrapper {
    private var _value: String?
    var wrappedValue: String? {
        get { _value }
        set {
            guard let newValue = newValue else {
                _value = nil
                return
            }
            _value = (newValue == "null" || newValue.isEmpty) ? nil : newValue
        }
    }
    
    init(wrappedValue: String?) {
        self.wrappedValue = wrappedValue
    }
}
