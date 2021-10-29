# # ########################################################################


def prime_number(number: int):
    """
    This code below shows all prime numbers that are below a certain value

    :param number: number represents the variable (int) that will be used as
    a limit to define prime numbers
    :return: return will return a list of prime numbers until it reaches the
    maximum number which is the variable 'number'
    """
    numbers_list = []

    for n in range(2, number + 1):
        for i in range(2, n):
            if n % i == 0:
                break
        else:
            numbers_list.append(n)
    return numbers_list


# # ########################################################################

def number_comp(number):
    """
    This code below computes the factors of a given number

    :param number: number is a variation (int) to which the factors will
    be computed
    :return: the return will show the list of factors that were computed from
    the variable 'number'
    """
    list_of_factors = []
    for i in range(1, number + 1):
        if number % i == 0:
            list_of_factors.append(i)
    return list_of_factors


# # ########################################################################

def minimun_divisor(number1, number2):
    """
    This code below calculates the least common multiple (minimun_divisor).
    The least common multiple (minimun_divisor) corresponds to the
    smallest positive integer, other than zero, which is a
    multiple of two or more numbers at the same time.

    :param number1: Number1 represents the first variable (int)
    that the function
    will receive to define the minimum of common division
    :param number2: Number2 represents the second variable (int) that
    the function
    will receive to define the minimum of common division
    :return: The return will bring us the common number
    """
    if number1 > number2:
        divisor = number1
    else:
        divisor = number1
    while True:
        if divisor % number1 == 0 and divisor % number2 == 0:
            common_number = divisor
            break
        divisor += 1
    return common_number


# ########################################################################

def max_divisor(number1, number2):
    """
    This code below computes the greatest common divisor between two numbers.

    :param number1:  number1 represents the first variable (int) that the
    function will receive to define the largest of division
    :param number2: number2 represents the second variable (int) that
    the function will receive to define the greatest of division
    :return: The return will show the value of the largest common divisor (int)
    """
    common = 0
    if number1 > number2:
        smallest = number2
    else:
        smallest = number1
    for i in range(1, smallest + 1):
        if number1 % i == 0 and number2 % i == 0:
            common = i
    return common


# ########################################################################


def sort_crescent(number1, number2, number3):
    """
    This code below sorts the values of a list in an ascending manner.

    :param number1: Number1 presents the first variable in the list
    to be ordered
    :param number2: Number2 presents the second variable in the list
    to be ordered
    :param number3: Number3 presents the third variable in the list
    to be ordered
    :return: return will display the list of integer values in ascending order
    """
    list_sort = [
        number1, number2, number3
    ]

    for k in range(len(list_sort)):
        for j in range(k + 1, len(list_sort)):
            if list_sort[k] > list_sort[j]:
                tmp = list_sort[k]
                list_sort[k] = list_sort[j]
                list_sort[j] = tmp
    return list_sort


# ########################################################################

#pr = prime_number(10)  # prime numbers
#print(pr)

#fa = number_comp(6)  # number factors
#print(fa)

#lc = minimun_divisor(2, 8)  # lower common multiple
#print(lc)

#gc = max_divisor(6, 18)  # greatest common divisor
#print(gc)

#ls = sort_crescent(2, 4, 6)  # sort a list
#print(ls)
a = True and False
b = False or True
c = not (a) and not (b)
d = not (a) or b

print(a)
print(b)
print(c)
print(d)