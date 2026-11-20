local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("topo", {
    t({
      "template <typename G>",
      "vector<int> topo_sort(int n, const G &adj) {",
      "  vector<int> indeg(n + 1, 0), order;",
      "  for (int u = 1; u <= n; u++)",
      "    for (int v : adj[u]) indeg[v]++;",
      "  queue<int> q;",
      "  for (int u = 1; u <= n; u++)",
      "    if (!indeg[u]) q.push(u);",
      "  while (!q.empty()) {",
      "    int u = q.front();",
      "    q.pop();",
      "    order.push_back(u);",
      "    for (int v : adj[u])",
      "      if (--indeg[v] == 0) q.push(v);",
      "  }",
      "  return order;",
      "}",
    }),
  }),
})
