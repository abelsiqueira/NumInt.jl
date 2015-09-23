function sinh_tanh(f, a, b; Nf = 2^5)

  h = 18.0/Nf

  q(k) = e^(-2*sinh(k))
  subs(k) = (b - a)*q(k)/(1 + q(k))
  g(k) = 2*(b - a)*q(k)*cosh(k)/(1 + q(k))^2
  approx = f((a + b)/2)*g(0)*h

  for k = h:h:4.5
    j = subs(k)
    dxdt = g(k)
    if j < eps(Float64)
      break
    end
    f1 = f(a + j)
    f2 = f(b - j)
  approx += (f1 + f2)*dxdt*h
  end
return approx
end

function zero_to_inf(f; Nf = 2^5)

  h = 19.2/Nf

  x(k) = e^(pi*sinh(k))
  w(k) = x(k)*pi*cosh(k)
  approx = 0
  for k = -4.8:h:4.8
    f1 = f(x(k))*w(k)
    f2 = f(x(k + 1))*w(k + 1)
    approx += f1 + f2
  end
  approx = approx*h/2
  return approx
end

function simpsons_rule_inf(f, a, b; Nf = 2^5)
  h = 18/Nf
  x(t) = 1/t
  g(t) = f(x(t))/t^2
  approx = simpsons_rule(g, 1/b, 1/a, Nf = Nf)
  return approx
end

function mid_point(f, a, b; Nf = 2^5)

  n = Nf

  h = (b - a)/n
  sum = f(a + h/2)
  for i = 1:n-1
    sum += f(a + h/2 + i*h)
  end
  approx = h*sum
  return approx
end

function double_inf(f; Nf = 2^5)
  approx = 0
  h = 18/Nf
  x(k) = sinh(pi*sinh(k)/2)
  w(k) = cosh(pi*sinh(k)/2)*pi*cosh(k)/2

  for k = -4.5:h:4.5
    approx += (f(x(k))*w(k) + f(x(k + 1))*w(k + 1))*h/2
  end
  return approx
end

function simpsons_rule(f, a, b; Nf = 2^5)

  n = Nf - 1

  if n%2 != 0
    n += 1
  end
  h = (b - a)/n
  approx = (f(a) + f(b) + 4f(a + h))
  for i = 2:2:n-1
    x = a + i*h
    approx += 2f(x) + 4f(x + h)
  end
  return approx*(h/3)
end

function trapezoidal_rule(f, a, b; Nf = 2^5)

  n = Nf - 1

  h = (b - a)/n
  approx = (f(a) + f(b))/2
  for i = 1:n-1
    x = a + i*h
    approx += f(x)
  end
  return approx*h
end
