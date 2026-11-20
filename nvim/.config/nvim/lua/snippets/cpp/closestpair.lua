local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("closestpair", {
    t({
      "long long closest_pair_dist2(vector<Point> pts) {",
      "  sort(pts.begin(), pts.end());",
      "  int n = (int)pts.size();",
      "  if (n < 2) return LLONG_MAX;",
      "  long long best = LLONG_MAX;",
      "  vector<Point> strip;",
      "  function<void(int, int)> rec = [&](int lo, int hi) {",
      "    if (hi - lo <= 3) {",
      "      for (int i = lo; i < hi; i++)",
      "        for (int j = i + 1; j < hi; j++) best = min(best, (pts[i] - pts[j]).norm2());",
      "      sort(pts.begin() + lo, pts.begin() + hi, [](const Point &a, const Point &b) { return a.y != b.y ? a.y < b.y : a.x < b.x; });",
      "      return;",
      "    }",
      "    int mid = (lo + hi) / 2;",
      "    long long midX = pts[mid].x;",
      "    rec(lo, mid);",
      "    rec(mid, hi);",
      "    vector<Point> merged;",
      "    merge(pts.begin() + lo, pts.begin() + mid, pts.begin() + mid, pts.begin() + hi, back_inserter(merged),",
      "          [](const Point &a, const Point &b) { return a.y != b.y ? a.y < b.y : a.x < b.x; });",
      "    copy(merged.begin(), merged.end(), pts.begin() + lo);",
      "    strip.clear();",
      "    for (int i = lo; i < hi; i++)",
      "      if ((pts[i].x - midX) * (pts[i].x - midX) < best) strip.push_back(pts[i]);",
      "    for (int i = 0; i < (int)strip.size(); i++)",
      "      for (int j = i + 1; j < (int)strip.size() && (strip[j].y - strip[i].y) * (strip[j].y - strip[i].y) < best; j++)",
      "        best = min(best, (strip[i] - strip[j]).norm2());",
      "  };",
      "  rec(0, n);",
      "  return best;",
      "}",
    }),
  }),
})
