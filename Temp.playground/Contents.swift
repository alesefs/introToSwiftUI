import Foundation
import UIKit

// comentário simples

/* comentário em bloco
 
// MARK: tipos básicos
// String
"Hello"

// Int
12
10

// Double
0.4
1.5

// Bool
true
false
*/

/*
 // MARK: var & let
 var myVar:  String = "hello" //var = mutable variable
 myVar = "world"
 print(myVar)
 
 var myInt: Int = 100
 print(myInt)
 
 let myConst: String = "hello"  //let = constant variable
 print(myConst)
 */

/*
// MARK: Math operations
var a = 20 + 5 //Soma

var b = 20 - 5 //Subtração

var c = 20 * 5 //Multiplicação

var d = 20 / 5 //Divisão

var e = 20 % 2 //Modulo (quoeficiente e resto da divisão)

var f = (a * b) + (c / d) //Equação

//incrementa valor na variavel
f = f + 1
f += 1

//decrementa valor na variavel
f = f - 1
f -= 1

//multiplica valor na variavel
f *= 2

//divide valor na variavel
f /= 4
 
 
 

//MARK: outras operações matematicas complexas - precisa do import Foundation

//absolute number - converte negativo em positivo
var g = abs(-1)

//ceiling - da o numero inteiro acima do Double
var h = ceil(1.6)

//floor - da o numero inteiro abaixo do Double
var i = floor(1.4)

//Square root - raiz quadrada
var j = sqrt(36)

//Power - potência 2^(exp)4
var k = pow(2, 4)
*/


/*
 //MARK: challenger - lesson 6

 challenger
 4 people have dinner and want to split the bill.
 calculate the total tax and then how much each person owes.
 assign it to the variable 'split' and the print it out to the console area
 */
/*
let people: Double = 4
let subtotal: Double = 128
let tax: Double = 0.13
var split: Double = 0


split = ((subtotal + (subtotal * tax)) / people)
//split = (subtotal * (1 + tax)) / people
print(split)
*/


//MARK: func
func myFunc() {
    let a = 10
    let b = 20
    print(a + b)
}

myFunc()

func myFunc2(a: Int, b: Int) {
    print(a + b)
}

myFunc2(a: 10, b: 20)

func myFuncReturn(a: Int) -> Int {
    let b = 20
    
    return a + b
}

let mysum = myFuncReturn(a: 5)
print(mysum)

//se retorna void nao declara

//argument label firstNumber - secondNumer -> sao apenas nomes declarativos e decorativos
func myFunct2(firstNumber a: Int, secondNumber b: Int = 0) -> Int {
    return a + b
}
print(myFunct2(firstNumber: 2))

//em caso de uso de underline no argument label, você nao precisa declarar o argumento no uso da função=
func myFunct3(_ a: Int, _ b: Int = 0) -> Int {
    return a + b
}
print(myFunct3(2, 18))


func myCustomFunc(text: String) {}
func myCustomFunc(value: Int) {}
func myCustomFunc(isValid: Bool) {}


func goodMoringRoutine() {
    print("good morning")
}

goodMoringRoutine()

func printTotalWithTax(subtotal: Double) {
    let total = subtotal * 1.13
    print(total)
}

printTotalWithTax(subtotal: 8)

func getTotalWithTax(subtotal: Double) -> Double {
    return subtotal * 1.13
}

print(getTotalWithTax(subtotal: 11))

func calculateTotalWithTax(subtotal: Double, tax: Double) -> Double {
    return subtotal * tax
}

print(calculateTotalWithTax(subtotal: 11, tax: 8))


//MARK: Struct - são tipo uma classe que envolve funções, tipo um object no kotlin - não é auto chamado e precisa ser instanciado

/*
 struct MyStruct {
 
 //var and let
 
 
 //func
 
 
 }
 */

/*
 struct ChatView {
 
 //properties -> global var & let
 var message: String = ""
 
 //computer property -> tipo variavel lambda kotlin
 var messageWithPrefix: String {
 let prefix: String = "I say "
 return prefix + message
 }
 
 //view code for screen
 
 //methods -> inside struct func
 func sendChat() {
 
 var prefix = "Says: " //just use inside this func
 
 //code to send the chat message
 print(prefix + message)
 print(messageWithPrefix)
 
 }
 
 func deleteChat() {
 print(message)
 }
 
 }
 */

//MARK: chanllenger lesson 8 - struct
/*
struct Car {
    
    private var make: String = "Toyota"
    private var model: String = "Camry"
    private var year: String = "1999"
    
    private var details: String {
        return year + " " + make + " " + model
    }
    
    func getDetail() -> String {
        return details
    }
    
}

print(Car().getDetail())

*/

//L9
/*
struct MyStructure {
    
    var message: String = "Hello!"
    
    func myFunction() {
        print(message)
    }
    
}

var a:MyStructure = MyStructure()

//Dot notations
a.message = "Hi!"
a.myFunction()

var b = MyStructure()
b.message = "World"
print(b.message)
*/

/*
struct DatabaseManager {
    
    private var serverName = "Server 1"
    
    func saveData(data: String) -> Bool {
        //this code save the data
        
        return true
    }
    
}

struct ChatView {

    var message: String = "Hello"

    func sendChat() {
        var db = DatabaseManager()
        
        let wasSuccess: Bool = db.saveData(data: message)
        
        //check the successful bool value, if unsuccessful, show alert to user
    }

}
*/

//MARK: Lesson 9 challenger 1

struct TaxCalculator {
    
    var tax: Double = 0.5
    
    func totalWithTax(_ total: Double) -> Double {
        return total * (1 + tax)
    }
    
}

struct BillSplitter {
    
    func splitBy(subtotal: Double, numPeople: Int) -> Double {
        let taxCalc = TaxCalculator()
        let totalWithTax = taxCalc.totalWithTax(subtotal)
                
        return totalWithTax / Double(numPeople)
    }
    
}

var split: BillSplitter = BillSplitter()
split.splitBy(subtotal : 120.0, numPeople: 5)

//ARRAY

var a:[Int] = [5, 21, 50, 87]
print(a[0])

a[0] = 100

print(a[0])



let sentence = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown "

func splitByLetterCount(_ string: String, count: Int) -> [String] {
    var result: [String] = []
    var currentSubstring = ""

    for char in string {
        if currentSubstring.count + 1 <= count {
            currentSubstring.append(char)
        } else {
            result.append(currentSubstring)
            currentSubstring = String(char)
        }
    }

    if !currentSubstring.isEmpty {
        result.append(currentSubstring)
    }

    return result
}

let splitSentences = splitByLetterCount(sentence, count: 100)
print(splitSentences)
