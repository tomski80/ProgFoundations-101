# stack minature leanguage
#
# first we need a stack - let it be array then


def minilang(prog)
  stack = Array.new
  reg = 0

  instructions = prog.split(' ')

  #read instructions
  instructions.each do |instr|
    case instr
    when 'PUSH'
      stack.push(reg)
    when 'ADD'
      reg += stack.pop
    when 'SUB'
      reg -= stack.pop
    when 'MULT'
      reg *= stack.pop
    when 'DIV'
      reg /= stack.pop
    when 'MOD'
      reg = reg % stack.pop
    when 'POP'
      reg = stack.pop
    when 'PRINT'
      puts reg
    else
      if instr.to_i.to_s == instr
        reg = instr.to_i
      else
        puts "Syntax error! Program interupted!"
        return -1
      end
    end
  end
  return nil
end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')

minilang('PRINT 3')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
