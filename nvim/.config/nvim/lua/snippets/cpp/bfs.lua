local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("bfs", {
    t({
      "template <typename G>",
      "vector<int> bfs(int n, const G &adj, int src) {",
      "  vector<int> d(n + 1, -1);",
      "  queue<int> q;",
      "  d[src] = 0;",
      "  q.push(src);",
      "  while (!q.empty()) {",
      "    int u = q.front();",
      "    q.pop();",
      "    for (int v : adj[u])",
      "      if (d[v] == -1) {",
      "        d[v] = d[u] + 1;",
      "        q.push(v);",
      "      }",
      "  }",
      "  return d;",
      "}",
    }),
  }),
})
