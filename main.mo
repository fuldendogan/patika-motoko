import Float "mo:base/Float";
import Int "mo:base/Int";
import Debug "mo:base/Debug";

actor AdvancedCalculator {
    var memory: Float = 0;
    var lastOperation: Text = "";

    public func add(n: Float) : async Float {
        memory += n;
        lastOperation := "addition";
        memory
    };

    public func subtract(n: Float) : async Float {
        memory -= n;
        lastOperation := "subtraction";
        memory
    };

    public func multiply(n: Float) : async Float {
        memory *= n;
        lastOperation := "multiplication";
        memory
    };

    public func divide(n: Float) : async ?Float {
        if (n == 0) {
            lastOperation := "division by zero error";
            null
        } else {
            memory /= n;
            lastOperation := "division";
            ?memory
        }
    };

    public func power(n: Float) : async Float {
        memory := Float.pow(memory, n);
        lastOperation := "exponentiation";
        memory
    };

    public func squareRoot() : async ?Float {
        if (memory < 0) {
            lastOperation := "square root of negative number error";
            null
        } else {
            memory := Float.sqrt(memory);
            lastOperation := "square root";
            ?memory
        }
    };

    public func percentage() : async Float {
        memory /= 100;
        lastOperation := "percentage";
        memory
    };

    public func clear() : async () {
        memory := 0;
        lastOperation := "clear";
    };

    public func getMemory() : async Float {
        memory
    };

    public func getLastOperation() : async Text {
        lastOperation
    };

    public func absolute() : async Float {
        memory := Float.abs(memory);
        lastOperation := "absolute value";
        memory
    };

    public func roundToInteger() : async Int {
        let rounded = Float.nearest(memory);
        memory := rounded;
        lastOperation := "round to integer";
        Float.toInt(rounded)
    };

    public func reciprocal() : async ?Float {
        if (memory == 0) {
            lastOperation := "reciprocal of zero error";
            null
        } else {
            memory := 1 / memory;
            lastOperation := "reciprocal";
            ?memory
        }
    };

    public func log() : async ?Float {
        if (memory <= 0) {
            lastOperation := "logarithm of non-positive number error";
            null
        } else {
            memory := Float.log(memory);
            lastOperation := "natural logarithm";
            ?memory
        }
    };
}
