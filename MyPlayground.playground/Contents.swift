import UIKit

struct queen{
    var column: Int
    var row: Int
    //var id: Int
}

class Tablero {
    
    var limite: Int
    init(_ limite: Int) {
        self.limite = limite
    }
    
    var all_queen = [queen]()
    
    func validator(row:  Int, column: Int) -> Bool{
        for queen in all_queen{
            if queen.row == row || queen.column == column || abs(queen.row-row) == abs(queen.column-column){
                return false
            }
            
        }
        return true
    }
    
    
    func get_queen(row:Int){
        if all_queen.count < limite {
            for column in 0...limite-1{
                if validator(row: row, column: column){
                    let active_queen = queen(column: column, row: row)
                    all_queen.append(active_queen)
                    get_queen(row: row+1)
                    if all_queen.count == limite{
                        print(concatenator())
                    }
                    
                    all_queen.removeLast()
                }
            }
        }
    }
    
    func concatenator() -> String {
        var returner  = ""
        for queen in all_queen{
            returner += " - (\(queen.row),\(queen.column))"
        }
        return returner
    }
    
    
}

let t = Tablero(4)
t.get_queen(row: 0)
