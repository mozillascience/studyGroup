import unittest

def average(xs):
    length = len(xs)
    acc = 0
    for i in range(1, length):
        acc = acc + xs[i]
    return acc / length

class TestAverage(unittest.TestCase):

    def test_average_of_ones(self):
        self.assertEqual(average([1, 1, 1, 1]), 1)

    @unittest.skip('will raise an error')
    def test_average_of_nothing(self):
        self.assertEqual(average([]), 0)

if __name__ == '__main__':
    unittest.main()
