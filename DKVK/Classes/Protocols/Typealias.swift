//
//  Typealias.swift
//  DKVK
//
//  Created by Евгений Липадат on 02/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import Foundation

typealias StaticCellProtocol = NibLoadable & HeightConteinable
typealias ItemClouser<T> = ((T) -> Void)
