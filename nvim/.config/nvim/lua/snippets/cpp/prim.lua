local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("prim", {
    t({
      "template <typename G>",
      "long long prim(int n, const G &adj, int start) {",
      "  vector<int> used(n + 1, 0);",
      "  priority_queue<pair<long long, int>, vector<pair<long long, int>>, greater<>> pq;",
      "  pq.push({0, start});",
      "  long long total = 0;",
      "  while (!pq.empty()) {",
      "    auto [w, u] = pq.top();",
      "    pq.pop();",
      "    if (used[u]) continue;",
      "    used[u] = 1;",
      "    total += w;",
      "    for (auto [v, c] : adj[u])",
      "      if (!used[v]) pq.push({c, v});",
      "  }",
      "  return total;",
      "}",
    }),
  }),
})
