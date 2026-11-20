local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("fact", {
    t({
      "struct Comb {",
      "  long long mod;",
      "  vector<long long> fact, inv_fact;",
      "  explicit Comb(int n, long long mod_ = 1000000007) : mod(mod_) {",
      "    fact.assign(n + 1, 1);",
      "    inv_fact.assign(n + 1, 1);",
      "    for (int i = 1; i <= n; i++) fact[i] = fact[i - 1] * i % mod;",
      "    inv_fact[n] = power(fact[n], mod - 2);",
      "    for (int i = n; i > 0; i--) inv_fact[i - 1] = inv_fact[i] * i % mod;",
      "  }",
      "  long long power(long long a, long long e) const {",
      "    long long r = 1 % mod;",
      "    a %= mod;",
      "    while (e > 0) {",
      "      if (e & 1) r = r * a % mod;",
      "      a = a * a % mod;",
      "      e >>= 1;",
      "    }",
      "    return r;",
      "  }",
      "  long long nCr(int n, int r) const {",
      "    if (r < 0 || r > n) return 0;",
      "    return fact[n] * inv_fact[r] % mod * inv_fact[n - r] % mod;",
      "  }",
      "  long long nPr(int n, int r) const {",
      "    if (r < 0 || r > n) return 0;",
      "    return fact[n] * inv_fact[n - r] % mod;",
      "  }",
      "};",
    }),
  }),
})
