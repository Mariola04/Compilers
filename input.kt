fun main() {
    // 1. Variable Declarations and Assignments
    var a: Int = 10;    // Mutable variable
    val b: Double = 20.5;    // Immutable variable

    print("Initial values of a: " + a + " and b: " + b + "\n");

    // Assigning a new value to 'a'
    a = 15;
    print("Updated value of a: " + a + "\n");

    // 2. Arithmetic Expressions
    val sum: Double = a + b;
    val difference: Double = b - a;
    val product: Double = a * b;
    val quotient: Double = b / a;
    val remainder: Double = b % a;

    print("Arithmetic expressions:\n");
    print("Sum: " + sum  + "\n");
    print("Difference: " + difference  + "\n");
    print("Product: " + product + "\n");
    print("Quotient: " + quotient + "\n");
    print("Remainder: " + remainder + "\n");

    // 3. Boolean Expressions
    val isAGreaterThanB: Boolean = a > b;
    val isALessThanB: Boolean = a < b;
    print("Boolean expressions:\n");
    print("Is a greater than b? " + isAGreaterThanB + "\n");
    print("Is a less than b? " + isALessThanB + "\n");

    // 4. Reading input from the user
    print("Enter your name: ");
    val name: String = readln();
    print("Hello, " + name + "!" + "\n");

    // 5. Conditional Expressions (if-then-else)
    print("Conditional expression:\n");
    if (a > b) {
        print("a is greater than b\n");
    } else {
        if (a < b) {
            print("a is less than b\n");
        } else {
            print("a is equal to b\n");
        }
    }

    // 6. While Loop
    var counter: Int = 0;
    print("While loop:\n");
    while (counter < 5) {
        print("Counter: " + counter + "\n");
        counter++;  // Incrementing counter
    }

    // 7. Combining arithmetic and boolean expressions with a while loop
    var x: Int = 5;
    print("Counting down with a while loop:\n");
    while (x > 0) {
        print("x = " + x + "\n");
        x--;
    }

    // 8. Chars
    print("Chars:\n");
    val c1: Char = 'a';
    print("a: " + c1 + "\n");
    val c2: Char = '\n';
    print("\\n: " + c2 + "\n");
    val c3: Char = '\\';
    print("\\\\: " + c3 + "\n");
    val c4: Char = ' ';
    print(" : " + c4 + "\n");

    // Final message to test the compiler
    print("Kotlin test complete!\n");
}