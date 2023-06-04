
from unittest import TestCase
from unittest.mock import patch, call

import foo


class TestGetFullTextArticleFromTitle(TestCase):
    @patch("builtins.print")
    def test_hello_var_should_print_correct_string(self, mocked_print):
        foo.hello_var("foo")
        assert mocked_print.mocked_calls == [call("Hello foo")]
