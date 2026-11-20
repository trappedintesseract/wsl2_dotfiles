local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("mos", {
    t({
      "template <typename AddF, typename RemF, typename GetF>",
      "vector<long long> mo_algorithm(const vector<int> &a, const vector<array<int, 3>> &queries, AddF add, RemF remove, GetF get) {",
      "  int q = (int)queries.size();",
      "  vector<int> ord(q);",
      "  iota(ord.begin(), ord.end(), 0);",
      "  int block = max(1, (int)((double)a.size() / sqrt((double)max(1, q))));",
      "  sort(ord.begin(), ord.end(), [&](int x, int y) {",
      "    int bx = queries[x][0] / block, by = queries[y][0] / block;",
      "    if (bx != by) return bx < by;",
      "    return (bx & 1) ? queries[x][1] > queries[y][1] : queries[x][1] < queries[y][1];",
      "  });",
      "  vector<long long> ans(q);",
      "  int curL = 0, curR = 0;",
      "  for (int qi : ord) {",
      "    int l = queries[qi][0], r = queries[qi][1];",
      "    while (curL > l) add(--curL);",
      "    while (curR < r) add(curR++);",
      "    while (curL < l) remove(curL++);",
      "    while (curR > r) remove(--curR);",
      "    ans[queries[qi][2]] = get();",
      "  }",
      "  return ans;",
      "}",
    }),
  }),
})
