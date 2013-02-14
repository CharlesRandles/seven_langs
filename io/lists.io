/*
2. How would you change / to return 0 if the denominator is zero?
3. Write a program to add up all of the numbers in a two-dimensional array.
4. Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)
￼Prepared exclusively for Dewi Randles report erratum • discuss
5. Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.
6. Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.
7. Write the matrix to a file, and read a matrix from a file.
*/

//a 2-d array is a list of lists
//So, we need to be able to sum a list,
//then map thed method across a list

//Question 3 - deliberately inept
triple := method (n, list(n, n+1, n+2))

ll := list(
        triple(1),
        triple(4),
        triple(7))

sum_2d := method (array,
        total :=0
        array foreach (idx, row,
                (total = total + (row sum)))
                total)
sum_2d(ll) println //Gives 45

//Question 4. And I claim my bonus point.
//As verbose as I can make it
List myAverage := method (
        count :=0
        sum := 0
        self foreach (i, v,
                if (v type == "Number",
                        (count = count + 1
                        sum = sum + v),
                        Exception raise("Non-number element found.")))

        sum/count)

l := list(1,2,3,5)

l myAverage println

