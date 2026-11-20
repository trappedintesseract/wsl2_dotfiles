local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("bm", {
    t({
      "vector<long long> berlekamp_massey(const vector<long long> &s, long long mod) {",
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
      "  vector<long long> C(1, 1), B(1, 1);",
      "  int L = 0, m = 1;",
      "  long long b = 1;",
      "  for (int n = 0; n < (int)s.size(); n++) {",
      "    long long d = s[n] % mod;",
      "    for (int i = 1; i <= L; i++) d = (d + C[i] * s[n - i]) % mod;",
      "    if (d == 0) {",
      "      m++;",
      "      continue;",
      "    }",
      "    vector<long long> T = C;",
      "    long long coef = d * power(b, mod - 2) % mod;",
      "    if ((int)C.size() < (int)B.size() + m) C.resize(B.size() + m, 0);",
      "    for (int i = 0; i < (int)B.size(); i++) C[i + m] = ((C[i + m] - coef * B[i]) % mod + mod) % mod;",
      "    if (2 * L <= n) {",
      "      L = n + 1 - L;",
      "      B = T;",
      "      b = d;",
      "      m = 1;",
      "    } else",
      "      m++;",
      "  }",
      "  vector<long long> rec(L + 1, 0);",
      "  for (int i = 0; i <= L; i++) rec[i] = (mod - C[i]) % mod;",
      "  return rec;",
      "}",
    }),
  }),
})
