package lab5;

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class MainKtTest {

    @Test
    fun digitProduct() {
        val mainLoop = MainLoop()
        val mainRecursion = MainRecursion()
        val input = 1234
        val expected = 24
        assertEquals(expected, mainLoop.digitProduct(input))
        assertEquals(expected, mainRecursion.digitProductDown(input))
        assertEquals(expected, mainRecursion.digitProductUp(input))
        assertEquals(expected, mainRecursion.highOrderDigitProduct(input))
    }

    @Test
    fun maxDigitNotDivisibleBy3() {
        val mainLoop = MainLoop()
        val mainRecursion = MainRecursion()

        fun checkAll(input: Int, expected: Int) {
            assertEquals(expected, mainLoop.maxDigitNotDivisibleBy3(input))
            assertEquals(expected, mainRecursion.maxDigitNotDivisibleBy3Down(input))
            assertEquals(expected, mainRecursion.maxDigitNotDivisibleBy3Up(input))
            assertEquals(expected, mainRecursion.highOrderMaxNotDivisibleBy3(input))
        }

        checkAll(128034, 8)
        checkAll(0, -1)
        checkAll(369, -1)
    }

    @Test
    fun countDivisors() {
        val mainLoop = MainLoop()
        val mainRecursion = MainRecursion()

        fun checkAll(input: Int, expected: Int) {
            assertEquals(expected, mainLoop.countDivisors(input))
            assertEquals(expected, mainRecursion.countDivisorsDown(input))
            assertEquals(expected, mainRecursion.countDivisorsUp(input))
        }

        checkAll(1, 1)
        checkAll(2, 2)
        checkAll(6, 4)
        checkAll(123, 4) // 1, 3, 41, 123
        checkAll(652, 6) // 1, 2, 4, 163, 326, 652
    }

}