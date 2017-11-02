import unittest


class TestSplitter(unittest.TestCase):

    def test_simple_case(self):
        self.assertTupleEqual(splitter([1,2,3]), ([1], 2, [3]))

    # TODO: More tests
    # (hint: length of lists, or types inside)


if __name__ == '__main__':
    unittest.main()
