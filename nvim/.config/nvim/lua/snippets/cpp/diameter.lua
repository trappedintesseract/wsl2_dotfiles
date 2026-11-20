local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("diameter", {
    t({
      "template <typename G>",
      "array<int, 3> tree_diameter(int n, const G &adj) {",
      "  auto far = [&](int src) {",
      "    vector<int> d(n + 1, -1);",
      "    queue<int> q;",
      "    d[src] = 0;",
      "    q.push(src);",
      "    int best = src;",
      "    while (!q.empty()) {",
      "      int u = q.front();",
      "      q.pop();",
      "      if (d[u] > d[best]) best = u;",
      "      for (int v : adj[u])",
      "        if (d[v] == -1) {",
      "          d[v] = d[u] + 1;",
      "          q.push(v);",
      "        }",
      "    }",
      "    return pair{best, d[best]};",
      "  };",
      "  int a = far(1).first;",
      "  auto b = far(a);",
      "  return {b.second, a, b.first};",
      "}",
    }),
  }),
})
