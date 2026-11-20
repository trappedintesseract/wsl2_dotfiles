local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("lagrange", {
    t({
      "long long lagrange_eval(const vector<long long> &y, long long x, long long mod) {",
      "  int k = (int)y.size() - 1;",
      "  if (x >= 0 && x <= k) return y[(int)x] % mod;",
      "  auto power = [&](long long a, long long e) {",
      "    long long r = 1 % mod;",
      "    a %= mod;",
      "    while (e > 0) {",
      "      if (e & 1) r = r * a % mod;",
      "      a = a * a % mod;",
      "      e >>= 1;",
      "    }",
      "    return r;",
      "  };",
      "  vector<long long> pre(k + 2, 1), suf(k + 2, 1), fact(k + 1, 1);",
      "  for (int i = 0; i <= k; i++) pre[i + 1] = pre[i] * (((x - i) % mod + mod) % mod) % mod;",
      "  for (int i = k; i >= 0; i--) suf[i] = suf[i + 1] * (((x - i) % mod + mod) % mod) % mod;",
      "  for (int i = 1; i <= k; i++) fact[i] = fact[i - 1] * i % mod;",
      "  long long res = 0;",
      "  for (int i = 0; i <= k; i++) {",
      "    long long num = pre[i] * suf[i + 1] % mod;",
      "    long long den = fact[i] * fact[k - i] % mod;",
      "    long long term = y[i] % mod * num % mod * power(den, mod - 2) % mod;",
      "    if ((k - i) & 1) term = (mod - term) % mod;",
      "    res = (res + term) % mod;",
      "  }",
      "  return res;",
      "}",
    }),
  }),
})
