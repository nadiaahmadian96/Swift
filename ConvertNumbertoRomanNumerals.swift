func intToRoman(_ num: Int) -> String {
    let romanValues = [
        (value: 1000, roman: "M"),
        (value: 900, roman: "CM"),
        (value: 500, roman: "D"),
        (value: 400, roman: "CD"),
        (value: 100, roman: "C"),
        (value: 90, roman: "XC"),
        (value: 50, roman: "L"),
        (value: 40, roman: "XL"),
        (value: 10, roman: "X"),
        (value: 9, roman: "IX"),
        (value: 5, roman: "V"),
        (value: 4, roman: "IV"),
        (value: 1, roman: "I")
    ]
    
    var number = num
    var result = ""
    
    for romanValue in romanValues {
        while number >= romanValue.value {
            result += romanValue.roman
            number -= romanValue.value
        }
    }
    
    return result
}

// Usage:
print(intToRoman(1987)) // Output: "MCMLXXXVII"
