local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("umap", {
    t({
      "struct CustomHash {",
      "  static uint64_t splitmix64(uint64_t x) {",
      "    x += 0x9e3779b97f4a7c15ULL;",
      "    x = (x ^ (x >> 30)) * 0xbf58476d1ce4e5b9ULL;",
      "    x = (x ^ (x >> 27)) * 0x94d049bb133111ebULL;",
      "    return x ^ (x >> 31);",
      "  }",
      "  size_t operator()(uint64_t x) const {",
      "    static const uint64_t FIXED_RANDOM = chrono::steady_clock::now().time_since_epoch().count();",
      "    return (size_t)splitmix64(x + FIXED_RANDOM);",
      "  }",
      "  size_t operator()(const pair<int, int> &p) const {",
      "    return operator()(((uint64_t)(uint32_t)p.first << 32) | (uint32_t)p.second);",
      "  }",
      "};",
      "// usage: unordered_map<long long, int, CustomHash> mp;",
    }),
  }),
})
