local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("crt", {
    t({
      "pair<long long, long long> crt(const vector<long long> &r, const vector<long long> &m) {",
      "  auto inv_mod = [](long long a, long long mod) {",
      "    long long b = mod, u = 1, v = 0;",
      "    while (b) {",
      "      long long t = a / b;",
      "      a -= t * b;",
      "      swap(a, b);",
      "      u -= t * v;",
      "      swap(u, v);",
      "    }",
      "    return ((u % mod) + mod) % mod;",
      "  };",
      "  long long x = 0, mod = 1;",
      "  for (int i = 0; i < (int)r.size(); i++) {",
      "    long long a = ((r[i] % m[i]) + m[i]) % m[i];",
      "    long long g = gcd(mod, m[i]);",
      "    if ((a - x) % g != 0) return {-1, -1};",
      "    long long mi = m[i] / g;",
      "    long long rhs = (((a - x) / g) % mi + mi) % mi;",
      "    long long t = rhs * inv_mod((mod / g) % mi, mi) % mi;",
      "    x = (x + mod * t) % (mod * mi);",
      "    mod *= mi;",
      "  }",
      "  return {x, mod};",
      "}",
    }),
  }),
})
