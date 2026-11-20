local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("simanneal", {
    t({
      "template <typename State, typename ScoreF, typename NeighF>",
      "State simulated_annealing(State start, ScoreF score, NeighF neighbour, int iterations, double t_start, double t_end) {",
      "  mt19937_64 rng(chrono::steady_clock::now().time_since_epoch().count());",
      "  uniform_real_distribution<double> uni(0.0, 1.0);",
      "  State cur = start, best = start;",
      "  double curScore = score(cur), bestScore = curScore;",
      "  for (int it = 0; it < iterations; it++) {",
      "    double t = t_start * pow(t_end / t_start, (double)it / (double)max(1, iterations));",
      "    State cand = neighbour(cur, rng);",
      "    double s = score(cand);",
      "    if (s < curScore || uni(rng) < exp((curScore - s) / max(t, 1e-12))) {",
      "      cur = cand;",
      "      curScore = s;",
      "      if (s < bestScore) {",
      "        best = cand;",
      "        bestScore = s;",
      "      }",
      "    }",
      "  }",
      "  return best;",
      "}",
    }),
  }),
})
