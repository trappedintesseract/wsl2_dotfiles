local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("dcopt", {
    t({
      "template <typename CostF>",
      "long long dc_opt_dp(int N, int K, CostF cost) {",
      "  const long long INF = (long long)4e18;",
      "  vector<long long> prev(N + 1, INF), cur(N + 1, INF);",
      "  prev[0] = 0;",
      "  for (int g = 1; g <= K; g++) {",
      "    fill(cur.begin(), cur.end(), INF);",
      "    function<void(int, int, int, int)> go = [&](int lo, int hi, int optL, int optR) {",
      "      if (lo > hi) return;",
      "      int mid = (lo + hi) / 2;",
      "      long long best = INF;",
      "      int bestK = optL;",
      "      int from = max(optL, g - 1), to = min(optR, mid - 1);",
      "      for (int k = from; k <= to; k++) {",
      "        if (prev[k] >= INF) continue;",
      "        long long cand = prev[k] + cost(k + 1, mid);",
      "        if (cand < best) {",
      "          best = cand;",
      "          bestK = k;",
      "        }",
      "      }",
      "      cur[mid] = best;",
      "      go(lo, mid - 1, optL, bestK);",
      "      go(mid + 1, hi, bestK, optR);",
      "    };",
      "    go(1, N, 0, N - 1);",
      "    swap(prev, cur);",
      "  }",
      "  return prev[N];",
      "}",
    }),
  }),
})
