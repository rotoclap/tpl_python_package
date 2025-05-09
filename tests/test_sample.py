import pytest

import my_package


def test_sample():
    assert isinstance(my_package.__version__, str)
