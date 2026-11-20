local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("sieve", {
    t({
      "vector<int> sieve(int n) {",
      "  vector<bool> is(n + 1, true);",
      "  vector<int> primes;",
      "  for (int i = 2; i <= n; i++) {",
      "    if (is[i]) {",
      "      primes.push_back(i);",
      "      for (long long j = 1LL * i * i; j <= n; j += i) is[(int)j] = false;",
      "    }",
      "  }",
      "  return primes;",
      "}",
    }),
  }),
})
