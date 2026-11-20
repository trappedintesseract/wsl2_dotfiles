local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {

  s("point", {
    t({
      "struct Point {",
      "  long long x, y;",
      "  Point(long long x_ = 0, long long y_ = 0) : x(x_), y(y_) {}",
      "  Point operator+(const Point &o) const { return Point(x + o.x, y + o.y); }",
      "  Point operator-(const Point &o) const { return Point(x - o.x, y - o.y); }",
      "  Point operator*(long long k) const { return Point(x * k, y * k); }",
      "  long long dot(const Point &o) const { return x * o.x + y * o.y; }",
      "  long long cross(const Point &o) const { return x * o.y - y * o.x; }",
      "  long long norm2() const { return x * x + y * y; }",
      "  bool operator<(const Point &o) const { return x != o.x ? x < o.x : y < o.y; }",
      "  bool operator==(const Point &o) const { return x == o.x && y == o.y; }",
      "};",
      "",
      "int orientation(const Point &a, const Point &b, const Point &c) {",
      "  long long v = (b - a).cross(c - a);",
      "  return v > 0 ? 1 : (v < 0 ? -1 : 0);",
      "}",
    }),
  }),
})
