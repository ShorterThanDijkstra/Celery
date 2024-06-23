run:
	stack clean
	alex src/Lexer.x
	happy src/Parser.y
	stack ghci
