["let" "if" "else" "proc" "for" "return"] @keyword

(type_identifier) @type
(function_identifier) @function
(parameter_identifier) @variable.parameter
(identifier) @variable

(integer_literal) @number
(float_literal) @number
(char_literal) @character
(boolean_literal) @boolean
(string_literal) @string
(string_content) @string
(escape_sequence) @string.escape

(calling_convention) @attribute

(comment) @comment

["+" "-" "*" "&&" "||" "!" "==" "!=" "<" "<=" ">" ">=" ":" "=" "->"] @operator
[";" ","] @punctuation.delimiter
["(" ")" "{" "}"] @punctuation.bracket
