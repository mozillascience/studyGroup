import unittest

def splitter(the_list):
    return splitter_e(the_list)

def splitter_a(x):
    """
    Return nothing useful just to prevent errors
    """
    return ()

def splitter_b(x):
    """
    Only work for the simple case
    """
    return ([1], 2, [3])

def splitter_c(x):
    """
    A version that kinda works in python2, but not 3
    """
    length = len(x)
    return ( x[:length/2], x[length/2], x[length/2+1:] )

def splitter_d(x):
    """
    A version that kinda works in Python 3
    """
    length = len(x)
    return (x[:length//2], x[length//2], x[length//2+1:] )

def splitter_e(x):
    """
    This version should fully work
    """
    length = len(x)
    if length == 0:
        return ([], None, [])
    elif length % 2 == 0:
        return (x[:length//2], None, x[length//2:])
    else:
        return (x[:length//2], x[length//2], x[length//2+1:])

class TestSplitter(unittest.TestCase):

    def test_simple_case(self):
        self.assertTupleEqual(splitter([1,2,3]), ([1], 2, [3]))

    # TODO: More tests
    # (hint: length of lists, or types inside)

    def test_even_length(self):
        self.assertTupleEqual(splitter([2,4]), ([2], None, [4]))

    def test_odd_length(self):
        self.assertTupleEqual(splitter([1,4,2,6,8]), ([1,4], 2, [6,8]))

    def test_empty(self):
        self.assertTupleEqual(splitter([]), ([], None, []))

    def test_length_one(self):
        self.assertTupleEqual(splitter(['a']), ([], 'a', []))


if __name__ == '__main__':
    unittest.main()
