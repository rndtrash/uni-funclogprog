package lab5

import kotlin.math.ceil
import kotlin.math.max
import kotlin.math.sqrt

class MainLoop {
    fun digitProduct(n: Int): Int {
        var product = 1;
        var currentN = n;
        while (currentN > 0) {
            product *= currentN % 10;
            currentN /= 10;
        }
        return product;
    }

    fun maxDigitNotDivisibleBy3(n: Int): Int {
        var currentN = n / 10;
        var maxDigit = -1;
        while (currentN > 0) {
            val digit = currentN % 10;
            if (digit % 3 != 0)
                maxDigit = max(maxDigit, digit)
            currentN /= 10;
        }

        return maxDigit;
    }

    fun countDivisors(n: Int): Int {
        if (n == 1)
            return 1

        var count = 2; // 1 и само число
        var divisor = 2;
        while (divisor < n) {
            if (n % divisor == 0)
                count++

            divisor++
        }

        return count
    }

    fun main() {
        //
    }
}

fun main() = MainLoop().main()