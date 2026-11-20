local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("lucas", {
    t({
      "struct Lucas {",
      "  static long long power(long long a, long long e, long long mod) {",
      "    long long r = 1 % mod;",
      "    a %= mod;",
      "    while (e > 0) {",
      "      if (e & 1) r = r * a % mod;",
      "      a = a * a % mod;",
      "      e >>= 1;",
      "    }",
      "    return r;",
      "  }",
      "  static long long small_nCr(long long n, long long r, long long p) {",
      "    if (r < 0 || r > n) return 0;",
      "    long long num = 1, den = 1;",
      "    for (long long i = 1; i <= r; i++) {",
      "      num = num * ((n - r + i) % p) % p;",
      "      den = den * (i % p) % p;",
      "    }",
      "    return num * power(den, p - 2, p) % p;",
      "  }",
      "  static long long nCr(long long n, long long r, long long p) {",
      "    if (r < 0 || r > n) return 0;",
      "    long long res = 1;",
      "    while (n > 0 || r > 0) {",
      "      long long ni = n % p, ri = r % p;",
      "      res = res * small_nCr(ni, ri, p) % p;",
      "      n /= p;",
      "      r /= p;",
      "    }",
      "    return res;",
      "  }",
      "};",
    }),
  }),
})
