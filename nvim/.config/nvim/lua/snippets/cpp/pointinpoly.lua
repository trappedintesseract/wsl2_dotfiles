local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("pointinpoly", {
    t({
      "bool point_in_polygon(const vector<Point> &poly, const Point &p) {",
      "  int n = (int)poly.size();",
      "  bool inside = false;",
      "  for (int i = 0, j = n - 1; i < n; j = i++) {",
      "    const Point &a = poly[i], &b = poly[j];",
      "    if ((a.y > p.y) == (b.y > p.y)) continue;",
      "    __int128 lhs = (__int128)(p.x - a.x) * (b.y - a.y);",
      "    __int128 rhs = (__int128)(p.y - a.y) * (b.x - a.x);",
      "    bool leftOfCrossing = (b.y > a.y) ? (lhs < rhs) : (lhs > rhs);",
      "    if (leftOfCrossing) inside = !inside;",
      "  }",
      "  return inside;",
      "}",
    }),
  }),
})
