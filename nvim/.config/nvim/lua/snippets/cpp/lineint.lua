local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("lineint", {
    t({
      "pair<bool, pair<double, double>> line_intersection(const Point &a, const Point &b, const Point &c, const Point &d) {",
      "  long long den = (b - a).cross(d - c);",
      "  if (den == 0) return {false, {0, 0}};",
      "  double t = (double)(c - a).cross(d - c) / (double)den;",
      "  return {true, {(double)a.x + t * (b.x - a.x), (double)a.y + t * (b.y - a.y)}};",
      "}",
    }),
  }),
})
