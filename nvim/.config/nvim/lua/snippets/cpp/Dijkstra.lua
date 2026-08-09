local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("dijk", {
    t({
      "struct Dijkstra {",
      "    int n;",
      "    vector<vector<pair<int, long long>>> adj;",
      "    vector<long long> dist;",
      "",
      "    Dijkstra(int n) : n(n) {",
      "        adj.assign(n, {});",
      "        dist.assign(n, LLONG_MAX);",
      "    }",
      "",
      "    void add_edge(int u, int v, long long w) {",
      "        adj[u].push_back({v, w});",
      "    }",
      "",
      "    void run(int src) {",
      "        priority_queue<pair<long long, int>,",
      "                       vector<pair<long long, int>>,",
      "                       greater<pair<long long, int>>> pq;",
      "",
      "        dist[src] = 0;",
      "        pq.push({0, src});",
      "",
      "        while (!pq.empty()) {",
      "            auto [d, v] = pq.top();",
      "            pq.pop();",
      "",
      "            if (d != dist[v]) continue;",
      "",
      "            for (auto [to, w] : adj[v]) {",
      "                if (dist[to] > d + w) {",
      "                    dist[to] = d + w;",
      "                    pq.push({dist[to], to});",
      "                }",
      "            }",
      "        }",
      "    }",
      "};",
    }),
  }),
})
