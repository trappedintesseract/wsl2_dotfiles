local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("lichao", {
    t({
      "struct LiChao {",
      "  struct Line {",
      "    long long m, b;",
      "    long long at(long long x) const { return m * x + b; }",
      "  };",
      "  int n;",
      "  vector<Line> t;",
      "  vector<char> has;",
      "  LiChao(int n) : n(n), t(4 * n), has(4 * n, 0) {}",
      "  void add_line(Line nl) { add(nl, 1, 0, n - 1); }",
      "  void add(Line nl, int node, int lo, int hi) {",
      "    if (!has[node]) {",
      "      t[node] = nl;",
      "      has[node] = 1;",
      "      return;",
      "    }",
      "    int mid = (lo + hi) / 2;",
      "    bool leftBetter = nl.at(lo) > t[node].at(lo);",
      "    bool midBetter = nl.at(mid) > t[node].at(mid);",
      "    if (midBetter) swap(t[node], nl);",
      "    if (lo == hi) return;",
      "    if (leftBetter != midBetter) add(nl, 2 * node, lo, mid);",
      "    else add(nl, 2 * node + 1, mid + 1, hi);",
      "  }",
      "  long long query(int x) const { return query(x, 1, 0, n - 1); }",
      "  long long query(int x, int node, int lo, int hi) const {",
      "    if (!has[node]) return LLONG_MIN;",
      "    long long res = t[node].at(x);",
      "    if (lo == hi) return res;",
      "    int mid = (lo + hi) / 2;",
      "    if (x <= mid) return max(res, query(x, 2 * node, lo, mid));",
      "    return max(res, query(x, 2 * node + 1, mid + 1, hi));",
      "  }",
      "};",
    }),
  }),
})
