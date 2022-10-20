//
//  FirstFitMemoryAlocationPolicy.swift
//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation


class FirstFitMemoryAlocationPolicy : MemoryAlocationPolicy {

    func IN(processName: String, processSize: Int, memory: inout [(Bool, String?)]) {

        var freeSlothsFound: Int = 0
        var freeSlothsFoundIndexes: [Int] = []
        var allowedToAllocate: Bool = false

        for (index, memoryLine) in memory.enumerated() {

            if memoryLine.0 == false && memoryLine.1 == nil {
                freeSlothsFound += 1
                freeSlothsFoundIndexes.append(index)
            } else {
                freeSlothsFound = 0
                freeSlothsFoundIndexes = []
            }
            if freeSlothsFound == processSize {
                allowedToAllocate = true
                break
            }
        }
        if allowedToAllocate {
            for index in freeSlothsFoundIndexes {
                memory[index] = (true, processName)
            }

        } else {
            print("ESPAÇO INSUFICIENTE DE MEMÓRIA")

        }
    }

}
