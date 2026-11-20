local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("convexhull", {
    t({
      "vector<Point> convex_hull(vector<Point> pts) {",
      "  sort(pts.begin(), pts.end());",
      "  pts.erase(unique(pts.begin(), pts.end()), pts.end());",
      "  int n = (int)pts.size();",
      "  if (n < 3) return pts;",
      "  vector<Point> hull;",
      "  for (int pass = 0; pass < 2; pass++) {",
      "    size_t start = hull.size();",
      "    for (int i = 0; i < n; i++) {",
      "      int idx = pass == 0 ? i : n - 1 - i;",
      "      while (hull.size() >= start + 2 &&",
      "             (hull[hull.size() - 1] - hull[hull.size() - 2]).cross(pts[idx] - hull.back()) <= 0)",
      "        hull.pop_back();",
      "      hull.push_back(pts[idx]);",
      "    }",
      "    hull.pop_back();",
      "  }",
      "  return hull;",
      "}",
    }),
  }),
})
