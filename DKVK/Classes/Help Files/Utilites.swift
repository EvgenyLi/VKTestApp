//
//  Utilites.swift
//  DKVK
//
//  Created by Евгений Липадат on 06/01/2019.
//  Copyright © 2019 Евгений Липадат. All rights reserved.
//

import Foundation

func ID() -> String {
    let str = "sfnlicledgdfgasiokyuiruqrci123908242"
    let arr = Array(str)
    func random() -> String {
        return String(arr[Int.random(in: arr.indices)])
    }
    var result = ""
    let countOfCharacters = 12
    for _ in 0..<countOfCharacters {
        result += random()
    }
    return result
}
