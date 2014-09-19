
all: langCompiler langCompilerDebug

langParser.d: lang.peg
	../ParsingExperiments/parserGenerator < lang.peg > langParser.d

langCompiler: langParser.d langCompiler.d
	dmd -oflangCompiler langCompiler.d langParser.d visitor.d

langCompilerDebug: langParser.d langCompiler.d
	dmd -oflangCompilerDebug langCompiler.d langParser.d visitor.d -debug=TRACE

realclean:
	-rm langParser.d
	-rm grammarParser
