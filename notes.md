# Notes
#### Key takeaways from Ruby Koans

## OOP

Everything in Ruby is an object. You can convert to string using `.to_s`
Every object has an object ID. Find with `.object_id`
`.inspect` returns a human readable representation of object

There are fixed object IDs for system objects and small integers in Ruby.
The object ID is the same as the value that represents the object on the C level.
For most kinds of objects this value is a pointer to a location in memory.
FixNums follow the pattern `i * 2 + 1`.

`.clone` allows you to clone an object, but it will not be equal to the original object

Identical symbols are a single internal object. Method names and constants become symbols

You can initialise any object with a proxy object.
The proxy object forwards messages to the target object.

## Asserts

Asserts: you can assert booleans or `assert_equal` which should return a boolean. e.g. `assert true` or `assert_equal 2, 1+1`

`.is_a?()` tests the type e.g. `nil.is_a?(Object)`

`assert_match` checks that strings match e.g. `assert_match( |word|, var.message )`

`=~` matches strings against regular expressions and returns nil if not found

## Arrays

Arrays are indexed from 0 and new values can be appended with `<<` e.g.
```
array << 3
array = [1,2,3]
```
`.first` and `.last` allow you to access and the first and last values in the array.
`array[-2]` would equal 2 in the above example, being the second from the end.

Arrays can be sliced e.g. `array[0,1]` returns `[1]` because it is slicing up to and not including index position 1

Ranges can also be sliced or converted to arrays. `(1..5)` includes 5 whereas `(1...5)` does not

`array.push` allows you to append,
`array.pop` removes the final char/value,
`array.upshift` allows you to prepend,
`array.shift` allows you to remove the first value, e.g.
```
array.unshift(0)
array.push(3)
array[0,1,2,3]
```

Parallel assignments allow you to assign variables to items in the array e.g. `first, last = ["John, Smith"]`.
Use splat `*` to select multiple variables.
If there are less variables than items, the items are ignored. If more variables, the variable is equal to nil.

Keys and values are of type array

`.each` iterates over the array

`.map` and `.collect` transforms elements of an array

`.select` allows you to select certain items from an array

`.find` locates the first element matching a criteria

`<<` appends to an array

#### Question: why does `array.to_s` end up with spaces?

## Hashes

`.fetch` allows you to extract an item from a hash.
Returns an array with the values for the associated keys.
Raises `KeyError` if key not found.

Hashes are unordered

`.merge()` merges new hash values into an existing hash

Hashes can have default values e.g. `hash = Hash.new("hash")`
If the default value is an array, you can add values to the array.
```
hash = Hash.new([])
hash[:one] << "uno"
```
Default values can also be added with blocks `hash = Hash.new { |hash, key| hash[key] = [] }`

## Strings

Double quotes allow for string interpolation.
Although you can use backslash `\` for hard cases and `%{flexible quotes}, %!...!, %(...)`

When concatenating strings, `+=` can only concatenate the variables used and is not recursive e.g.
```
string = "string"
new = string
two = "dos"
new += two
string => "string"
new => "string dos"
```
However, the shovel operator is recursive `new << two` will also produce `string => string dos`

`?a` => ASCII character code for `a`

Get a substring from a string using `string [7,3]` (start from 7th, take 3), `string[7..9]` start from 7th, include 9th

`string.split` will split on spaces unless a character is passed in e.g. `(|:|)`, strings can also be joined

## Methods

`?` following a method name indicates a boolean

#### Question: explicit return overrides? non-return values?
#### Question: private methods and receivers?

`.self` refers to the class, so you can create a class level method

You can assign a default value to an argument in a method e.g.
```
def method(argument = "default")
    puts "#{argument}"
end
```

If you use the wrong number of arguments, an error will be called

#### Question: can you have optional arguments?

An explicit return overrides final line.
Avoid multiple explicit returns.

Use `attr...` to access/read/write methods in or outside of `private`

Keyword arguments always have a default value, making them optional to the caller.

Methods can take blocks or do/end methods can call yield many times

`block_given?` tests presence of block

Blocks can modify variables

Blocks can be assigned to variables and called explicitly

#### Question: sandwich code...?

## Symbols

Symbols with spaces and interpolation can be built, but they cannot be concatenated and do not have string methods

## Regex

A pattern is a regular expression

A regexp can search a string for matching content and returns nil if nothing is found.
A `?` means an optional character, a `+` means one or more, an `*` means zero or more.

#### Question: difference between `*` and `?`, when would they fail to match? Why are repetition operators 'greedy'?

A regexp checks the left most match

An optional character or character with options is expressed in `[]` e.g. `[cbr]at = cat, bat, rat`

`/d` is a shortcut for a digit character class.
`/s` for whitespace.
`.` for any non new line character.
`/w` for words.

Regexp can include ranges e.g. `[0-9]`

A character class can be merged by `^`

`/A` anchors to the start of the string,
`/z` anchors to the end of the string,
`^` anchors to the start of lines,
`$` anchors to the end of lines,
`/b` anchors to a *nord* boundary ???????????????????????????????,
`()` groups contents and can capture matched content by number,
variables (e.g. `$1, $2`) can be used to access captures,
`.scan` is like find all,
`.sub` is like find and replace,
`.gsub` is like find and replace all

## Constants

Top level constants are referenced by double colons.
Nested constants can be referenced by relative path or complete path.
`::C` => top level constant
`C` or `::AboutConstants::C` => nested constants

## Classes

Subclasses inherit from parent classes.
Nested classes inherit from enclosing classes.
Lexical scope has precedence over inheritance.

#### Question: when is a class not an open class?

Instances of classes are created with new e.g. `fido = Dog.new`
Set instances variables by assigning to them. e.g.
```
def set_name(name)
    @name = name
end

def name
    @name
end
OR
attr_accessor :name

d.set_name("Fido")
d.name = "Fido"
```

You can define methods on individual objects.
```
fido = Dog.new
def fido.wag
    :fidos_wag
end
```

Class methods are independent of instance methods. `fido.wag != Dog.wag`

Classes and instances do not share instance variables. `fido.name != Dog.name`

Class statements return the value of their last expression

`self.method` is a class level method

## Booleans

Everything except nil and false evaluates to true. e.g. `1`, `[]`, `"""`, `{}`, `0`, etc...

#### Question: What does `a == b == c` mean? Why does it have to be `a == b && b == c`
#### Question: What does inject do?

## Files

`file.gets` retrieves a line from a file
`file.close` closes files
`file = open(file_name)` opens a file

## Loops

For loops are not common in Ruby. Use `.each` instead.
```
(2..6).each do |i|
    total += (dice.count(i) / 3) * i * 100
end
```
