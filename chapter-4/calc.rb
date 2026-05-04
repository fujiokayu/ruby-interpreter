require "minruby"

# tree = minruby_parse("(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)")
# pp(tree)

def evaluate(tree)
  case tree[0]
  when "lit"
    tree[1]
  when "+"
    evaluate(tree[1]) + evaluate(tree[2])
  when "-"
    evaluate(tree[1]) - evaluate(tree[2])
  when "*"
    evaluate(tree[1]) * evaluate(tree[2])
  when "/"
    evaluate(tree[1]) / evaluate(tree[2])
  when "%"
    evaluate(tree[1]) % evaluate(tree[2])
  when "**"
    evaluate(tree[1]) ** evaluate(tree[2])
  end
end

str = gets
tree = minruby_parse(str)

answer = evaluate(tree)
p(answer)