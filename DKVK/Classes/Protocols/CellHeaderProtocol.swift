//
//  CellHeaderProtocol.swift
//  DKVK
//
//  Created by Евгений Липадат on 03/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import Foundation

protocol CellHeaderProtocol {
    associatedtype CellType
    var cellModel: [CellType] { get }
}
