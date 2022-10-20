//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//
import Foundation

class DataFromFileFormatterHelper  {

    func getLinesFromStringOfFile(fileString: String) -> [String] {
        let linesArray = fileString.components(separatedBy: "\n")
        return linesArray
    }

    func cleanEmptyStringsFromArray(arrayOfString: [String]) -> [String] {
        var outPutStringaArray:[String] = []

        for thisString in  arrayOfString {
            if thisString != "" || thisString != " " {
                outPutStringaArray.append(thisString)
            }
        }
        return outPutStringaArray

    }

}

