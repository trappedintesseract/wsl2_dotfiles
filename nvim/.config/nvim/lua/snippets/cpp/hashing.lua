local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("hashing", {
    t({
      "struct StrHash {",
      "  static constexpr long long M1 = 1000000007, M2 = 1000000009, B = 131;",
      "  vector<long long> h1, h2, p1, p2;",
      "  StrHash(const string &s) {",
      "    int n = (int)s.size();",
      "    h1.assign(n + 1, 0);",
      "    h2.assign(n + 1, 0);",
      "    p1.assign(n + 1, 1);",
      "    p2.assign(n + 1, 1);",
      "    for (int i = 0; i < n; i++) {",
      "      p1[i + 1] = p1[i] * B % M1;",
      "      p2[i + 1] = p2[i] * B % M2;",
      "      h1[i + 1] = (h1[i] * B + (unsigned char)s[i]) % M1;",
      "      h2[i + 1] = (h2[i] * B + (unsigned char)s[i]) % M2;",
      "    }",
      "  }",
      "  pair<long long, long long> sub(int l, int r) const {",
      "    long long a = ((h1[r] - h1[l] * p1[r - l]) % M1 + M1) % M1;",
      "    long long b = ((h2[r] - h2[l] * p2[r - l]) % M2 + M2) % M2;",
      "    return {a, b};",
      "  }",
      "};",
    }),
  }),
})
