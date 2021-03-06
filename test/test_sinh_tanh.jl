function test_precision(g, a, b, exact)
  approx=sinh_tanh(g, a, b, n = 10)
  @test_approx_eq_eps(exact, approx, 1e-7)
end

function test_sinh_tanh()

  g(t) = t*log(1 + t)
  (a, b) = (0, 1.0)
  exact = 1/4
  test_precision(g, a, b, exact)

  g(t) = t^2*atan(t)
  (a, b) = (0, 1.0)
  exact = (pi - 2 + 2log(2))/12
  test_precision(g, a, b, exact)

  g(t) = e^t*cos(t)
  (a, b) = (0, pi/2)
  exact = (e^(pi/2) - 1)/2
  test_precision(g, a, b, exact)

  g(t) = atan(sqrt(2 + t^2))/((1 + t^2)*sqrt(2 + t^2))
  (a, b) = (0, 1.0)
  exact = 5*pi^2/96
  test_precision(g, a, b, exact)

  g(t) = sqrt(t)/sqrt(1 - t^2)
  (a, b) = (0, 1.0)
  exact = 2*sqrt(pi)*gamma(3/4)/gamma(1/4)
  test_precision(g, a, b, exact)

end

test_sinh_tanh()