tests [![Build Status](https://travis-ci.org/dubxcoin/
tests.svg?branch=develop)](https://travis-ci.org/dubxcoin/
tests)
=====

Common tests for all clients to test against. See the documentation http://www.ethdocs.org/en/latest/contracts-and-transactions/dubxcoin-tests/index.html

Do not chagne test files in folders:

- StateTests
- BlockchainTests
- TransactionTests
- VMTests

It is being created by the testFillers which could be found at https://github.com/DUBXCOIN/cpp-dubxcoin/tree/develop/test/libethereum

If you want to modify a test filler or add a new test please contact @winsvega at https://gitter.im/dubxcoin/
cpp-dubxcoin

All files should be of the form:

```
{
	"test1name":
	{
		"test1property1": ...,
		"test1property2": ...,
		...
	},
	"test2name":
	{
		"test2property1": ...,
		"test2property2": ...,
		...
	}
}
```

Arrays are allowed, but don't use them for sets of properties - only use them for data that is clearly a continuous contiguous sequence of values.
