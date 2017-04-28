# AdvancedDataStructures

A Swift Cocoa Touch dynamic Framework comprising data structures(DS) not contained within Foundation framework.

For now it contains two data structures:

1. `Injection<Domain:Hashable,Codomain:Hashable>`
2. `Mapping<Domain,Codomain>`

Both DSs can be used to establish a bidirectional map between elements of type `Domain` to elements of type `Codomain`. However, the mechanisms the two DSs use to establish the maps are different and thus each applicable in different scenarios.

### Note:

`Domain` and `Codomain` cannot be of the same type.

## Mapping

The `Mapping` DS has two instance properties:

1. `map:(Domain)->Codomain` 
2. `inverse:`(Codomain)->Domain`

which are used to establish the bidirectional map. 

### Usage
#### Initialization:


``` swift
var map = Mapping<Double,String>(
	map: { d in return String(d)}, //closure mapping elements from Domain -> Codomain
	inverse: { s in return Double(s) ?? 0.0}) //closure mapping elements from Codomain -> Domain
```
#### Mapping Elements
```swift
let s = map[5.5] // s => "5.5"
let d = map["5.5"] // d => 5.5
```

#### Note: 
As the `Mapping` DS uses closures to establish the bidirectional map, it guarantees that every possible data value in `Domain` is mapped to a data value in `Codomain` and vice versa. However, it does not guarantee an injective (one-to-one) map.

## Injection Usage

The `Injection` DS has two instance properties:

1. `preImage:OrderedSet<Domain>`
2. `image:OrderedSet<Codomain>`

which are used to estabalish the bidirectional map. The first element in the `preImage` is mapped to the first element in `image` and so on. 

### Usage
#### Initialization:


``` swift
var injection:Injection<Double,String>? = Injection<Double,String>(pairs:
[(0.1, "0.1"),
 (0.2, "0.2"),
 (0.4, "0.4")]) //failable initializer
 
 var emptyInjection: Injection<Double,String> = Injection<Double,String>() //returns an empty injection
```
The first and second component of each tuple are stored in preImage and image respectively.

#### Note: 
For the initialization of a non-empty injection to succeed the `pairs:[(Domain,Codomain)]` array must satisfy the following two conditions:

1. `firstPair.0 != secondPair.0` for any two distinct elements in `pairs`
2. `firstPair.1 != secondPair.1` for any two distinct elements in `pairs`

These conditions are required to ensure that `preImage` and `image` are the same size and that the mapping intended by the `pairs` array is preserved.

#### Mapping Elements
```swift
let s = injection[0.1] // s => "0.1"
let d = injection["0.4"] // d => 0.4
```

#### Modifying Injection
```swift
//Adding pairs
injection2[0.3] = "0.3" //add 0.3 to preImage & "0.3" to image
 
injection2[0.3] ==  "0.3" // =>true

//Removing pairs
injection2[0.4] ==  nil //remove 0.4 from preImage & "0.4" from image
injection2[0.4] ==  "0.4" // =>false
injection2["0.4"] ==  0.4 // =>false

//Modifying pairs
injection2[0.3] = "0.30" //replace "0.3" by "0.30" in image
injection2[0.3] ==  "0.30" // =>true
injection2["0.3"] ==  0.3 // =>false
```

## Instalation

1. Clone github repository or download it as a .zip
2. execute `pod install` in the root directory of the project

## 3rd Party Dependencies

1. [OrderedSet](https://github.com/Weebly/OrderedSet)

## Author

Jeremie Benhamron (Jeremiebenhamron@gmail.com)

