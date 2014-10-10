import std.stdio;
import std.regex;
import std.string;
import std.array;
import std.algorithm;
import std.variant;
import visitor;
void printTree(ASTNode node, string indent = "")
{
    if (cast(ASTNonTerminal)node) {
        writeln(indent, (cast(ASTNonTerminal)node).name);
        foreach (x; (cast(ASTNonTerminal)node).children) {
            printTree(x, indent ~ "  ");
        }
    }
    else if (cast(ASTTerminal)node) {
        writeln(indent, "[", (cast(ASTTerminal)node).token, "]: ",
            (cast(ASTTerminal)node).index);
    }
}
abstract class ASTNode
{
    ASTNonTerminal parent;
    Variant[string] data;
    void accept(Visitor v);
    void setParent(ASTNonTerminal node) {
        parent = node;
    }
}
abstract class ASTNonTerminal : ASTNode
{
    ASTNode[] children;
    string name;
    void addChild(ASTNode node) {
        children ~= node;
    }
    Tag getTag() {
        return Tag.ASTNONTERMINAL;
    }
}
class ASTTerminal : ASTNode
{
    const string token;
    const uint index;
    this (string token, uint index) {
        this.token = token;
        this.index = index;
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
}
class ProgramNode : ASTNonTerminal
{
    this () {
        this.name = "PROGRAM";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.PROGRAM;
    }
}
class ExternImportNode : ASTNonTerminal
{
    this () {
        this.name = "EXTERNIMPORT";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.EXTERNIMPORT;
    }
}
class FuncDefNode : ASTNonTerminal
{
    this () {
        this.name = "FUNCDEF";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.FUNCDEF;
    }
}
class ArgListNode : ASTNonTerminal
{
    this () {
        this.name = "ARGLIST";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.ARGLIST;
    }
}
class BlockNode : ASTNonTerminal
{
    this () {
        this.name = "BLOCK";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.BLOCK;
    }
}
class StatementNode : ASTNonTerminal
{
    this () {
        this.name = "STATEMENT";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.STATEMENT;
    }
}
class AssignmentNode : ASTNonTerminal
{
    this () {
        this.name = "ASSIGNMENT";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.ASSIGNMENT;
    }
}
class PassNode : ASTNonTerminal
{
    this () {
        this.name = "PASS";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.PASS;
    }
}
class IfblockNode : ASTNonTerminal
{
    this () {
        this.name = "IFBLOCK";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.IFBLOCK;
    }
}
class ElseifblockNode : ASTNonTerminal
{
    this () {
        this.name = "ELSEIFBLOCK";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.ELSEIFBLOCK;
    }
}
class ElseblockNode : ASTNonTerminal
{
    this () {
        this.name = "ELSEBLOCK";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.ELSEBLOCK;
    }
}
class WhileblockNode : ASTNonTerminal
{
    this () {
        this.name = "WHILEBLOCK";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.WHILEBLOCK;
    }
}
class ParamListNode : ASTNonTerminal
{
    this () {
        this.name = "PARAMLIST";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.PARAMLIST;
    }
}
class FuncCallNode : ASTNonTerminal
{
    this () {
        this.name = "FUNCCALL";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.FUNCCALL;
    }
}
class ReturnStmtNode : ASTNonTerminal
{
    this () {
        this.name = "RETURNSTMT";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.RETURNSTMT;
    }
}
class PrintNode : ASTNonTerminal
{
    this () {
        this.name = "PRINT";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.PRINT;
    }
}
class SpawnNode : ASTNonTerminal
{
    this () {
        this.name = "SPAWN";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.SPAWN;
    }
}
class ChanReadNode : ASTNonTerminal
{
    this () {
        this.name = "CHANREAD";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.CHANREAD;
    }
}
class ChanWriteNode : ASTNonTerminal
{
    this () {
        this.name = "CHANWRITE";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.CHANWRITE;
    }
}
class MakeChanNode : ASTNonTerminal
{
    this () {
        this.name = "MAKECHAN";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.MAKECHAN;
    }
}
class YieldNode : ASTNonTerminal
{
    this () {
        this.name = "YIELD";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.YIELD;
    }
}
class ExpressionNode : ASTNonTerminal
{
    this () {
        this.name = "EXPRESSION";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.EXPRESSION;
    }
}
class SumNode : ASTNonTerminal
{
    this () {
        this.name = "SUM";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.SUM;
    }
}
class SumOpProductNode : ASTNonTerminal
{
    this () {
        this.name = "SUMOPPRODUCT";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.SUMOPPRODUCT;
    }
}
class ProductNode : ASTNonTerminal
{
    this () {
        this.name = "PRODUCT";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.PRODUCT;
    }
}
class MulOpValueNode : ASTNonTerminal
{
    this () {
        this.name = "MULOPVALUE";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.MULOPVALUE;
    }
}
class ValueNode : ASTNonTerminal
{
    this () {
        this.name = "VALUE";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.VALUE;
    }
}
class ParenExprNode : ASTNonTerminal
{
    this () {
        this.name = "PARENEXPR";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.PARENEXPR;
    }
}
class TerminatorNode : ASTNonTerminal
{
    this () {
        this.name = "TERMINATOR";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.TERMINATOR;
    }
}
class SumOpNode : ASTNonTerminal
{
    this () {
        this.name = "SUMOP";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.SUMOP;
    }
}
class MulOpNode : ASTNonTerminal
{
    this () {
        this.name = "MULOP";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.MULOP;
    }
}
class NumNode : ASTNonTerminal
{
    this () {
        this.name = "NUM";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.NUM;
    }
}
class IdentifierNode : ASTNonTerminal
{
    this () {
        this.name = "IDENTIFIER";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.IDENTIFIER;
    }
}
class LogicExprNode : ASTNonTerminal
{
    this () {
        this.name = "LOGICEXPR";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.LOGICEXPR;
    }
}
class LogicOpLogicRelationshipNode : ASTNonTerminal
{
    this () {
        this.name = "LOGICOPLOGICRELATIONSHIP";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.LOGICOPLOGICRELATIONSHIP;
    }
}
class LogicRelationshipNode : ASTNonTerminal
{
    this () {
        this.name = "LOGICRELATIONSHIP";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.LOGICRELATIONSHIP;
    }
}
class RelationOpExpressionNode : ASTNonTerminal
{
    this () {
        this.name = "RELATIONOPEXPRESSION";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.RELATIONOPEXPRESSION;
    }
}
class LogicOpNode : ASTNonTerminal
{
    this () {
        this.name = "LOGICOP";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.LOGICOP;
    }
}
class RelationOpNode : ASTNonTerminal
{
    this () {
        this.name = "RELATIONOP";
    }
    override void accept(Visitor v) {
        v.visit(this);
    }
    override Tag getTag() {
        return Tag.RELATIONOP;
    }
}
enum Tag {
    PROGRAM,
    EXTERNIMPORT,
    FUNCDEF,
    ARGLIST,
    BLOCK,
    STATEMENT,
    ASSIGNMENT,
    PASS,
    IFBLOCK,
    ELSEIFBLOCK,
    ELSEBLOCK,
    WHILEBLOCK,
    PARAMLIST,
    FUNCCALL,
    RETURNSTMT,
    PRINT,
    SPAWN,
    CHANREAD,
    CHANWRITE,
    MAKECHAN,
    YIELD,
    EXPRESSION,
    SUM,
    SUMOPPRODUCT,
    PRODUCT,
    MULOPVALUE,
    VALUE,
    PARENEXPR,
    TERMINATOR,
    SUMOP,
    MULOP,
    NUM,
    IDENTIFIER,
    LOGICEXPR,
    LOGICOPLOGICRELATIONSHIP,
    LOGICRELATIONSHIP,
    RELATIONOPEXPRESSION,
    LOGICOP,
    RELATIONOP,
    ASTNONTERMINAL
}
class Parser
{
    this (string source)
    {
        this.source = source;
        this.index = 0;
        debug(TRACE) this.traceIndent = "";
    }
    ASTNode parse()
    {
        consumeWhitespace();
        ASTNode topNode = null;
        if (program())
        {
            topNode = stack[$-1];
        }
        index = 0;
        stack = [];
        return topNode;
    }
private:
    string source;
    uint index;
    ASTNode[] stack;
    debug (TRACE)
    {
        string traceIndent;
        enum tracer =
            `
            string funcName = __FUNCTION__;
            funcName =
                funcName[__MODULE__.length + typeof(this).stringof.length + 2..$];
            writeln(traceIndent, "Entered: ", funcName, ", L: ", getLineNumber(index), ", C:", getColumnNumber(index));
            traceIndent ~= "  ";
            scope(exit)
            {
                traceIndent = traceIndent[0..$-2];
                writeln(traceIndent, "Exiting: ", funcName, ", L: ", getLineNumber(index), ", C:", getColumnNumber(index));
            }
            `;
    }
    private uint getLineNumber(const uint index) pure
    {
        uint line = 1;
        for (auto i = 0; i < source[0..index].length; i++)
        {
            if (source[i] == '\n')
            {
                line++;
            }
        }
        return line;
    }
    private uint getColumnNumber(const uint index) pure
    {
        return cast(uint)(index - source[0..index].lastIndexOf('\n'));
    }
    bool program()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        while (externImport())
        {
            collectedNodes++;
        }
        if (funcDef())
        {
            collectedNodes++;
            while (funcDef())
            {
                collectedNodes++;
            }
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ProgramNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool externImport()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool externImportLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:extern)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (externImportLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ExternImportNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool funcDef()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool funcDefLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:func)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (funcDefLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (argList())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (block())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new FuncDefNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool argList()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool argListLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\()`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool argListLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\))`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool argListParen_1()
        {
            debug (TRACE) mixin(tracer);
            uint saveIndex = index;
            bool argListParen_1Paren_1()
            {
                debug (TRACE) mixin(tracer);
                uint saveIndex = index;
                bool argListParen_1Paren_1Literal_1()
                {
                    debug (TRACE) mixin(tracer);
                    auto reg = ctRegex!(`^(?:,)`);
                    auto mat = match(source[index..$], reg);
                    if (mat)
                    {
                        debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                        index += mat.captures[0].length;
                        consumeWhitespace();
                    }
                    else
                    {
                        debug (TRACE) writeln(traceIndent, "  No match.");
                        return false;
                    }
                    return true;
                }
                uint innerCollectedNodes = 0;
                if (argListParen_1Paren_1Literal_1())
                {
                }
                else
                {
                    stack = stack[0..$-innerCollectedNodes];
                    index = saveIndex;
                    return false;
                }
                if (identifier())
                {
                    auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
                    stack = stack[0..$-1];
                    foreach (child; tempNode.children)
                    {
                        stack ~= child;
                    }
                    innerCollectedNodes += tempNode.children.length;
                }
                else
                {
                    stack = stack[0..$-innerCollectedNodes];
                    index = saveIndex;
                    return false;
                }
                collectedNodes += innerCollectedNodes;
                return true;
            }
            uint innerCollectedNodes = 0;
            if (identifier())
            {
                auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
                stack = stack[0..$-1];
                foreach (child; tempNode.children)
                {
                    stack ~= child;
                }
                innerCollectedNodes += tempNode.children.length;
            }
            else
            {
                stack = stack[0..$-innerCollectedNodes];
                index = saveIndex;
                return false;
            }
            while (argListParen_1Paren_1())
            {
            }
            collectedNodes += innerCollectedNodes;
            return true;
        }
        if (argListLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (argListParen_1())
        {
        }
        if (argListLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ArgListNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool block()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool blockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\{)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool blockLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\})`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (blockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (statement())
        {
            collectedNodes++;
        }
        if (blockLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new BlockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool statement()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool statementParen_1()
        {
            debug (TRACE) mixin(tracer);
            uint saveIndex = index;
            uint innerCollectedNodes = 0;
            if (funcCall())
            {
                innerCollectedNodes++;
            }
            else
            {
                stack = stack[0..$-innerCollectedNodes];
                index = saveIndex;
                return false;
            }
            if (terminator())
            {
                stack = stack[0..$-1];
            }
            else
            {
                stack = stack[0..$-innerCollectedNodes];
                index = saveIndex;
                return false;
            }
            collectedNodes += innerCollectedNodes;
            return true;
        }
        if (assignment())
        {
            collectedNodes++;
        }
        else if (ifblock())
        {
            collectedNodes++;
        }
        else if (whileblock())
        {
            collectedNodes++;
        }
        else if (pass())
        {
            collectedNodes++;
        }
        else if (block())
        {
            collectedNodes++;
        }
        else if (print())
        {
            collectedNodes++;
        }
        else if (yield())
        {
            collectedNodes++;
        }
        else if (returnStmt())
        {
            collectedNodes++;
        }
        else if (spawn())
        {
            collectedNodes++;
        }
        else if (statementParen_1())
        {
        }
        else if (chanRead())
        {
            collectedNodes++;
        }
        else if (chanWrite())
        {
            collectedNodes++;
        }
        else if (makeChan())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new StatementNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool assignment()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool assignmentLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:=)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (assignmentLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (expression())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new AssignmentNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool pass()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool passLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:pass)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (passLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new PassNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool ifblock()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool ifblockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:if)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool ifblockLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\()`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool ifblockLiteral_3()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\))`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (ifblockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (ifblockLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicExpr())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (ifblockLiteral_3())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (statement())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (elseifblock())
        {
            collectedNodes++;
        }
        if (elseblock())
        {
            collectedNodes++;
        }
        auto nonTerminal = new IfblockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool elseifblock()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool elseifblockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:else)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool elseifblockLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:if)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool elseifblockLiteral_3()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\()`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool elseifblockLiteral_4()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\))`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (elseifblockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (elseifblockLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (elseifblockLiteral_3())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicExpr())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (elseifblockLiteral_4())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (statement())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ElseifblockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool elseblock()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool elseblockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:else)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (elseblockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (statement())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ElseblockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool whileblock()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool whileblockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:while)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool whileblockLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\()`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool whileblockLiteral_3()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\))`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (whileblockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (whileblockLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicExpr())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (whileblockLiteral_3())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (statement())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new WhileblockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool paramList()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool paramListLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\()`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool paramListLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\))`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool paramListParen_1()
        {
            debug (TRACE) mixin(tracer);
            uint saveIndex = index;
            bool paramListParen_1Paren_1()
            {
                debug (TRACE) mixin(tracer);
                uint saveIndex = index;
                bool paramListParen_1Paren_1Literal_1()
                {
                    debug (TRACE) mixin(tracer);
                    auto reg = ctRegex!(`^(?:,)`);
                    auto mat = match(source[index..$], reg);
                    if (mat)
                    {
                        debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                        index += mat.captures[0].length;
                        consumeWhitespace();
                    }
                    else
                    {
                        debug (TRACE) writeln(traceIndent, "  No match.");
                        return false;
                    }
                    return true;
                }
                uint innerCollectedNodes = 0;
                if (paramListParen_1Paren_1Literal_1())
                {
                }
                else
                {
                    stack = stack[0..$-innerCollectedNodes];
                    index = saveIndex;
                    return false;
                }
                if (expression())
                {
                    innerCollectedNodes++;
                }
                else
                {
                    stack = stack[0..$-innerCollectedNodes];
                    index = saveIndex;
                    return false;
                }
                collectedNodes += innerCollectedNodes;
                return true;
            }
            uint innerCollectedNodes = 0;
            if (expression())
            {
                innerCollectedNodes++;
            }
            else
            {
                stack = stack[0..$-innerCollectedNodes];
                index = saveIndex;
                return false;
            }
            while (paramListParen_1Paren_1())
            {
            }
            collectedNodes += innerCollectedNodes;
            return true;
        }
        if (paramListLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (paramListParen_1())
        {
        }
        if (paramListLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ParamListNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool funcCall()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (paramList())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new FuncCallNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool returnStmt()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool returnStmtLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:return)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (returnStmtLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (expression())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ReturnStmtNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool print()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool printLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:print)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (printLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new PrintNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool spawn()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool spawnLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:spawn)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (spawnLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (funcCall())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new SpawnNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool chanRead()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool chanReadLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:<\-)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (chanReadLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ChanReadNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool chanWrite()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool chanWriteLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\->)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (chanWriteLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ChanWriteNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool makeChan()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool makeChanLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:makechan)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (makeChanLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new MakeChanNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool yield()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool yieldLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:yield)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (yieldLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new YieldNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool expression()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (sum())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ExpressionNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool sum()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (product())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (sumOpProduct())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        auto nonTerminal = new SumNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool sumOpProduct()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (sumOp())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (product())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new SumOpProductNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool product()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (value())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (mulOpValue())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        auto nonTerminal = new ProductNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool mulOpValue()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (mulOp())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (value())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new MulOpValueNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool value()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (funcCall())
        {
            collectedNodes++;
        }
        else if (num())
        {
            collectedNodes++;
        }
        else if (parenExpr())
        {
            collectedNodes++;
        }
        else if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ValueNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool parenExpr()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool parenExprLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\()`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool parenExprLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\))`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (parenExprLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicExpr())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (parenExprLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ParenExprNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool terminator()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool terminatorLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:;)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (terminatorLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new TerminatorNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool sumOp()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool sumOpLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:[+-])`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (sumOpLiteral_1())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new SumOpNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool mulOp()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool mulOpLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:[*\/%])`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (mulOpLiteral_1())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new MulOpNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool num()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool numLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:[0-9]+(?:\.[0-9]*)?)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (numLiteral_1())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new NumNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool identifier()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool identifierLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:[a-zA-Z_][a-zA-Z0-9_]*)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (identifierLiteral_1())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new IdentifierNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool logicExpr()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (logicRelationship())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (logicOpLogicRelationship())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        auto nonTerminal = new LogicExprNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool logicOpLogicRelationship()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (logicOp())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicRelationship())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new LogicOpLogicRelationshipNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool logicRelationship()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (expression())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (relationOpExpression())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        auto nonTerminal = new LogicRelationshipNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool relationOpExpression()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (relationOp())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (expression())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new RelationOpExpressionNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool logicOp()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool logicOpLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:&&)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool logicOpLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:\|\|)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (logicOpLiteral_1())
        {
            collectedNodes++;
        }
        else if (logicOpLiteral_2())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new LogicOpNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool relationOp()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        bool relationOpLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:<=)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:>=)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_3()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:<)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_4()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:>)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_5()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:==)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_6()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^(?:!=)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                terminal.data["TOK_BEGIN"] = index;
                terminal.data["TOK_END"] = index + mat.captures[0].length;
                terminal.data["LINE"] = getLineNumber(index);
                terminal.data["COLUMN"] = getColumnNumber(index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        if (relationOpLiteral_1())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_2())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_3())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_4())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_5())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_6())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new RelationOpNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            node.setParent(nonTerminal);
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    void consumeWhitespace()
    {
        auto whitespaceRegex = ctRegex!(`^\s*`);
        auto whitespaceMatch = match(source[index..$], whitespaceRegex);
        if (whitespaceMatch)
        {
            index += whitespaceMatch.captures[0].length;
        }
    }
    void printStack(string indent = "")
    {
        foreach_reverse (x; stack)
        {
            if (cast(ASTNonTerminal)x !is null)
            {
                x.printTree(indent);
            }
            else if (cast(ASTTerminal)x !is null)
            {
                writeln("[", (cast(ASTTerminal)x).token, "]: ", (cast(ASTTerminal)x).index);
            }
        }
    }
}

