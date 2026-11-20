local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("segint", {
    t({
      "bool segments_intersect(const Point &a, const Point &b, const Point &c, const Point &d) {",
      "  auto sgn = [](long long v) { return (v > 0) - (v < 0); };",
      "  auto on_segment = [](const Point &p, const Point &q, const Point &r) {",
      "    return min(p.x, r.x) <= q.x && q.x <= max(p.x, r.x) &&",
      "           min(p.y, r.y) <= q.y && q.y <= max(p.y, r.y);",
      "  };",
      "  long long d1 = sgn((b - a).cross(c - a));",
      "  long long d2 = sgn((b - a).cross(d - a));",
      "  long long d3 = sgn((d - c).cross(a - c));",
      "  long long d4 = sgn((d - c).cross(b - c));",
      "  if (d1 != d2 && d3 != d4) return true;",
      "  if (d1 == 0 && on_segment(a, c, b)) return true;",
      "  if (d2 == 0 && on_segment(a, d, b)) return true;",
      "  if (d3 == 0 && on_segment(c, a, d)) return true;",
      "  if (d4 == 0 && on_segment(c, b, d)) return true;",
      "  return false;",
      "}",
    }),
  }),
})
