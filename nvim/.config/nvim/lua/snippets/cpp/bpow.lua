local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("bpow", {
    t({
      "long long modpow(long long a, long long e, long long mod) {",
      "  a %= mod;",
      "  if (a < 0) a += mod;",
      "  long long r = 1 % mod;",
      "  while (e > 0) {",
      "    if (e & 1) r = r * a % mod;",
      "    a = a * a % mod;",
      "    e >>= 1;",
      "  }",
      "  return r;",
      "}",
    }),
  }),
})
