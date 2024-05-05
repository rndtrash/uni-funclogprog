package lab5

import java.lang.System.`in`
import java.util.*
import kotlin.math.max

class MainRecursion {
    // произведение цифр вниз
    tailrec fun digitProductDownA(n: Int, a: Int): Int =
        if (n < 10)
            n * a
        else
            digitProductDownA(n / 10, a * (n % 10))

    fun digitProductDown(n: Int): Int = digitProductDownA(n, 1)

    // произведение цифр вверх
    fun digitProductUp(n: Int): Int = if (n == 0) 1 else digitProductUp(n / 10) * (n % 10)

    // максимальная цифра, не делящаяся на 3 вниз
    tailrec fun maxDigitNotDivisibleBy3DownA(n: Int, a: Int): Int =
        if (n <= 0)
            a
        else
            maxDigitNotDivisibleBy3DownA(n / 10, if ((n % 10) % 3 != 0) max(n % 10, a) else a)

    fun maxDigitNotDivisibleBy3Down(n: Int): Int = maxDigitNotDivisibleBy3DownA(n, -1)

    // максимальная цифра, не деляшаяся на 3 вверх
    fun maxDigitNotDivisibleBy3Up(n: Int): Int {
        if (n <= 0)
            return -1

        val digit = n % 10;
        val next = maxDigitNotDivisibleBy3Up(n / 10);
        return if (digit % 3 != 0) max(digit, next) else next;
    }

    // подсчёт делителей числа вниз
    tailrec fun countDivisorsDownA(n: Int, d: Int, c: Int): Int =
        if (d >= n)
            c
        else
            countDivisorsDownA(n, d + 1, if (n % d == 0) c + 1 else c)

    fun countDivisorsDown(n: Int): Int =
        if (n == 1)
            1
        else
            countDivisorsDownA(n, 2, 2)

    // подсчёт делителей числа вверх
    fun countDivisorsUpA(n: Int, d: Int): Int =
        if (d >= n)
            0
        else
            countDivisorsUpA(n, d + 1) + if (n % d == 0) 1 else 0

    fun countDivisorsUp(n: Int): Int =
        if (n == 1)
            1
        else
            2 + countDivisorsUpA(n, 2)

    // функция высшего порядка для поиска цифр, подходящих под условие
    tailrec fun findDigits(
        n: Int,
        result: Int,
        digitCondition: (digit: Int) -> Boolean,
        resultModifier: (result: Int, digit: Int) -> Int
    ): Int {
        if (n <= 0)
            return result

        val digit = n % 10;
        return findDigits(
            n / 10, if (digitCondition(digit))
                resultModifier(result, digit)
            else
                result, digitCondition, resultModifier
        )
    }

    fun highOrderDigitProduct(n: Int): Int = findDigits(n, 1, { digit -> true }, { result, digit -> result * digit })
    fun highOrderMaxNotDivisibleBy3(n: Int): Int =
        findDigits(n, -1, { digit -> (digit % 3 != 0) }, { result, digit -> max(result, digit) })

    fun main() {
        val scanner = Scanner(`in`)
        val x: Int = scanner.nextInt()
        println(digitProductDown(x))
        println(digitProductUp(x))
    }
}

fun main() = MainRecursion().main()