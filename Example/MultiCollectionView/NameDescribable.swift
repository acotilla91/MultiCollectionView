//
//  NameDescribable.swift
//  Created by Alejandro Cotilla on 2/10/19.
//
//  Based on: https://stackoverflow.com/a/39993120/1792699
//

import Foundation

protocol NameDescribable {
    var typeName: String { get }
    static var typeName: String { get }
}

extension NameDescribable {
    var typeName: String {
        return String(describing: type(of: self))
    }
    
    static var typeName: String {
        return String(describing: self)
    }
}
