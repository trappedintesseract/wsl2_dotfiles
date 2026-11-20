local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("bfsgrid", {
    t({
      "template <typename G>",
      "vector<vector<int>> bfs_grid(int n, int m, const G &grid, int sr, int sc) {",
      "  int dr[] = {-1, 1, 0, 0}, dc[] = {0, 0, -1, 1};",
      "  vector<vector<int>> dist(n, vector<int>(m, -1));",
      "  queue<pair<int, int>> q;",
      "  dist[sr][sc] = 0;",
      "  q.push({sr, sc});",
      "  while (!q.empty()) {",
      "    auto [r, c] = q.front();",
      "    q.pop();",
      "    for (int d = 0; d < 4; d++) {",
      "      int nr = r + dr[d], nc = c + dc[d];",
      "      if (nr < 0 || nr >= n || nc < 0 || nc >= m) continue;",
      "      if (grid[nr][nc] == '#' || dist[nr][nc] != -1) continue;",
      "      dist[nr][nc] = dist[r][c] + 1;",
      "      q.push({nr, nc});",
      "    }",
      "  }",
      "  return dist;",
      "}",
    }),
  }),
})
