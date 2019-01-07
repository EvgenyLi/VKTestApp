////
////  FactoryMethod.swift
////  DKVK
////
////  Created by Евгений Липадат on 04/01/2019.
////  Copyright © 2019 Евгений Липадат. All rights reserved.
////
//
//import Foundation
//class SegmenterTableViewCell: UITableViewCell {
//
//    let array: [Direction] = [.goDirectly, .tornLeft, .tornRight, .goBack]
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        go(to: .goBack)
//
//    }
//
//    func go(to direction: Direction) {
//        let direction = FactoryMethod.shared.go(to: direction)
//        direction.goToDirection()
//    }
//
//
//}
//
//
//protocol Route {
//    var direction: String {get}
//    func goToDirection()
//}
//
//enum Direction {
//    case goDirectly, tornLeft, tornRight, goBack
//}
//
//class FactoryMethod {
//    static let shared = FactoryMethod()
//    func go(to direction: Direction) -> Route {
//        switch direction {
//        case .goDirectly:
//            return GoDirectly()
//        case .tornLeft:
//            return TornLeft()
//        case .tornRight:
//            return TornRight()
//        case .goBack:
//            return GoBack()
//        }
//    }
//}
//
//class GoDirectly: Route {
//    var direction: String = "Идем вперед"
//    func goToDirection() {
//        print(direction)
//    }
//}
//class TornLeft: Route {
//    var direction: String = "Идем на лево"
//    func goToDirection() {
//        print(direction)
//    }
//}
//class TornRight: Route {
//    var direction: String = "Идем на право"
//    func goToDirection() {
//        print(direction)
//    }
//}
//class GoBack: Route {
//    var direction: String = "Идем назад"
//    func goToDirection() {
//        print(direction)
//    }
//}
