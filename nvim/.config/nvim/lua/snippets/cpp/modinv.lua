local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("modinv", {
    t({
      "long long modinv(long long a, long long mod) {",
      "  long long b = mod, u = 1, v = 0;",
      "  while (b) {",
      "    long long t = a / b;",
      "    a -= t * b;",
      "    swap(a, b);",
      "    u -= t * v;",
      "    swap(u, v);",
      "  }",
      "  u %= mod;",
      "  if (u < 0) u += mod;",
      "  return u;",
      "}",
    }),
  }),
})
