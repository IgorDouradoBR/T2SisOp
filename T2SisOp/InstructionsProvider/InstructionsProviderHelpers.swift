//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//
import Foundation


struct MemoryInstructionsValidatorHelper: MemoryInstructionsValidator {

    func validateOUTInstruction(stringInstruction: String) -> Bool {

        let splitString = stringInstruction.components(separatedBy: "(")
        let instructionName = splitString[0]

        if instructionName.uppercased() == "OUT" && splitString[1].last == ")" {
            return true
        }
        return false
    }

    func validateINInstruction(stringInstruction: String) -> Bool {

        let splitString = stringInstruction.components(separatedBy: "(")
        let instructionName = splitString[0]
        var valuesWithLastParenteses = splitString[1]

        if instructionName.uppercased() == "IN" && valuesWithLastParenteses.last == ")"  {
            valuesWithLastParenteses.removeLast()
            let valuesWithCommaInBetween = valuesWithLastParenteses
            let parameters =  valuesWithCommaInBetween.components(separatedBy: ",")
            if  parameters.count > 1 {
                if (Int(parameters[1].dropFirst()) != nil) {
                    return true

                }
            }
        }
        return false

    }



}
