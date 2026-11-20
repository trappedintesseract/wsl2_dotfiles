local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("dij", {
    t({
      "template <typename G>",
      "vector<long long> dijkstra(int n, const G &adj, int src) {",
      "  vector<long long> d(n + 1, LLONG_MAX);",
      "  priority_queue<pair<long long, int>, vector<pair<long long, int>>, greater<>> pq;",
      "  d[src] = 0;",
      "  pq.push({0, src});",
      "  while (!pq.empty()) {",
      "    auto [du, u] = pq.top();",
      "    pq.pop();",
      "    if (du != d[u]) continue;",
      "    for (auto [v, w] : adj[u])",
      "      if (du + w < d[v]) {",
      "        d[v] = du + w;",
      "        pq.push({d[v], v});",
      "      }",
      "  }",
      "  return d;",
      "}",
    }),
  }),
})
