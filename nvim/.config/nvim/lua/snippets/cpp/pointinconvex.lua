local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("pointinconvex", {
    t({
      "bool point_in_convex_polygon(const vector<Point> &poly, const Point &p) {",
      "  int n = (int)poly.size();",
      "  if (n == 1) return p == poly[0];",
      "  if (n == 2) {",
      "    if ((poly[1] - poly[0]).cross(p - poly[0]) != 0) return false;",
      "    return min(poly[0].x, poly[1].x) <= p.x && p.x <= max(poly[0].x, poly[1].x) &&",
      "           min(poly[0].y, poly[1].y) <= p.y && p.y <= max(poly[0].y, poly[1].y);",
      "  }",
      "  if ((poly[1] - poly[0]).cross(p - poly[0]) < 0) return false;",
      "  if ((poly[n - 1] - poly[0]).cross(p - poly[0]) > 0) return false;",
      "  int lo = 1, hi = n - 1;",
      "  while (hi - lo > 1) {",
      "    int mid = (lo + hi) / 2;",
      "    if ((poly[mid] - poly[0]).cross(p - poly[0]) >= 0) lo = mid;",
      "    else hi = mid;",
      "  }",
      "  return (poly[(lo + 1) % n] - poly[lo]).cross(p - poly[lo]) >= 0;",
      "}",
    }),
  }),
})
