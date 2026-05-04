require "minruby"

# tree = minruby_parse("(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)")
# pp(tree)

def evaluate(tree, env)
  case tree[0]
  when "lit"
    tree[1]
  when "+"
    evaluate(tree[1], env) + evaluate(tree[2], env)
  when "-"
    evaluate(tree[1], env) - evaluate(tree[2], env)
  when "*"
    evaluate(tree[1], env) * evaluate(tree[2], env)
  when "/"
    evaluate(tree[1], env) / evaluate(tree[2], env)
  when "%"
    evaluate(tree[1], env) % evaluate(tree[2], env)
  when "**"
    evaluate(tree[1], env) ** evaluate(tree[2], env)
  when "func_call"
    p(evaluate(tree[2], env))
  when "stmts" # statements
    i = 1
    last = nil
    while tree[i]
      last = evaluate(tree[i], env)
      i = i + 1
    end
    last
  when "var_assign"
    env[tree[1]] = evaluate(tree[2], env)
  when "var_ref"
    env[tree[1]]
  else
    raise "Unknown node type: #{tree[0].inspect}, tree=#{tree.inspect}"
  end
end

str = minruby_load()
tree = minruby_parse(str)

env = {}
evaluate(tree, env)
