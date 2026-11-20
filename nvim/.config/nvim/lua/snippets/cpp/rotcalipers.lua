local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("rotcalipers", {
    t({
      "long long convex_diameter2(const vector<Point> &hull) {",
      "  int n = (int)hull.size();",
      "  if (n == 0) return 0;",
      "  if (n == 1) return 0;",
      "  if (n == 2) return (hull[0] - hull[1]).norm2();",
      "  long long best = 0;",
      "  int j = 1;",
      "  for (int i = 0; i < n; i++) {",
      "    int ni = (i + 1) % n;",
      "    while (true) {",
      "      int nj = (j + 1) % n;",
      "      long long cur = abs((hull[ni] - hull[i]).cross(hull[j] - hull[i]));",
      "      long long nxt = abs((hull[ni] - hull[i]).cross(hull[nj] - hull[i]));",
      "      if (nxt > cur) j = nj;",
      "      else break;",
      "    }",
      "    best = max(best, (hull[i] - hull[j]).norm2());",
      "    best = max(best, (hull[ni] - hull[j]).norm2());",
      "  }",
      "  return best;",
      "}",
    }),
  }),
})
