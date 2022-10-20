//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation

struct Queue<T> {
    private var elements: [T]

    init(elements: [T] = [T]()) {
        self.elements = elements
    }

    mutating func enqueue(_ value: T) {
        elements.append(value)
    }

    mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }

    var head: T? {
        return elements.first
    }

    var tail: T? {
        return elements.last
    }

    var size: Int {
        return elements.count
    }
}
