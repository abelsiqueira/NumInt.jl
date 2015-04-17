include ("SR.jl")

using TimeIt

function timeSR (f)

  for (a, b) = [(0, 1), (0, 10), (-1, 1), (-10, 10)]

      println ("
      Intervalo entre $a e $b :
                ")

      for n = [2, 10, 100, 1000]

          println ("
          (n = $n):")

          @timeit SR(f, a, b, n)

          end
      end
  end

#
f(x) = 1
 println ("Tempo para f(x) = 1
          ")
 timeSR (f)
#
f(x) = x
 println ("
 Tempo para f(x) = x
          ")
 timeSR (f)
#
f(x) = x^2
 println ("
 Tempo para f(x): = x^2
          ")
 timeSR (f)
#
f(x) = x^3
 println ("
 Tempo para f(x) = x^3
          ")
 timeSR (f)
#
f(x) = x^4
 println ("
 Tempo para f(x) = x^4
          ")
 timeSR (f)
#
f(x) = e^x
 println ("
 Tempo para f(x) = e^x
          ")
 timeSR (f)
